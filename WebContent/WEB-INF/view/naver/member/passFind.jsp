<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<header>
<div id="reg" align="center">
	<img src="/img/4.png" style="width: 130px; padding-bottom: 20px;" />

	<form id="reg_form" style="width: 700px; border: black solid 1px;
	 border-radius: 1em" action="/member/passf" method="post" enctype="multipart/form-data">
		<h2 align="left">본인의 정보를 입력해주세요</h2>
		<div align="left">
			
			<p>
				<label>아이디</label> <input type="text" id="id" name="id" placeholder="ID을 입력하세요" required />
				<span id="rst"></span>                                              
			</p>
			
				<label>이름</label> 
				<input type="text" id="name" name="name" placeholder="본인의 이름" min="2" maxlength="15" required />
			</p>
			
			<p>
				<label>생년월일</label>
				<input type="text" id="birthYear" name="birthYear" style="width: 80px;" maxlength="4"><span>년</span> 
				<input type="text" id="birthMonth" name="birthMonth" style="width: 50px;" maxlength="2"><span>월</span>
				<input type="text" id="birthDay" name="birthDay" style="width: 50px;" maxlength="2"><span>일</span>
			</p>
			<p>
				<label>이메일</label>
				<input type="email" id="mail" name="mail" placeholder="가입시 E-mail입력" required />
				
			</p>
		</div>
		<p>
			<button id="reg_new" type="submit">비밀번호 찾기</button>
		</p>
	</form>

</div>
</header>

<script>

	document.getElementById("id").addEventListener("blur", function(){
		var v =document.getElementById("id").value;
	
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/member/joinAjax.it?id="+v, true);
		xhr.onreadystatechange=function(){
			if(xhr.status==200&xhr.readyState==4){
				var t =xhr.responseText;
				var html;
				if(t=="TRUE") {
					html = "<b style='color:red;'>사용중인 아이디입니다</b><br/>";
				}else if(v.length < 6){
					html = "<b style='color:red;'>아이디를 6자 이상 입력해주세요</b><br/>";
				}else {
					html = "<b style='color:green;'>멋진 아이디입니다</b><br/>";
				}
				document.getElementById("rst").innerHTML = html;
			}
				
		};
		xhr.send();
	});
	
	document.getElementById("pass").addEventListener("blur", function(){
			var pass = document.getElementById("pass").value;
			var pass2 = document.getElementById("pass2").value;
			var chk_num = pass.search(/[0-9]/g);
			var chk_eng = pass.search(/[a-z]/ig);
			
			
	 			if(pass.length < 8){
	 				html = "<b style='color:red; padding-left : 100px;'>비밀번호를 8~20자리로 설정해주세요.</b><br/><br/>";
	 			}else {
	 				if(chk_num<0 || chk_eng<0){
	 					html = "<b style='color:red; padding-left : 100px;'>비밀번호를  영문, 숫자 조합으로 설정해주세요.</b><br/><br/>";
	 				}else if(/(\w)\1\1\1/.test(pass)){
	 					html = "<b style='color:red; padding-left : 100px;'>비밀번호에 같은 문자를 4번이상 사용하실 수 없습니다.</b><br/><br/>";
	 				}else{
	 					html = "";
	 					document.getElementById("rst2").innerHTML = html;
	 					document.getElementById("pass2").disabled = false;
	 				}
				}
			document.getElementById("rst2").innerHTML = html;		
		});
	
	
	document.getElementById("pass2").addEventListener("blur", function(){
		var pass = document.getElementById("pass").value;
		var pass2 = document.getElementById("pass2").value;
			if(pass2.length < 1){
				document.getElementById("pass2").disabled = true;
			}else if(pass2==pass){
				html = "<b style='color:green; padding-left : 100px;'>비밀번호 일치</b><br/><br/>";
			}else {
				html = "<b style='color:red; padding-left : 100px;'>비밀번호 불일치</b><br/><br/>";
			}					
		document.getElementById("rst2").innerHTML = html;
	});
	
	
	$(document).ready(function(){
		  $("#reg_new").on("click", function(){
		    window.open("", "popup_window", "width=500, height=300, scrollbars=no");
		    $("#reg_form").submit();
		  });
	});
	

</script>




</html>