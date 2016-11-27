<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<h2>Q & A</h2> 
	<hr/>
	<table class="table">
		<thead>
			<tr>
				<th>글 번호</th>
				<th>분류</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>

		<tbody>
		<c:forEach var="obj" items="${data }">
			<tr id="f${obj.num}">
				<td> ${obj.num } </td>
				<td> ${obj.cate } </td>
				<td> ${obj.writer }  </td>
				<td><a href="/qna/view?num=${obj.num }"> ${obj.title }</a> </td>
				<td> ${obj.writedate } </a></td>
				<td><span style="color: green">${obj.hit }</span> </td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>


<div align="right">
	<form action="/qna/regpage">

		<input type="hidden" name="menu" value="board" />
		
		<c:choose>
			<c:when test="${logCheck eq null }">
				[비로그인 상태]버튼 활성화하고 클릭할때 에러메세지 띄우고싶은데...
			</c:when>
			<c:otherwise>
				<button type="submit" class="btn btn-primary" name="write">질문 등록</button>
			</c:otherwise>
		</c:choose>
	</form>
</div>
	
<div align="center">
	<ul class="pagination pagination-sm">
	<c:forEach var="i" begin="1" end="${last }" >
		<li><a href="/qna/qnaList?page=${i }">${i }</a></li>
	</c:forEach>
	</ul>

	<form action="/qna/search?word=${obj.NUM }">
		<input type="text" name="search" />
		<input type="submit" value="검색" />
	</form>
</div>

