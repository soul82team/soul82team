<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
<div id="reg" align="center">
   <img src="/images/1.png" style="width: 100px; padding-bottom: 20px;" />

  <form id="reg_form" style="width: 700px; border: black solid 1px; border-radius: 1em" action="/member/memUp">
      <h2 align="left">회원 정보 수정</h2>
      <div align="left">
         <p>
            <label>사진</label>
            <img src="/memberimage/${img.IMGNAME}" width="30" height="30"/>
         </p>
         <p>
            <label>아이디</label>&nbsp;&nbsp;<b>${data.ID}</b>                                             
         </p>
         <p>
            <label>비밀번호</label> 
            <input type="password" id="repass1" name="pass" placeholder="비밀번호" required /> 
            <input type="password" id="repass2" placeholder="비밀번호확인" disabled="disabled" required />
         </p>
         <span id="rst2"></span>
         <p>
            <label>이름</label> &nbsp;&nbsp;<b>${data.NAME}</b>
              </p>
         <p>
            <label>성별</label> &nbsp;&nbsp;<b>${data.GENDER}</b>
            
         </p>
         <p>
            <label>생년월일</label>&nbsp;&nbsp;<b>${data.BIRTH}</b>
       	 </p>
         <!-- 
         <p id="accept">
         <input id="accept_terms" name="accept_terms" type="checkbox" />
         <label for="accept_terms">
            <strong>
            <a href="#" rel="external" target="_blank">서비스 이용 약관</a>, 
            <a href="#" rel="external" target="_blank">개인 정보 수집 이용</a>에 동의</strong>합니다.
         </label>
         </p>
         -->          
      </div>
      <p>
         <button id="modify" type="submit">수정하기</button><button id="modify" name="leave">회원탈퇴</button>
      </p>
   </form>
</div>
  <div id="port" align="center" name="port">
	<legend>
		<b>회원탈퇴</b>
	</legend>
	<form id="reg_form" action="/member/leave">
		 <b> ${id }</b> <br /> <b>PASS</b><br />
		 <input type="password" required="required" name="pass" /><br />
		<hr />
		<button id="modify" type="submit">수정</button>
	</form>

</div>
</header>


<script>
$(document.getElementById("port")).hide();
	$(document.getElementsByName("leave")).click(function(){
		$(document.getElementById("port")).slideToggle();
	});
	
	document.getElementById("repass1").addEventListener("blur", function(){
		var pass1 = document.getElementById("repass1").value;
		var pass2 = document.getElementById("repass2").value;
		var chk_num = pass1.search(/[0-9]/g);
		var chk_eng = pass1.search(/[a-z]/ig);
		
		
 			if(pass1.length < 8){
 				html = "<b style='color:red; padding-left : 100px;'>비밀번호를 8~20자리로 설정해주세요.</b><br/><br/>";
 			}else {
 				if(chk_num<0 || chk_eng<0){
 					html = "<b style='color:red; padding-left : 100px;'>비밀번호를  영문, 숫자 조합으로 설정해주세요.</b><br/><br/>";
 				}else if(/(\w)\1\1\1/.test(pass1)){
 					html = "<b style='color:red; padding-left : 100px;'>비밀번호에 같은 문자를 4번이상 사용하실 수 없습니다.</b><br/><br/>";
 				}else{
 					html = "";
 					document.getElementById("rst2").innerHTML = html;
 					document.getElementById("repass2").disabled = false;
 				}
			}
		document.getElementById("rst2").innerHTML = html;		
	});


document.getElementById("repass2").addEventListener("blur", function(){
	var pass1 = document.getElementById("repass1").value;
	var pass2 = document.getElementById("repass2").value;
		if(pass2.length < 1){
			document.getElementById("repass2").disabled = true;
		}else if(pass2==pass1){
			html = "<b style='color:green; padding-left : 100px;'>비밀번호 일치</b><br/><br/>";
		}else {
			html = "<b style='color:red; padding-left : 100px;'>비밀번호 불일치</b><br/><br/>";
		}					
	document.getElementById("rst2").innerHTML = html;
});
</script>