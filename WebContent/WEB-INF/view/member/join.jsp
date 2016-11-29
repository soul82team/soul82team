<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<header>
<div id="reg" align="center">
	<img src="/img/4.png" style="width: 130px; padding-bottom: 20px;" />

	<form id="reg_form" style="width: 700px; border: black solid 1px;
	 border-radius: 1em" action="/member/joinConfirm" method="post" enctype="multipart/form-data">
		<h2 align="left">Registration</h2>
		<div align="left">
			<p>
				<label>사진</label> <input type="file" id="img" name="img" placeholder="사진" required /><!-- onselect="javascript:checkFile()" -->
			</p>
			<p>
				<label>아이디</label> <input type="text" id="createId" name="id" placeholder="6~20자로 입력" required />
				<span id="rst"></span>                                              
			</p>
			<p>
				<label>비밀번호</label> 
				<input type="password" id="pass1" name="pass1" placeholder="비밀번호" required /> 
				<input type="password" id="pass2" placeholder="비밀번호확인" disabled="disabled" required />
			</p>
				<span id="rst2"></span>
			<p>
				<label>이름</label> 
				<input type="text" id="name" name="name" placeholder="한글,영문 2~15자" min="2" maxlength="15" required />
			</p>
			<p>
				<label>성별</label> 
				<input type="radio" name="gender" id="genderM" class="input_check"> 
				<label for="genderM" class="label_check">남자</label> 
				<input type="radio" name="gender" id="genderW" class="input_check">
				<label for="genderW" class="label_check">여자</label>
			</p>
			<p>
				<label>생년월일</label>
				<input type="text" id="birthYear" name="birthYear" style="width: 80px;" maxlength="4"><span>년</span> 
				<input type="text" id="birthMonth" name="birthMonth" style="width: 50px;" maxlength="2"><span>월</span>
				<input type="text" id="birthDay" name="birthDay" style="width: 50px;" maxlength="2"><span>일</span>
			</p>
			<p>
				<label>이메일</label>
				<input type="email" id="mail" name="mail" placeholder="E-mail입력" required />
				<button id="confirm" onclick="authpop()" type="button">인증받기</button>
			</p>
		</div>
		<p>
			<button id="reg_new" type="submit">회원가입</button>
		</p>
	</form>

</div>
</header>

</html>
