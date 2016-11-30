<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<div >
<input type="button" id="bt3" value="Soul차트" class="btn btn-default"><input type="button" id="bt1" value="bugs차트" class="btn btn-default"> <input type="button" id="bt2" value="M.net차트" class="btn btn-default">
</div>
<div class="container" id="soul">
<h2 style="padding-top: 7%">Soul차트페이지</h2>
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
					<c:forEach var="list" items="${list }" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td><img src="/albumimage/${list.artist}${list.title}"/></td>
						<td>${list.title }</td>
						<td>${list.artist }</td>
						
					</tr>
					</c:forEach>
				</tbody>
		</table>
	</div>
</div>




<div class="container" id="bugs">
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



<div class="container" id="Mnet">
<h2 style="padding-top: 7%">M.net차트페이지</h2>
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
<script>

$("#bugs").hide();
$("#Mnet").hide();



$("#bt1").click(function() {
	$("#bugs").show();
	
	$("#Mnet").hide();
	$("#soul").hide();
});
$("#bt2").click(function() {
	$("#Mnet").show();
	$("#bugs").hide();
	
	$("#soul").hide();
});
$("#bt3").click(function() {
	$("#soul").show();
	$("#bugs").hide();
	$("#Mnet").hide();
	
});

 
//click, keypress, blur ,keyup
 
</script>


