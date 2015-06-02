{if $graph}
<div class="statistics">
	<span>نمودار کلی</span>
	<div class="image">
		<img src="https://chart.googleapis.com/chart?chf=bg,s,FFFFFF&chxl=0:|{$graph.first_date}|{$graph.last_date}&chxp=0,12,87&chxr=1,0,{$graph.top+20}&chxs=1,676767,11.5,0,lt,676767&chxt=x,y&chs=667x190&cht=lc&chco=095a9d&chds=0,{$graph.top+20}&chd=t:{$graph.stack}&chdlp=l&chls=2&chma=5,5,5,5" />
	</div>
</div>
{/if}

{if $pendingUpdate}
	<section id="content" style="border-top:none;">
		<section class="box big shouldHaveAlert">
		<h1>Pending update</h1>
		<span style="text-align:center;padding:15px;">
			There is a pending update to <b>{$pendingUpdate}</b> available.
			<a class="nice_button" href="{$url}update" data-hasevent="1">Go to the update installer</a>
		</span>
		</section>
	</section>
{/if}

<div class="info_box">
	<aside>
		<h2><img src="{$url}application/themes/admin/images/icons/black16x16/ic_pin.png"/> خدمات وبسایت</h2>
		<table>
			<tr
>				<td>بازدید کننده امروز</td>
				<td>{$unique.today}</td>
			</tr>
			<tr>
				<td>بازدید کننده این ماه</td>
				<td>{$unique.month}</td>
			</tr>
			<tr>
				<td>بازدید امروز</td>
				<td>{$views.today}</td>
			</tr>
			<tr>
				<td>بازدید این ماه</td>
				<td>{$views.month}</td>
			</tr>
		</table>
	</aside>
	<aside>
		<h2><img src="{$url}application/themes/admin/images/icons/black16x16/ic_graph.png"/> سیستم مالی و امتیاز</h2>
		<table>
			<tr>
				<td>درآمد این ماه</td>
				<td>$ {$income.this}</td>
			</tr>
			<tr>
				<td>درآمد ماه گذشته</td>
				<td>$ {$income.last}</td>
			</tr>
			<tr>
				<td>امتیاز این ماه</td>
				<td>{$votes.this}</td>
			</tr>
			<tr>
				<td>امتیاز ماه گذشته</td>
				<td>{$votes.last}</td>
			</tr>
		</table>
	</aside>
	<aside>
		<h2><img src="{$url}application/themes/admin/images/icons/black16x16/ic_users.png"/> آمار و اطلاعات کاربران</h2>
		<table>
			<tr>
				<td>ثبت نام امروز</td>
				<td>{$signups.today}</td>
			</tr>
			<tr>
				<td>ثبت نام این ماه</td>
				<td>{$signups.this}</td>
			</tr>
			<tr>
				<td>ثبت نام ماه گذشته</td>
				<td>{$signups.last}</td>
			</tr>
			<tr>
				<td>مجموع اکانت ها</td>
				<td>{$signups.total}</td>
			</tr>
		</table>
	</aside>
	<div class="clear"></div>
</div>

<aside class="side_left">
	<section class="box">
		<h2><img src="{$url}application/themes/admin/images/icons/black16x16/ic_grid.png"/> ماژول های نصب شده (<div style="display:inline;" id="enabled_count">{count($enabled_modules)}</div>)</h2>
		<ul id="enabled_modules">
			{foreach from=$enabled_modules item=module key=key}
				<li>
					{if hasPermission("toggleModules")}
						{if $module.enabled}<a href="javascript:void(0)" onClick="Admin.disableModule('{$key}', this);" class="button">غیر فعال</a>{else}<a href="javascript:void(0)" onClick="Admin.enableModule('{$key}', this);" class="button">فعال کردن</a>{/if}
					{/if}
					{if $module.has_configs && hasPermission("editModuleConfigs")}<a href="{$url}admin/edit/{$key}" class="button">ویرایش تنظیمات</a>{/if}
					<span style="display:inline !important;padding:0px !important;" data-tip="{$module.description}"><b>{ucfirst($module.name)}</b> by <a href="{$module.author.website}" target="_blank">{$module.author.name}</a></span>
				</li>
			{/foreach}
		</ul>
	</section>

	<section class="box">
		<h2><img src="{$url}application/themes/admin/images/icons/black16x16/ic_grid.png"/> ماژول های غیر فعال شده (<div style="display:inline;" id="disabled_count">{count($disabled_modules)}</div>)</h2>
		<ul id="disabled_modules">
			{foreach from=$disabled_modules item=module key=key}
				<li>
					{if hasPermission("toggleModules")}
						{if $module.enabled}<a href="javascript:void(0)" onClick="Admin.disableModule('{$key}', this);" class="button">غیر فعال</a>{else}<a href="javascript:void(0)" onClick="Admin.enableModule('{$key}', this);" class="button">فعال کردن</a>{/if}
					{/if}
					{if $module.has_configs && hasPermission("editModuleConfigs")}<a href="{$url}admin/edit/{$key}" class="button">Edit configs</a>{/if}
					<span style="display:inline !important;padding:0px !important;" data-tip="{$module.description}"><b>{ucfirst($module.name)}</b> by <a href="{$module.author.website}" target="_blank">{$module.author.name}</a></span>
				</li>
			{/foreach}
		</ul>
	</section>
</aside>

<aside class="side_right">
	<section class="box" id="system_box">
		<h2><img src="{$url}application/themes/admin/images/icons/black16x16/ic_settings.png"/> مشخصات سیستم</h2>
		
		<table width="90%" align="center" style="margin-top:5px;margin-bottom:5px;">
			<tr>
				<td>نسخه PHP</td>
				<td style="text-align:right;">{$php_version}</td>
			</tr>
			<tr>
				<td>نسخه CMS</td>
				<td style="text-align:right;">{$version}</td>
			</tr>
		</table>
		<div id="update" style="display:none;">
			<div class="divider"></div>
			<a href="http://irancore.ir" class="button">برسی آخرین نسخه موجود</a>
		</div>
	</section>

	<section class="box">
		<h2><img src="{$url}application/themes/admin/images/icons/black16x16/ic_picture.png"/> مشخصات تم</h2>
		
		<table width="90%" align="center" style="margin-top:5px;margin-bottom:5px;">
			<tr>
				<td>نام تم</td>
				<td>{$theme.name}</td>
			</tr>
			<tr>
				<td>توسعه دهنده</td>
				<td><a href="{$theme.website}" target="_blank">{$theme.author}</a></td>
			</tr>
			{if hasPermission("changeThemeHeader")}
				<tr>
					<td>سربرگ</td>
					<td><b style="font-weight:normal;" id="header_field">{if !$header_url}Default{else}Custom{/if} {if $theme.blank_header}</b> (<a href="javascript:void(0)" onClick="Admin.changeHeader('{$header_url}', '{$theme.blank_header}', '{$theme_value}')">تغییر</a>){/if}</td>
				</tr>
			{/if}
		</table>
		{if hasPermission("changeTheme")}
			<div class="divider"></div>
			<a href="{$url}admin/theme" class="button">تغییر تم</a>
		{/if}
	</section>
</aside>

<div class="clear"></div>