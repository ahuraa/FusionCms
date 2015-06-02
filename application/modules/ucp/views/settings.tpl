<center>
<div class="alarm-register">
<p>هشدار :</p>
<p>درج شماره موبایل بصورت صحیح الزامی میباشد. سرور در قبال اکانت و هیروهایی که شماره موبایل آنها بصورت صحیح وارد نشده باشد هیچ گونه مسئولیتی را عهده دار نخواهد بود</p></div>
</center>

<form onSubmit="Settings.submitInfo(); return false" id="settings_info" class="page_form">
	<table style="width:90%">
		<tr>
			<td style="width:25% !important"><label for="nickname_field">نام و نام خانوادگی : </label></td>
			<td><input type="text" name="nickname_field" id="nickname_field" dir="ltr" value="{$nickname}"/></td>
		</tr>
		<tr>
			<td style="width:25% !important"><label for="location_field">شماره موبایل : </label></td>
			<td><input type="text" name="location_field" id="location_field" dir="ltr" value="09"/></td>
		</tr>
	</table>

	<center style="margin-bottom:10px;">
		<input type="submit" value="تغییر مشخصات" />
	</center>

	<div id="settings_info_ajax" style="text-align:center;padding:10px;"></div>
</form>
<div class="ucp_divider"></div>
<form onSubmit="Settings.submit(); return false" id="settings" class="page_form">
	<table style="width:90%">
		<tr>
			<td style="width:25% !important"><label for="old_password">کلمه عبور قدیم : </label></td>
			<td><input dir="ltr" type="password" name="old_password" id="old_password"/></td>
		</tr>
		<tr>
			<td><label for="new_password">کلمه عبور جدید : </label></td>
			<td><input dir="ltr" type="password" name="new_password" id="new_password"/></td>
		</tr>
		<tr>
			<td><label for="new_password_confirm">تکرار کلمه عبور : </label></td>
			<td><input dir="ltr" type="password" name="new_password_confirm" id="new_password_confirm"/></td>
		</tr>
	</table>

	<center style="margin-bottom:10px;">
		<input type="submit" value="تغییر کلمه عبور" />
	</center>

	<div id="settings_ajax" style="text-align:center;padding:10px;"></div>
</form>