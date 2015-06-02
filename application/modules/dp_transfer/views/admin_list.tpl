{foreach from=$results item=log}
    <li>
        <table width="100%" style="font-size:11px;">
            <tr>
                <td width="20%">{date("Y/m/d H:i:s", $log.time)}</td>
                <td width="40%">
                    <a href="{$url}profile/{$log.account}" target="_blank">{$log.account_name}</a> transferred 
                    
                   
                    to account <a href="{$url}profile/{$log.dest_account}" target="_blank">{$log.dest_account_name}</a>.
                </td>
                <td width="40%">
                    The transfer costed <strong>{$log.DP_transfer_price} DP</strong>.<br />
                    Money Transfer Points <strong>{$log.DP_ponits} DP</strong>.<br />
                    Initial points <strong>{$log.start_currency}</strong>, after deduction <strong>{$log.end_currency}</strong>.
                </td>
            </tr>
        </table>
    </li>
{/foreach}