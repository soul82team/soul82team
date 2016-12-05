<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<h2>Q & A</h2> 
	<hr/>
	<table class="table">
		<thead>
			<tr>
				<th>�� ��ȣ</th>
				<th>�з�</th>
				<th>�ۼ���</th>
				<th>����</th>
				<th>�ۼ���</th>
				<th>��ȸ��</th>
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
		<button type="submit" class="btn btn-primary" name="write">���� ���</button>
	</form>
</div>
	
<div align="center">
	<ul class="pagination pagination-sm">
	<c:forEach var="i" begin="1" end="${last }" >
		<li><a href="/qna/qnaList?page=${i }">${i }</a></li>
	</c:forEach>
	</ul>
	<form action="/qna/search">
		<input type="text" name="search" />
		<input type="submit" value="�˻�" />
	</form>
</div>

