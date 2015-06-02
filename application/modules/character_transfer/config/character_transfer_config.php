<?php

/* 
*  Character Transfer Price
*/
$config['cta_price'] = 5000;

/* 
*  Character Transfer Price Currency
*  Usage:
*   - 'dp'
*   - 'vp'
*/
$config['cta_price_currency'] = 'dp';

/* 
*  Maximum characters per account
*/
$config['cta_characters_limit'] = 10;

/*
*  Language strings
*/
$config['cta_language'] = array(

'TITLE'		  => 'انتقال هیرو به اکانت دیگر',
'DESCRIPTION'	  => 'با استفاده از این قسمت از سایت میتوانید هیروهای خود را به اکانت دیگر منتقل کنید',

'KEYWORDS'	  => 'character,transfer,charactertransfer,account',
'REALM'		  => 'ریلم ',
'CHARACTER'	  => 'هیرو ',
'DEST_ACC'	  => 'اکانت مقصد ',
'PLS_SELECT'	  => 'لطفاً انتخاب کنید',
'TRANSFER'	  => 'انتقال',
'DP'		  => 'تومان',
'VP'		  => 'VP',
'COST_EXPL'	  => 'هزینه انتقال : <strong>[PRICE] [CURRENCY]</strong>',
'SELECT_CHAR'	  => 'لطفاً یک هیرو انتخاب کنید',
'ENTER_DEST_ACC'  => 'لطفاً اکانت مقصد',
'ERROR_REALM'	  => 'ریلم انتخاب شده معتبر نیست',
'ERROR_CHARACTER' => 'هیروی انتخاب شده معتبر نیست',
'ERROR_BELONGS'	  => 'هیروی انتخاب شده متعلق به شما نیست',
'ERROR_ONLINE'	  => 'هیروی انتخابی آنلاین میباشد, به منظور انتقال آن را آفلاین کنید',

'ERROR_DEST_ACC'  => 'اکانت مقصد معتبر نمیباشد',
'ERROR_DEST_ME'	  => 'اکانت مقصد متعلق به شما میباشد',

'ERROR_CHAR_LIMIT'=> 'ظرفیت اکانت مقصد تکمیل میباشد',

'ERROR_PRICE_DP'  => 'شما اعتبار کافی برای این کار را ندارید',
'ERROR_PRICE_VP'  => 'شما اعتبار کافی برای این کار را ندارید',

'ERROR_WEB_FAIL'  => 'خطا, مجدداً تلاش کنید',

'SUCCESS_MSG'	  => 'هیرو <strong>[CHARACTER]</strong> در ریلم <strong>[REALM_NAME]</strong> با موفقیت به اکانت <strong>[ACCOUNT] منتقل شد</strong>.',

'LINK_GO_UCP'	  => 'بازگشت به کنترل پنل',

'BANNED_MSG'	=> 'اکانت شما مسدود میباشد'
);













/*******************************************************************/
/******************* DO NOT CHANGE BELOW ***************************/
/*******************************************************************/
$config['force_code_editor'] = true;