<div align="center">گزارش باگ</div>
<div style="font-family:BYekan;" align="center">
{form_open("bugreport/submit")}
<select name="importance" id="priority">
<option value="3" style="color:red;">ضروری</option>
<option value="2" style="color:Yellow;">مهم</option>
<option value="1" style="color:Green;">معمولی</option>
</select>
<textarea dir="rtl" name="bug" id="bug" placeholder="گزارش خود را در این قسمت وارد کنید ( حداکثر 1000 کاراکتر )" required  style="width:685px; height:100px;" /></textarea><br />
<input type="submit" name="submit" value="ارسال گزارش"/>
</form>
</div>