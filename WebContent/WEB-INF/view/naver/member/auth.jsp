<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<div>
	인증번호입력 <br/>
	<input type="text" id="authNum"/>
	<input hidden="true" id="userId" value=${uid } />
	<button id="auth">인증</button> 
	<br/>
	<span id="test"></span>
</div>

<script>
	document.getElementById("auth").addEventListener("click", function(){
		var authNum = document.getElementById("authNum").value;
		var userId = document.getElementById("userId").value;
			if(authNum == userId){
				document.getElementById("test").innerHTML = "성공";
				window.opener.document.getElementById("reg_new").disabled = false;
				window.close();
			}else{
				document.getElementById("test").innerHTML = "실패";
			}
	});
</script>

