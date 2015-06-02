<!DOCTYPE html>
<html>
	<head>
		<title>AdminCP</title>

		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/> 

		<link rel="shortcut icon" href="{$url}application/themes/admin/images/favicon.png" />
		<link rel="stylesheet" href="{$url}application/themes/admin/css/login/reset.css" type="text/css" />
		<link rel="stylesheet" href="{$url}application/themes/admin/css/login/grid.css" type="text/css" />
		<link rel="stylesheet" href="{$url}application/themes/admin/css/login/style.css" type="text/css" />

		<script src="{if $cdn}//html5shiv.googlecode.com/svn/trunk/html5.js{else}{$url}application/js/html5shiv.js{/if}"></script>
		<script type="text/javascript" src="{if $cdn}https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js{else}{$url}application/js/jquery.min.js{/if}"></script>

		<script type="text/javascript">
			function getCookie(c_name)
			{
				var i, x, y, ARRcookies = document.cookie.split(";");

				for(i = 0; i < ARRcookies.length;i++)
				{
					x = ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
					y = ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
					x = x.replace(/^\s+|\s+$/g,"");
					
					if(x == c_name)
					{
						return unescape(y);
					}
				}
			}

			var Config = {
				URL: "{$url}",
				CSRF: getCookie('csrf_cookie_name'),
			};
		</script>

		<script src="{$url}application/js/require.js" type="text/javascript" ></script>
		<script type="text/javascript">

			var scripts = [
				"{$url}application/js/jquery.placeholder.min.js",
				"{$url}application/js/jquery.transit.min.js",
				"{$url}application/themes/admin/js/login.js"
			];

			require(scripts, function()
			{
				$('input[placeholder], textarea[placeholder]').placeholder();
			});
		</script>
	</head>

	<body>
		<ul id="notifications">
			<li id="notifications_button" style="display: list-item;">
				<span class="image error"></span><span id="notifications_message"></span><span class="tag">urgent</span>
			</li>
		</ul>
		
		<div id="loginbox" style="display: block;">
			<a href="#" id="logo">AdminCP</a>
			<div id="loginform">
				<form onSubmit="Login.send(this); return false">
					<div id="username_field">
						<input type="text" name="username" placeholder="Username" {if $isOnline}disabled value="{$username}"{/if} id="username">
					</div>
					
					<div id="password_field">
						<input type="password" name="password" placeholder="Password" {if $isOnline}disabled value="Password"{/if} id="password">
					</div>
					
					<div id="security_field">
						<input type="password" name="security" placeholder="Security code" id="security_code">
					</div>
					
					<div id="buttonline">
						<input type="submit" id="loginbutton" class="float_left width_4" value="Login">
					</div>
				</form>
			</div>
		</div>
	</body>
</html>