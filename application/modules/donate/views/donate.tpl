<div id="donate">
		{if $donate_jahanpay.use}
		<section id="paypal_area">
		<form method="post" action="{$url}donate/jahanpay" class="page_form">
		<img style="float:left;" src="{$url}application/images/icons/bank-melat-loogo.png" /></td>
<p>به منظور افزایش اعتبار اکانت خود :
<br>

ابتدا از لیست زیر مقدار شارژ مورد نظر را انتخاب کرده
سپس روی کلیدپرداخت کلیک کنید تا به درگاه بانکی منتقل شوید
سپس مشخصات کارت بانکی ( عضو شبکه شتاب ) خود را وارد کرده
پس از پرداخت منتظر بمانید تا به سایت {$server_name} باز گردید و اکانت شما شارژ گردد</p>

				<input type="hidden" name="cmd" value="_xclick" />
				<input type="hidden" name="item_name" value="{lang("donation_for", "donate")} {$server_name}" />
				<input type="hidden" name="quantity" value="1" />
				<input type="hidden" name="notify_url" value="{$donate_jahanpay.postback_url}" />
				<input type="hidden" name="custom" value="{$user_id}" />
				{foreach from=$donate_jahanpay.values item=value key=key}
					<label for="option_{$key}">
						<input type="radio" name="amount" value="{$key}" id="option_{$key}" {if reset($donate_jahanpay.values) == $value}checked="checked"{/if}/> <b>{$value} {lang("dp", "donate")}</b> {lang("for", "donate")} <b>{$key}{$currency_sign}</b>
					</label>
				{/foreach}
				<center><input type='submit' value='{lang("pay", "donate")}' /></center>
				<div class="clear"></div>
			</form>
		</section>
		{/if}
</div>