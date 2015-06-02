{if $rows}
	{foreach from=$rows item=row}
<br />
<div align="right">
<div style=" padding: 5px 10px 5px 5px;
  margin-bottom: 10px;

  border: 1px solid #655638;
  -webkit-border-radius: 4px;
     -moz-border-radius: 4px;
          border-radius: 4px;">

<br />
{if {$row['status']} != 0}
وضعیت : <span style="color:green;">فیکس شد</span>
{else}
وضعیت : <span style="color:red;">در حال بررسی</span>
{/if}
<br />
{if {$row['priority']} == 1}
اهمیت :  معمولی
{elseif {$row['priority']} == 2}
اهمیت :  مهم
{elseif {$row['priority']} == 3}
اهمیت :  ضروری
{/if}
<br />
<br />
{form_open('bugreport/fixed')}
<input type="hidden" value="{$row['bug']}" name="bugname" /><span style="color:#A07332;">{$row['bug']}</span> 
<br />
<br /><p style="direction:rtl;"> ارسال شده توسط : {$row['remetent']}</p><br />
{foreach from=$check item=value}
{if $value}
{if {$row['status']} == 0}
<input type="submit" name="submit"  id="submit" value="فیکس شد"> <br />
</form>
{/if}
{/if}
{/foreach}
<br />
</div>
	</div>
	{/foreach}
{/if}
