<?php

class Character_transfer_model extends CI_Model
{
	
	
	public function InsertLog($DestAccID, $DestAccName, $Price,$StartCurrency, $EndCurrency ,$dp_transfer)
	{
		$query = $this->db->query("	INSERT INTO `dpta_logs` 
			(`account`, `account_name`,`dest_account`, `dest_account_name`, `start_currency`, `end_currency`, `DP_ponits`,`DP_transfer_price`, `time`) 
			VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);", 
			array($this->user->getId(), ucfirst(strtolower($this->user->getNickname())), $DestAccID, $DestAccName, $StartCurrency, $EndCurrency,$Price,$dp_transfer ,time()));
		
		if ($query)
		{
			return true;
		}
		
		return false;
	}
	
	public function GetLogsCount()
	{
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `dpta_logs`;");
		
		if ($query && $query->num_rows() > 0)
		{
			$results = $query->result_array();
			
			return (int)$results[0]['total'];
		}
		
		return 0;
	}
	
	public function GetLogs($Limit)
	{
		$query = $this->db->query("SELECT * FROM `dpta_logs` ORDER BY `time` DESC LIMIT ".$Limit.";");
		
		if ($query && $query->num_rows() > 0)
		{
			return $query->result_array();
		}
		
		return false;
	}
	
	public function SearchLogs($string)
	{
		$query = $this->db->query("SELECT * FROM `dpta_logs` WHERE 
			`account_name` LIKE ?
			
			 OR `dest_account_name` LIKE ? 

			 ORDER BY `time` DESC;", array($string, $string));
		
		if ($query && $query->num_rows() > 0)
		{
			return $query->result_array();
		}
		
		return false;
	}

	public function GetDPAccount ($id)


	{


            $query = $this->db->query("SELECT * FROM account_data where id=$id");
 


		if($query->num_rows() > 0)
		{
			$result = $query->result_array();
			 
			
		return	 $result[0]['dp'];
		

		}
        else
        {
 $this->external_account_model->getUsername($id);
        	die("Please log in to your account ".$this->external_account_model->getUsername($id)." , your information has not been logged");

        }	

      

	}
}