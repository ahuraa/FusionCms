<section class="sidebox_info">
	<table width="100%">
		<tr>
			<td width="50%"><img src="{$url}application/images/icons/plugin.png" align="absmiddle" /> &nbsp;{lang("expansion", "sidebox_info")} : </td>
			<td>
				
				
				
				<a href="{$url}ucp/expansion" data-tip="تغییر سطح بازی" >{$expansion}<img src="{$url}application/images/icons/cog.png" align="absbottom" /></a>
			</td>
		</tr>
		<tr>
			<td><img src="{$url}application/images/icons/computer_error.png" align="absmiddle" /> &nbsp;{lang("last_ip", "sidebox_info")} : </td>
			<td>{$lastIp}</td>
		</tr>
		<tr>
			<td><img src="{$url}application/images/icons/computer.png" align="absmiddle" /> &nbsp;{lang("current_ip", "sidebox_info")} : </td>
			<td>{$currentIp}</td>
		</tr>
		<tr>
			<td><img src="{$url}application/images/icons/heart.png" align="absmiddle" />&nbsp; {lang("vp", "sidebox_info")} : </td>
			<td id="info_vp"><a href="{$url}vote" data-tip="دریافت امتياز" >{$vp} پوینت<img src="{$url}application/images/icons/cog.png" align="absbottom" /></a></td>
			
		</tr>
		<tr>
			<td><img src="{$url}application/images/icons/money.png" align="absmiddle" /><span style="color:#4CFF00"> &nbsp;{lang("dp", "sidebox_info")} : </span></td>
			<td id="info_dp"><span style="color:#4CFF00"><a href="{$url}donate" data-tip="دریافت اعتبار" >{$dp} تومان<img src="{$url}application/images/icons/cog.png" align="absbottom" /></a></span></td>
		</tr>
	</table>
	<center>
		<a href="{$url}ucp" class="nice_button">{lang("user_panel", "sidebox_info")}</a>
		<a href="{$url}logout" class="nice_button">{lang("log_out", "sidebox_info")}</a>
	</center>
</section>