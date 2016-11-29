<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<header>
	<c:choose>
		<c:when test="${sessionScope.userId eq null }">
			<div>
					<legend>
						<b>로그인</b>
					</legend>
					<form action="/member/login">
						<b>ID</b> &nbsp;
							
								<br />
								<input type="text" required="required"
									placeholder="ID를 입력해주세요" name="id" />
						<br /> <b>PASS</b><br /> <input type="password"
							required="required" name="pass" /><br />
						<hr />
						<input type="submit" value="로그인" data-dismiss="modal"/>
					</form>
				<a href="/member/joinPage">아직회원이아니십니까?</a>
			</div>
		</c:when>
		<c:otherwise>
			<div>
				<fieldset >
					<legend>
						<b>&gt;이용가능서비스&lt;</b>
					</legend>
					<b>${userId}</b>
					<ul>
						<!--  <li><a href="">내 정보</a></li>  -->
						<li><a href="/board/review">리뷰 작성</a></li>
						<li><a href="/member/modifyPage">내정보수정</a></li>
						<li><a href="/member/logout">로그아웃</a></li>
						
					</ul>
				</fieldset>
			</div>
		</c:otherwise>
	</c:choose>
</header>

