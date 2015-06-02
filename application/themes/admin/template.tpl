<!DOCTYPE html>
<html>
	<head>
		<title>{if $title}{$title}{/if}admin Control Panel</title>

		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/> 

		<link rel="shortcut icon" href="{$url}application/themes/admin/images/favicon.png" />
		<link rel="stylesheet" href="{$url}application/themes/admin/css/template/reset.css" type="text/css" />
		<link rel="stylesheet" href="{$url}application/themes/admin/css/template/buttons.css" type="text/css" />
		<link rel="stylesheet" href="{$url}application/themes/admin/css/template/main.css" type="text/css" />
		{if $extra_css}<link rel="stylesheet" href="{$url}application/{$extra_css}" type="text/css" />{/if}

		<script src="{if $cdn}//html5shiv.googlecode.com/svn/trunk/html5.js{else}{$url}application/js/html5shiv.js{/if}"></script>
		<script type="text/javascript" src="{if $cdn}https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js{else}{$url}application/js/jquery.min.js{/if}"></script>

		<script type="text/javascript">
		
			if(!window.console)
			{
				var console = {
				
					log: function()
					{
						// Prevent stupid browsers from doing stupid things
					}
				};
			}

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
				isACP: true,
				defaultLanguage: "{$defaultLanguage}",
				languages: [ {foreach from=$languages item=language}"{$language}",{/foreach} ]
			};
		</script>

		<script src="{$url}application/themes/admin/js/router.js" type="text/javascript"></script>
		<script src="{$url}application/js/require.js" type="text/javascript" ></script>
		
		<script type="text/javascript">

			var scripts = [
				"{$url}application/js/jquery.placeholder.min.js",
				"{$url}application/js/jquery.transit.min.js",
				"{$url}application/js/ui.js",
				"{$url}application/js/fusioneditor.js"
				{if $extra_js},"{$url}application/{$extra_js}"{/if}
			];

			require(scripts, function()
			{
				$(document).ready(function()
				{
					UI.initialize();

					{if $extra_css}
						Router.loadedCSS.push("{$extra_css}");
					{/if}

					{if $extra_js}
						Router.loadedJS.push("{$extra_js}");
					{/if}
				});
			});

		</script>

		<!--[if IE]>
			<style type="text/css">
			#main .right h2 img {
				position:relative;
			}
			</style>
		<![endif]-->

		<!--[if LTE IE 7]>
			<style type="text/css">
			#main .right .statistics span {
				width:320px;
			}
			</style>
		<![endif]-->
	</head>

	<body>
		<div id="popup_bg"></div>

		<!-- confirm box -->
		<div id="confirm" class="popup">
			<h1 class="popup_question" id="confirm_question"></h1>

			<div class="popup_links">
				<a href="javascript:void(0)" class="button icon approve" id="confirm_button"></a>
				<a href="javascript:void(0)" class="button icon remove danger" id="confirm_hide" onClick="UI.hidePopup()">
					Cancel
				</a>
				<div style="clear:both;"></div>
			</div>
		</div>

		<!-- alert box -->
		<div id="alert" class="popup">
			<h1 class="popup_message" id="alert_message"></h1>

			<div class="popup_links">
				<a href="javascript:void(0)" class="popup_button" id="alert_button">Okay</a>
				<div style="clear:both;"></div>
			</div>
		</div>

		<!-- Main Container -->
		<div id="container">
		
			<header>
			
				<!-- Logo -->
				<h1 id="logo">مدیریت سایت ایران کٌر</h1>
				
				<!-- User info -->
				<div id="userinfo">
					<img src="{$CI->user->getAvatar()}" height="40px" width="40px" alt="{$nickname}" title="{$nickname}"></img>
					<div class="intro">
						<br>خوش آمدید <strong>{$nickname} عزیز</strong>!&nbsp;&nbsp;&nbsp;&nbsp;<br>
						شما دارای <a href="{$url}messages">{$CI->cms_model->getMessagesCount()} پیام خصوصی میباشید</a>
					</div>
				</div>
				
			</header>
			
			<!-- The application "window" -->
			<div id="application">
				
				<!-- Primary navigation -->
				{foreach from=$menu item=group key=text}
					{if count($group.links)}
						<h4>{$text}</h4>
						<nav id="primary">
							<ul>
								{foreach from=$group.links item=link}
									<li>
										<a href="{$url}{$link.module}/{$link.controller}" {if isset($link.active)}class="active"{/if}>
											<span class="icon {$link.icon}"></span>
											{$link.text}
										</a>
									</li>
								{/foreach}
							</ul>
						</nav>
					{/if}
				{/foreach}
				
				<!-- Secondary navigation -->
				<nav id="secondary">
					<ul>
						<li><a href="{$url}admin/" {if $current_page == "admin/"}class="active"{/if}>مدیریت سایت</a></li>
						
						{if hasPermission("editSystemSettings", "admin")}
							<li><a href="{$url}admin/settings" {if $current_page == "admin/settings"}class="active"{/if}>تنظیمات</a></li>
						{/if}
						
						<li><a href="{$url}ucp" data-hasevent="1">پنل کاربری</a></li>
					</ul>
				</nav>
				
				<!-- The content -->
				<section id="content">
				
					<div class="tab" id="maintab" style="display: block;">
						<h2>انتخاب سریع</h2>
						
						<a href="{$url}news/admin" class="button icon edit">
							ایجاد خبر جدید
						</a>
						
						<a href="{$url}update" target="_blank" class="button icon warcry-settings">
							آپدیت سیستم
						</a>
						
						<a href="{$url}admin/accounts" class="button icon user">
							مدیریت کاربران
						</a>
					
						
						{$page}
						
						<div class="clear"></div>
					</div>
					
				</section>
				<!-- The content.End -->
				
			</div>
			<!-- The application "window".End -->
			
			<footer id="copyright">Theme design &amp; development by Bram Jetten in 2011</footer>
			<footer id="copyright">فارسی سازی توسط تیم طراحی و توسعه ایران کٌر</footer>
			
			
		</div>
		<!-- Main Container.End -->
		
		<script src="{$url}application/themes/admin/js/main.js" type="text/javascript"></script>
	</body>
</html>