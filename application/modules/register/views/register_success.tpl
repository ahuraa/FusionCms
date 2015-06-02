{if $email_activation}
	<span id="success">
		{lang("the_account", "register")} <b>{$account}</b> {lang("has_been_created", "register")}
	</span>
{else}
	<script type="text/javascript">
			setTimeout(function(){
				window.location = "{$url}ucp/settings";
			}, 1000);
	</script>

	<span id="success">
		<p style="text-align: right;">اکانت شما با موفقیت ایجاد شد, شما در حال انتقال به مرحله دوم عضویت میباشید</p>

	</span>
{/if}