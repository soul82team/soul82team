<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


<div id="reg" align="center">
	<img src="/images/1.png" style="width: 100px; padding-bottom: 20px;" />
	
	<form id="reg_form" action="/member/modify"  style="width: 400px; height: 200px; border: black solid 1px;
		border-radius: 1em; padding-top: 30px" method="post" enctype="multipart/form-data">
	
	 
		<b>PASS</b> <input type="password" required="required" name="pass" /><br />
		<br/>
		<br/>
	<button id="modify" type="submit">¼öÁ¤</button>
	</form>

</div>