<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style>
.table-responsive {
	padding-top:2%
}

</style>
<div class="container">	
	<div style="padding-top:8%">
		<input type="button" id="bt3" value="Soul차트" class="btn btn-success">
		<input type="button" id="bt1" value="bugs차트" class="btn btn-success"> 
		<input type="button" id="bt2" value="M.net차트" class="btn btn-success">
	</div>
	
<div class="container" id="soul" style="padding-top:3%; padding-bottom:3%">
	<img src="/images/soul.png"/>
		<div class="table-responsive">
		<table class="table">
				<thead>
					<tr>
						<th>순위</th>
						<th>앨범</th>
						<th>가수</th>
						<th>제목</th>
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




<div class="container" id="bugs" style="padding-top:3%; padding-bottom:3%">
<img src="/images/bugs.png"/>
	<div class="table-responsive">
		<table class="table">
				<thead>
					<tr>
						<th>순위</th>
						<th>앨범</th>
						<th>가수</th>
						<th>제목</th>
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

<div class="container" id="Mnet" style="padding-top:3%; padding-bottom:3%">
<img src="/images/mnet.png"/>
	<div class="table-responsive">
		<table class="table">
				<thead>
					<tr>
						<th>순위</th>
						<th>앨범</th>
						<th>가수</th>
						<th>제목</th>
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