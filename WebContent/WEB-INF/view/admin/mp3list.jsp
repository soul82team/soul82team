<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
<h2>Soul Music Chart</h2>
	<tr>
		<th>  <button type="button" class="btn btn-success">전체 선택</button></th>
		<th>  <button type="button" class="btn btn-success">선택 듣기</button></th>
		<th>  <button type="button" class="btn btn-success">선택 담기</button></th>
	</tr>
<div class="table-responsive">
	<table class="table">
			<thead>
				<tr>
					<th>select</th>
					<th>rank</th>
					<th>title</th>
					<th>artist</th>
					<th>like</th>
					<th>MV</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list }" varStatus="status">
				<tr>
					<td><input type="checkbox" name="chk"></td>
					<td>${status.count }</td>
					<td>${list.title }</td>
					<td>${list.artist }</td>
						<td><img src="/img/like.jpg" width="30" height="30" /></td>
						<td><img src="${list.mv }" width="30" height="30" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>