<?php

class dp_transfer extends MX_Controller
{
	private $js;
	private $css;
	
	private $language;
	
	const MODULE_NAME			= 'dp_transfer';
	const MODULE_PATH 			= 'modules/dp_transfer';
	
	function __construct()
	{
		parent::__construct();
		
		$this->user->userArea();
		
		// Set JS and CSS paths
		$this->js 	= self::MODULE_PATH . "/js/character_transfer.js";
		$this->css 	= self::MODULE_PATH . "/css/character_transfer.css";
		
		$this->load->model("character_transfer_model");

		$this->load->config('character_transfer_config');
		
		// Format the language strings
		$this->language = $this->config->item('cta_language');
	//	$this->price=$this->config->item('cta_price');
		//$this->FormatLanguage();
		
		if ($this->user->getAccountStatus() != 'Active')
		{
			$this->BannedPage();
			die;
		}
	}
	
	
	
	/**
	 * Initialize
	 */
	public function index()
	{
		requirePermission("use_cta");
		
		$this->template->setTitle($this->language['TITLE']);
		
		// Prepare the compitable realms
		
		
		// Set the page data
		$pageData = array(
			"url" 				=> $this->template->page_url,
			"cta_lang"			=> $this->language,
			"price"				=> $this->config->item('cta_price'),
			
			"username"          =>$this->user->getUsername()
		);
		
		
		
		$pageTpl = $this->template->loadPage("character_transfer.tpl", $pageData);

		$data = array(
			"module" => "default", 
			"headline" => $this->language['TITLE'],
			"content" => $pageTpl
		);

		$page = $this->template->loadPage("page.tpl", $data);
		
	//	$keywords = $this->language['KEYWORDS'];
	//	$description = $this->language['DESCRIPTION'];
		
		//$this->template->setDescription($description);
	//	$this->template->setKeywords($keywords);

		$this->template->view($page, $this->css, $this->js);
	}
	
	public function success($dp_transfer,$account)
	{
		requirePermission("use_cta");
		
		
		
		$account = preg_replace("/[^a-zA-z0-9_-]/", "", ucfirst(strtoupper($account)));
		
		

		$this->template->setTitle($this->language['TITLE']);
		
		$Origin_account=$this->user->getUsername();

		
		// Fomat the success language message
		$this->language['SUCCESS_MSG'] = str_replace(array('[dp_transfer]','[Origin_account]','[ACCOUNT]'), array($dp_transfer,$Origin_account, $account), $this->language['SUCCESS_DP']);
		
		// Set the page data
		$pageData = array(
			"url" 				=> $this->template->page_url,
			"Origin_account"	=> $Origin_account,
			"DP"			    => $dp_transfer,
			"account"			=> $account,
			"cta_lang"			=> $this->language
		);
		
		$pageTpl = $this->template->loadPage("character_transfer_success.tpl", $pageData);

		$data = array(
			"module" => "default", 
			"headline" => $this->language['TITLE'],
			"content" => $pageTpl
		);

		$page = $this->template->loadPage("page.tpl", $data);
		
		//$keywords = $this->language['KEYWORDS'];
	//	$description = 'The character ' . $character . ' from realm '.$realm.' has been successfully transferred to account '.$account.'.';
		
		$description =$dp_transfer.' points on your account'.$Origin_account.' to the destination account'.$account.' transfer was successful.';

		$this->template->setDescription($description);
		//$this->template->setKeywords($keywords);

		$this->template->view($page, $this->css, false);
	}
	
	private function ErrorPage()
	{
		$this->template->setTitle("An error occured!");

		$data = array(
			"module" => "default", 
			"headline" => 'An error occured!', 
			"content" => "<center style='margin:10px;font-weight:bold;'>This module cannot work with no realms.</center>"
		);

		$page = $this->template->loadPage("page.tpl", $data);

		$this->template->view($page);
	}
	
	private function BannedPage()
	{
		$this->template->setTitle("An error occured!");

		$data = array(
			"module" => "default", 
			"headline" => 'An error occured!', 
			"content" => "<center style='margin:10px;font-weight:bold;'>" . (isset($this->language['BANNED_MSG']) ? $this->language['BANNED_MSG'] : 'Your account is banned!') . "</center>"
		);

		$page = $this->template->loadPage("page.tpl", $data);

		$this->template->view($page);
	}
	
	public function process()
	{
		requirePermission("use_cta");
		
		$this->load->helper(array('form', 'url'));
		$this->load->library('form_validation');
		
		// Get the post variables
		
		$dp_transfer = (int)$this->input->post('DP_tran');

		$destination = $this->input->post('destination');
		
		

		$Price = (int)$this->config->item('cta_price');
	
		

		//Load the form validations for if they tried to sneaky bypass our js system
		$this->form_validation->set_rules('destination', 'destination account', 'trim|required|min_length[3]|max_length[14]|xss_clean|alpha_numeric');
		
		// Validate the destination account
		if ($this->form_validation->run() == false)
		{
			die(form_error('destination'));
		}
		
		
		
		
		// Validate the destination account
		if (!($DestAccID = $this->external_account_model->getId($destination)))
		{
			die($this->language['ERROR_DEST_ACC']);
		}
		
		// Check if the destination is our acc (prevent user mistakes)
		if ((int)$DestAccID == (int)$this->user->getId())
		{
			die($this->language['ERROR_DEST_ME']);
		}
		
       


		if ($this->user->getDp() < ($dp_transfer + $Price))
		{

           die($this->language['ERROR_PRICE_DP']);


		}




$StartDP = $this->character_transfer_model->GetDPAccount($DestAccID);
$StartCurrency = $this->user->getDp();


if ($StartCurrency - ($dp_transfer + $Price) == 0)
		{

           die($this->language['ERROR_DP_LIMIT']);


		}

 $this->internal_user_model->setDp($DestAccID,$dp_transfer + $StartDP);

 $this->user->setDp($StartCurrency - ($dp_transfer + $Price));

 $EndCurrency = $this->user->getDp();


 if ($this->character_transfer_model->InsertLog($DestAccID, ucfirst(strtolower($destination)),
 	  $Price, $StartCurrency, $EndCurrency ,$dp_transfer))
{

die('OK');

}

else
{
	die('Error In Database');
}



			
		
	}
	
	
}
