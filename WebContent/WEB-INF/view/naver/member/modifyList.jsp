<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
<div id="reg" align="center">
   <img src="/img/4.png" style="width: 130px; padding-bottom: 20px;" />

  <form id="reg_form" style="width: 700px; border: black solid 1px; border-radius: 1em" action="/member/memUp">
      <h2 align="left">회원 정보 수정</h2>
      <div align="left">
         <p>
         
            <label>사진</label>
            <img src="/${img.IMGNAME}" width="30" height="30"/>
            
         </p>
         <p>
            <label>아이디</label>&nbsp;&nbsp;<b>${data.ID}</b>
            <span id="rst"></span>                                              
         </p>
         <p>
            <label>비밀번호</label> 
            <input type="password" id="pass" name="pass" placeholder="비밀번호" required /> 
            <input type="password" id="pass2" placeholder="비밀번호확인" disabled="disabled" required />
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
           
         <p>
            <label>이메일</label>
            <input type="email" id="mail" name="mail" placeholder="E-mail입력" required />
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
         <button id="reg_new" type="submit">수정하기</button><input type="button" id="reg_new" name="bt" value="회원탈퇴"/>
      </p>
   </form>
</div>
  <div id="port" align="center" name="port">
	<legend>
		<b>회원탈퇴</b>
	</legend>
	<form id="reg_form" action="/member/leave">
		 <b> ${id }</b> <br /> <b>PASS</b><br /> <input
			type="password" required="required" name="pass" /><br />
		<hr />
		<input type="submit" value="수정" />
	</form>

</div>
</header>


<script>
$(document.getElementById("port")).hide();
	$(document.getElementsByName("bt")).click(function(){
		$(document.getElementById("port")).slideToggle();
	});
</script>