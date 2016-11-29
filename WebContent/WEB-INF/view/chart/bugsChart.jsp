<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <c:forEach var="mnet" items="${mnet }"> --%>
<%-- 	m.net : ${mnet.artist } - ${mnet.title } //${mnet.album } <br/>   --%>
<%-- </c:forEach> --%>

<h2 style="padding-top: 7%">bugs차트페이지</h2>


<div class="container">
	<h2>Soul Music Chart</h2>
	<div class="table-responsive">
		<table class="table">
				<thead>
					<tr>
						<th>rank</th>
						<th>album</th>
						<th>title</th>
						<th>artist</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bugs" items="${bugs }" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td><img src="${bugs.album }"/></td>
						<td>${bugs.title }</td>
						<td>${bugs.artist }</td>
						
					</tr>
					</c:forEach>
				</tbody>
		</table>
	</div>
</div>
<h2 style="padding-top: 7%">bugs차트페이지</h2>


<div class="container">
	<h2>Soul Music Chart</h2>
	<div class="table-responsive">
		<table class="table">
				<thead>
					<tr>
						<th>rank</th>
						<th>album</th>
						<th>title</th>
						<th>artist</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="mnet" items="${mnet }" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td><img src="${mnet.album }"/></td>
						<td>${mnet.title }</td>
						<td>${mnet.artist }</td>
						
					</tr>
					</c:forEach>
				</tbody>
		</table>
	</div>
</div>



