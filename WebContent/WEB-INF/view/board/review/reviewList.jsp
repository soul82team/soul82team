<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<h2>Review</h2> 
	<hr/>
	<table class="table">
		<thead>
			<tr>
				<th>�� ��ȣ</th>
				<th>�ۼ���</th>
				<th>������</th>
				<th>���䳻��</th>
				<th>����</th>
				<th>�ۼ���</th>
				
			</tr>
		</thead>

		<tbody>
		<c:forEach var="obj" items="${data }">
			<tr id="f${obj.NUM}">
				<td>${obj.NUM}</td>
				<td> ${obj.ID } </td>
				<td> ${obj.MUSICTITLE }  </td>
				<td>${obj.COMMENTS}</td>
				<td>${obj.GRADE}</td>
				<td>${obj.WRITEDATE}</td>
				
				
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>