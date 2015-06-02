{form_open('register', 'class="page_form"')}
<center>
<div class="alarm-register">
<p>هشدار :</p>
<p>اطلاعات وارد شده در زمان بازیابی رمز عبور مورد استفاده قرار میگیرند ، پس حتماً اطلاعات را با دقت و بصورت دقیق وارد کنید</p>
</div>
</center>
	<table style="width:80%;direction:rtl;font-family:BYekan">
		<tr>
			<td><label for="register_username">نام کاربری</label></td>
			<td>
				<input dir="rtl" type="text" name="register_username" id="register_username" value="{set_value('register_username')}" onChange="Validate.checkUsername()"/>
				<span id="username_error">{$username_error}</span>
			</td>
		</tr>
		<tr>
			<td><label for="register_password">کلمه عبور</label></td>
			<td>
				<input dir="rtl" type="password" name="register_password" id="register_password" value="{set_value('register_password')}" onChange="Validate.checkPassword()"/>
				<span id="password_error">{$password_error}</span>
			</td>
		</tr>
		<tr>
			<td><label for="register_password_confirm">تایپ مجدد</label></td>
			<td>
				<input dir="rtl" type="password" name="register_password_confirm" id="register_password_confirm" value="{set_value('register_password_confirm')}" onChange="Validate.checkPasswordConfirm()"/>
				<span id="password_confirm_error">{$password_confirm_error}</span>
			</td>
		</tr>
				<tr>
			<td><label for="register_email">آدرس ایمیل</label></td>
			<td>
				<input dir="rtl" type="email" name="register_email" id="register_email" value="{set_value('register_email')}" onChange="Validate.checkEmail()"/>
				<span id="email_error">{$email_error}</span>
			</td>
		</tr>
		<tr>
			<td><label for="register_expansion">نوع اکانت</label></td>
			<td>
				<select id="register_expansion" name="register_expansion">
					{foreach from=$expansions key=id item=expansion}
						<option value="{$id}">{$expansion}</option>
					{/foreach}
				</select>
			</td>
		</tr>
		
		
		<tr>
			<td></td>
			<td>

<input type="hidden" name="r" value="{$recruiter}"/>
			</td>
		</tr>

		
		{if $use_captcha}
			<tr>
				<td><label for="captcha"><img src="{$url}application/modules/register/controllers/getCaptcha.php?{uniqid()}" /></label></td>
				<td>
					<input dir="rtl" type="text" name="register_captcha" id="register_captcha"/>
					
					<span id="captcha_error">{$captcha_error}</span>
				</td>
			</tr>
		{/if}
		
	</table>
	<center style="margin-bottom:10px;">
		<input type="submit" name="login_submit" value=" ساخت اکانت " />
	</center>
{form_close()}