<?php

class Postback_jahanpay extends MX_Controller
{
	// User values
	private $custom;
	private $payment_status;
	private $payment_amount;
	private $payment_currency;
	private $txn_id;
	private $receiver_email;
	private $payer_email;
	private $pending_reason;

	private $user_id;
	private $order_id;
	private $au_key;

	// Config values
	private $config_paypal;

	// Debug
	private $debug = false;

	/**
	 * Initialize and prevent direct access
	 */
	public function __construct()
	{
		parent::__construct();

		$this->load->config('donate');
		$this->config_paypal = $this->config->item('donate_jahanpay');

		$this->load->library('encrypt');
		$this->load->helper('url');

		$this->load->helper('string');

		$this->load->library('encrypt');
		// Prevent direct access
		if(count($_GET) == 0)
		{

				die("No access");
		}
	}

	/**
	 * Process the request
	 */
	public function index()
	{
//		$r=$this->encrypt->decode($this->session->userdata('randme'), $this->config->item('jahanpay_secret_key'));
//		print_r($r);
//		exit();
		// Create our request string

		// Gather the values we need
		$this->custom =  substr($this->input->get('order_id', TRUE),0,-11);
		$this->user_id =  substr($this->input->get('order_id', TRUE),0,-11);
		$this->order_id =$this->input->get('order_id', TRUE);
		$this->payment_amount = $this->encrypt->decode($this->session->userdata('randme'), $this->config->item('jahanpay_secret_key'));
		$this->au_key = $this->input->get('au', TRUE);
 		$res = $this->verifiypayment();

		if(!$res)
		{
			//HTTP ERROR, Could not connect to paypal.
			$error = 'Http error happened, could not connect to gateway.';
		}
		else
		{
				//If no errors where posted, process payment and add points.
				if($res == 1)
				{
					// Update the account with the given money multiplied by the money multiplier
					$dpReward = $this->getDpAmount();

					// Update account with donation points
					$this->db->query("UPDATE `account_data` SET `dp` = `dp` + ? WHERE `id` = ?", array($dpReward, $this->custom));

					// Update the transaction log and set validated to 1
					$validated = 1;

					$this->updateMonthlyIncome();
				}
				else
				{
					$this->session->set_userdata('errorcode', $res);
					redirect('donate/unsuccess');
				}


			//insert the logs
			// Gather our database log datas, insert here already because of validation.
			$data = array(
				"order_id" => $this->input->get('order_id', TRUE),
				"amount" => $this->payment_amount,
				"user_id" => $this->user_id,
				"payment_status" => $res,
				"date" => time()
			);

			//$this->plugins->onDonationPostback($data['user_id'], $validated, $data['payment_amount'], $this->getDpAmount());
			$this->db->insert("jahanpay_logs", $data);
			redirect('donate/success');
			die();
		}
	}

	/**
	 * Get the amount of DP
	 */
	private function getDpAmount()
	{
		$config = $this->config->item('donate_jahanpay');

		$points = 0;

		foreach($config['values'] as $price => $reward)
		{
			if($price == round($this->payment_amount))
			{
				$points = $reward;
			}
		}

		return $points;
	}

	/**
	 * Check if a transaction exists
	 * @param String $txn_id
	 * @return Boolean
	 */
	private function transactionExists($txn_id)
	{
		$query = $this->db->query("SELECT COUNT(*) as `total` FROM paypal_logs WHERE txn_id=?", array($txn_id));

		if($query->num_rows() > 0)
		{
			$row = $query->result_array();

			if($row[0]['total'] > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
	}

	/**
	 * Check if a transaction is already validated
	 * @param String $txn_id
	 * @return Boolean
	 */
	private function transactionIsAlreadyValidated($txn_id)
	{
		$query = $this->db->query("SELECT COUNT(*) AS `total` FROM paypal_logs WHERE validated = 1 AND txn_id=?", array($txn_id));

		if($query->num_rows() > 0)
		{
			$row = $query->result_array();

			return ($row[0]['total'] > 0);
		}

		return false;
	}

	private function updateMonthlyIncome()
	{
		$query = $this->db->query("SELECT COUNT(*) AS `total` FROM monthly_income WHERE month=?", array(date("Y-m")));

		$row = $query->result_array();

		if($row[0]['total'])
		{
			$this->db->query("UPDATE monthly_income SET amount = amount + ".floor($this->payment_amount)." WHERE month=?", array(date("Y-m")));
		}
		else
		{
			$this->db->query("INSERT INTO monthly_income(month, amount) VALUES(?, ?)", array(date("Y-m"), floor($this->payment_amount)));
		}
	}

	private function verifiypayment(){
		$api = $this->config->item('jahanpay_api');
		$amount = $this->payment_amount ;
		$client = new SoapClient($this->config->item('jahanpay_payment_gateway'));
		$result = $client->verification($api,$amount,$this->au_key);
		return $result;
	}
}
