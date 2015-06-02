<section id="ucp_top">
	<a href="{$url}ucp/avatar" id="ucp_avatar">
		<div>{lang("change_avatar", "ucp")}</div>
		<img src="{$avatar}"/>
	</a>

	<section id="ucp_info">
		<aside>
			<table width="100%">
				<tr>
					<td width="10%"><img src="{$url}application/images/icons/user.png" /></td>
					<td width="40%">{lang("nickname", "ucp")}</td>
					<td width="50%">
						<a style="float:right;margin-left:10px;" href="{$url}ucp/settings" data-tip="تغییر نام" >{$username}<img src="{$url}application/images/icons/pencil.png" align="absbottom" /></a>
					</td>
				</tr>
				<tr>
					<td width="10%"><img src="{$url}application/images/icons/phone.png" /></td>
					<td width="40%">{lang("location", "ucp")}</td>
					<td width="50%">
						<a style="float:right;margin-left:10px;" href="{$url}ucp/settings" data-tip="تغییر شماره موبایل" >{$location}<img src="{$url}application/images/icons/pencil.png" align="absbottom" /></a>
					</td>
				</tr>
				<tr>
					<td width="10%"><img src="{$url}application/images/icons/plugin.png" /></td>
					<td width="40%">Expansion</td>
					<td width="50%">
<a href="{$url}ucp/expansion" data-tip="تغییر نوع اکانت" >{$expansion}</a>
					</td>
				</tr>
				<tr>
					<td width="10%"><img src="{$url}application/images/icons/award_star_bronze_1.png" /></td>
					<td width="40%">{lang("account_rank", "ucp")}</td>
					<td width="50%">{foreach from=$groups item=group} <span {if $group.color}style="color:{$group.color}"{/if}>{$group.name}</span> {/foreach}</td>
				</tr>
			</table>
		</aside>

		<aside>
			<table width="100%">
				<tr data-tip="قابل دریافت میباشد Vote مجموعه امتیاز شما, امتیاز گیری رایگان بوده و از طریق سیستم">
					<td width="10%"><img src="{$url}application/images/icons/heart.png" /></td>
					<td width="40%">{lang("voting_points", "ucp")}</td>
					<td width="50%">{$vp}</td>
				</tr>
				<tr data-tip="اعتباز, موجودی تومانی شما میباشد که به شما این امکان را میدهد تا از امکانات پولی سایت استفاده کنید">
					<td width="10%"><img src="{$url}application/images/icons/money.png" /></td>
					<td width="40%">{lang("donation_points", "ucp")}</td>
					<td width="50%">{$dp}</td>
				</tr>
				<tr>
					<td width="10%"><img src="{$url}application/images/icons/shield.png" /></td>
					<td width="40%">{lang("account_status", "ucp")}</td>
					<td width="50%">{$status}</td>
				</tr>
				<tr>
					<td width="10%"><img src="{$url}application/images/icons/date.png" /></td>
					<td width="40%">{lang("member_since", "ucp")}</td>
					<td width="50%">{$register_date}</td>
				</tr>
			</table>
		</aside>
	</section>

	<div class="clear"></div>	
</section>

<div class="ucp_divider"></div>

<section id="ucp_buttons">
	{if $menu_links}
		{foreach from=$menu_links item=link}
			<a href="{$link.link}" direct="{$link.direct_link}" {if $link.image}style="background-image:url({$url}application/modules/ucp/images/gallery/{$link.image})"{/if}>
				<div><p>{$link.name}</p></div>
			</a>
		{/foreach}
	{/if}
	
	<div class="clear"></div>
</section>

{$characters}