<?php

class Donate extends MX_Controller
{
	function __construct()
	{
		//Call the constructor of MX_Controller
		parent::__construct();

		//Make sure that we are logged in
		$this->user->userArea();

		$this->load->config('donate');

		$this->load->helper('url');

		$this->load->helper('string');

		$this->load->library('encrypt');
	}

	public function index()
	{
		requirePermission("view");

		$this->template->setTitle(lang("donate_title", "donate"));

		$donate_jahanpay = $this->config->item('donate_jahanpay');
		$donate_paygol = $this->config->item('donate_paygol');

		$user_id = $this->user->getId();

		$data = array(
			"donate_jahanpay" => $donate_jahanpay,
			"donate_paygol" => $donate_paygol,
			"user_id" => $user_id,
			"server_name" => $this->config->item('server_name'),
			"currency" => $this->config->item('donation_currency'),
			"currency_sign" => $this->config->item('donation_currency_sign'),
			"multiplier" => $this->config->item('donation_multiplier'),
			"multiplier_paygol" => $this->config->item('donation_multiplier_paygol'),
			"url" => pageURL
		);

		$output = $this->template->loadPage("donate.tpl", $data);

		$this->template->box("<span style='cursor:pointer;' onClick='window.location=\"".$this->template->page_url."ucp\"'>".lang("ucp")."</span> &rarr; ".lang("donate_panel", "donate"), $output, true, "modules/donate/css/donate.css", "modules/donate/js/donate.js");
	}

	public function success()
	{
		$this->user->getUserData();

		$page = $this->template->loadPage("success.tpl", array('url' => $this->template->page_url));

		$this->template->box(lang("donate_thanks", "donate"), $page, true);
	}
	public function unsuccess(){
		$error_code =$this->session->userdata('errorcode');
		$message = $this->getmessage($error_code);
		$page = $this->template->loadPage("unsuccess.tpl", array('message' => $message));
		$this->session->unset_userdata('errorcode');
		$this->template->box($message, $page, true);
	}
	public function onlinepay(){
		$amount = $this->input->post('amount', TRUE);
		$orderID = $this->input->post('custom', TRUE).random_string('nozero',11);
		$eamount = $this->encrypt->encode($amount, $this->config->item('jahanpay_secret_key'));
		$this->session->set_userdata('Orderno', $orderID);
		$this->session->set_userdata('randme', $eamount);
		$this->requestpay($amount,$orderID);
	}
	public function requestpay( $amount, $orderId){
		$client = new SoapClient($this->config->item('jahanpay_payment_gateway'));
		$api = $this->config->item('jahanpay_api');
		$amount = $amount ; //Tooman
		$callbackUrl = $this->config->item('jahanpay_calback');
		$orderId = $orderId;
		$txt = urlencode("شارژ حساب کاربری کاربر با آی دی".$this->input->post('custom'));
		$res = $client->requestpayment($api , $amount , $callbackUrl , $orderId , $txt);
		redirect("http://www.jahanpay.com/pay_invoice/{$res}");

	}
	private function getmessage($error_code){
		$errorCode = array(
			-20=>'api نامعتبر است' ,
			-21=>'آی پی نامعتبر است' ,
			-22=>'مبلغ از کف تعریف شده کمتر است' ,
			-23=>'مبلغ از سقف تعریف شده بیشتر است' ,
			-24=>'مبلغ نامعتبر است' ,
			-6=>'ارتباط با بانک برقرار نشد' ,
			-26=>'درگاه غیرفعال است' ,
			-27=>'آی پی شما مسدود است' ,
			-9=>'خطای ناشناخته' ,
			-29=>'آدرس کال بک خالی است ' ,
			-30=>'چنین تراکنشی یافت نشد' ,
			-31=>'تراکنش انجام نشده ' ,
			-32=>'تراکنش انجام شده اما مبلغ نادرست است ' ,
			//1 => "تراکنش با موفقیت انجام شده است " ,
		);
		return $errorCode[$error_code];
	}

}
