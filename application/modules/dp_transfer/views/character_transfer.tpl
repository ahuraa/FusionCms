<!--[if LT IE 8]>
<script type="text/javascript">
	function Initialize()
	{
		if (typeof CharacterTransfer != "undefined")
		{
			CharacterTransfer.Initialize({$first_realm.id});
			CharacterTransfer.LANG_SELECT_CHAR = '{$cta_lang.SELECT_CHAR}';
			CharacterTransfer.LANG_SELECT_DEST = '{$cta_lang.ENTER_DEST_ACC}';
		}
		else
		{
			setTimeout(Initialize, 100);
		}
	}

	$(document).ready(function()
	{
		Initialize();
	});
</script>
<![endif]-->
<section id="character_transfer">
	
    
    <div id="cta_body">
    	
        <div class="cta_body_left">
        
         <div class="cta_row">
                    <span>حساب مبدا:</span>
                    <input type="text" name="Origin_account" id="Origin_account" readonly="readonly" =""  value="{$username}" />
                </div>
   
<div class="cta_row">
                    <span>لطفا موجودی مورد نظر را انتخاب کنید:</span>
                    <select name="DP_transfer" id="DP_transfer">
                    <option disabled="disabled" selected="selected">انتخاب موجودی</option>
                    
                      
                            <option value="2000">2000 تومان </option>
                            <option value="5000">5000 تومان</option>
                            <option value="7000">7000 تومان</option>
                            <option value="9000">9000 تومان</option>
                            <option value="11000">11000 تومان</option>
                   
                </select>
                </div>

        	
            

        </div>
        <div class="cta_body_middle"></div>
        <div class="cta_body_right">
        	<form onsubmit="CharacterTransfer.Submit(); return false;">
                <div class="cta_row">
                    <span>{$cta_lang.DEST_ACC}:</span>
                    <input type="text" name="account" id="cta_dest_account" onkeyup="return CharacterTransfer.DestAccountUpdate(this);"  />
                </div>
                
                <div class="cta_row">
                   {if $price > 0}این عمل از حساب شما {$price} تومان موجودی کم خواهد کرد{else}این عملیات رایگان میباشد{/if}
                </div>
                
                <div class="cta_row" align="center">
                    <input type="submit" value="انتقال موجودي" />
                </div>
            </form>
        </div>
        
        <div class="clear"></div>
    </div>
</section>
