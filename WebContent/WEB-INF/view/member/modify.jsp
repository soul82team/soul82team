<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div>
	<legend>
		<b>ȸ����������</b>
	</legend>
	<form action="/member/modify">
		 <b> ${id }</b> <br /> <b>PASS</b><br /> <input
			type="password" required="required" name="pass" /><br />
		<hr />
		<input type="submit" value="����" />
	</form>

</div>