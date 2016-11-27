<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<%-- <c:forEach var="mnet" items="${mnet }"> --%>
<%-- 	m.net : ${mnet.artist } - ${mnet.title } //${mnet.album } <br/>   --%>
<%-- </c:forEach> --%>


<div>
<input type="button" id="bt" value="벅스뮤직탑10"/><input type="button" id="bt1" value="엠넷차트10"/>
</div>
<div class="container" id="port">
<h2 style="padding-top: 7%">bugs차트페이지</h2>
	<h2>Soul Music Chart</h2>
	<div class="table-responsive">
		<table class="table">
				<thead>
					<tr>
						<th>rank</th>
						<th>album</th>
						<th>title</th>
						<th>artist</th>
						<th>like</th>
						<th>MV</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bugs" items="${bugs }" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td><img src="${bugs.album }"/></td>
						<td>${bugs.title }</td>
						<td>${bugs.artist }</td>
						<td><img src="like.jpg" width="30" height="30" /></td>
						<td><img src="mv.png" width="30" height="30" /></td>
					</tr>
					</c:forEach>
				</tbody>
		</table>
	</div>
</div>
<div class="container" id="port1">
<h2 style="padding-top: 7%">bugs차트페이지</h2>
	<h2>Soul Music Chart</h2>
	<div class="table-responsive">
		<table class="table">
				<thead>
					<tr>
						<th>rank</th>
<!-- 						<th>album</th> -->
						<th>title</th>
						<th>artist</th>
						<th>like</th>
						<th>MV</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bugs" items="${mnet }" varStatus="status">
					<tr>
						<td>${status.count }</td>
<%-- 						<td><img src="${mnet.album }"/></td> --%>
						<td>${mnet.title }</td>
						<td>${mnet.artist }</td>
						<td><img src="like.jpg" width="30" height="30" /></td>
						<td><img src="mv.png" width="30" height="30" /></td>
					</tr>
					</c:forEach>
				</tbody>
		</table>
	</div>
</div>



<script>
$(document.getElementById("port")).hide();
	$("#bt").click(function(){
		 //$("#port").slideToggle();
		//document.getElementById("port").slideToggle();
		$(document.getElementById("port")).slideToggle();
	});
$(document.getElementById("port1")).hide();
	$("#bt1").click(function(){
		 //$("#port").slideToggle();
		//document.getElementById("port").slideToggle();
		$(document.getElementById("port1")).slideToggle();
	});
</script>
