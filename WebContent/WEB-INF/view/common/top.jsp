<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header id="header">

	<nav class="navbar navbar-inverse" role="banner"
		style="margin-bottom: 0px;">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/" style="padding: 0px;"><img
					src="/images/2.png" alt="logo" style="width: 50px; height: 50px;" /></a>
			</div>
			<div class="collapse navbar-collapse navbar-right">
				<c:choose>
					<c:when test="${sessionScope.userId eq null }">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="/about">About</a></li>
							<li><a href="/musicchart">MusicChart</a></li>
							<li><a href="/admin/allalbum?page=1">Album</a></li>
							<li><a id="myBtn" style="cursor: pointer;">Login</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="/about">About</a></li>
							<li><a href="/admin/reglist?page=1">Music</a></li>
							<li><a href="/musicchart">MusicChart</a></li>
							<li><a href="/admin/allalbum?page=1">Album</a></li>
							
							<li class="dropdown"><img src="/memberimage/${sessionScope.imgname}"
								style="width: 30px; height: 30px;" id="img"> <a
								class="dropdown-toggle" data-toggle="dropdown" href="#">${sessionScope.userId }<span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<!-- <li><a href="/board/review">리뷰 작성</a></li> -->
									<li><a href="/qna/qnaList?page=1">질문게시판</a></li>
									<c:if test="${sessionScope.notice eq 1}">
									<li><a href="/admin/reg">mp3 등록</a></li>
									</c:if>
									<li><a href="/mp3/myalbum">내 앨범</a></li>
									<li><a href="/youtube/board">MV 보기</a></li>
									<li><a href="/member/modifyPage">내정보수정</a></li>
									<li><a href="/member/logout">로그아웃</a></li>
								</ul></li>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</nav>



	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-lock"></span> Soul82 Login
					</h4>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">

					<form action="/member/login" name="frm" id="login" method="post">
						<div class="form-group">
							<label for="usrname"><span
								class="glyphicon glyphicon-user"></span> ID</label> <input type="text"
								class="form-control" value="${cid}" id="id" name="id" placeholder="ID를 입력해주세요!"
								required="required">
						</div>
						<div class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-eye-open"></span> PASSWORD</label> <input
								type="password" class="form-control" id="pass" name="pass"
								placeholder="비밀번호를 입력해주세요!" required="required">
						</div>
						<div class="checkbox">
							<label><input type="checkbox" id="idcheck" name="idcheck"  >나를
								기억해줘</label>
						</div>
						<button type="submit" class="btn btn-success btn-block">
							<span class="glyphicon glyphicon-off"></span> Login
						</button>
					</form>

				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger btn-default pull-left"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> Cancel
					</button>
					<p>
						지금 소울뮤직의 가족이 되어주세요! <a href="/member/joinPage">Sign Up</a>
					</p>
					<p>
						비밀번호 찾기 <a href="/member/passFindView">Find password</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</header>

<script>
	function soulplayer() {
		window.open("/playmusic", "", "width=460,height=900");
	}
	$(document).ready(function() {
		$("#myBtn").click(function() {
			$("#myModal").modal();
		});
	});
</script>
