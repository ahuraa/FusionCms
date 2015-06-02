<?php

/*
|--------------------------------------------------------------------------
| General settings
|--------------------------------------------------------------------------
*/

$config['donation_currency'] = "USD"; // Remember to change the currency ON PayGol as well!
$config['donation_currency_sign'] = "$";


$config['jahanpay_payment_gateway'] = "http://www.jahanpay.com/webservice?wsdl";
$config['jahanpay_api'] = "";
$config['jahanpay_calback'] = "http://myserver.ir/donate/postback_jahanpay";
$config['jahanpay_secret_key'] = "QVBIUY12ZTJgcsAG8GZl8pdww";
$config['donate_jahanpay'] = array(
'use' => true, // true: enable | false: disable
'postback_url' => "http://YOURSERVER.COM/donate/postback_paypal",
'return_url' => "http://YOURSERVER.COM/donate/success",
'email' => "CHANGEME@example.com",
'sandbox' => false, // false: live servers | true: testing/dev servers

'values' => array(

	// Format: PRICE => DP
	// Example: 5 => 15 which would cause 5 USD
	// (or your specified currency) to give 15 DP

	500 => 500,
	1000 => 1000,
	5000 => 5000,
	10000 => 10000,
	15000 => 15000,
	20000 => 20000,
	30000 => 30000,
	40000 => 40000,
	50000 => 50000,
	100000 => 100000,
	150000 => 150000,
	200000 => 200000,
	250000 => 250000,
	500000 => 500000,

),

);

// Touch it and I'll kill you! >:(
$config['force_code_editor'] = true;