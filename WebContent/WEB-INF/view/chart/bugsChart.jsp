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
						<th style="width:80px;">순위</th>
						<th style="width:180px;">앨범</th>
						<th style="width:180px;">가수</th>
						<th>제목</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${mp3}" varStatus="status">
					<tr>
						<td style="width:80px;">${status.count }</td>
						<td style="width:180px;"><img src="/albumimage/${list.artist}${list.title}.png" style="width:50px; height:50px"/></td>
						<td style="width:180px;">${list.artist }</td>
						<td>${list.title }</td>
						
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
						<th style="width:80px;">순위</th>
						<th style="width:180px;">앨범</th>
						<th style="width:180px;">가수</th>
						<th>제목</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bugs" items="${bugs }" varStatus="status">
					<tr>
						<td style="width:80px;">${status.count }</td>
						<td style="width:180px;"><img src="${bugs.album }"/></td>
						<td style="width:180px;">${bugs.artist }</td>
						<td>${bugs.title }</td>
						
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
						<th style="width:80px;">순위</th>
						<th style="width:180px;">앨범</th>
						<th style="width:180px;">가수</th>
						<th>제목</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="mnet" items="${mnet }" varStatus="status">
					<tr>
						<td style="width:80px;">${status.count }</td>
						<td style="width:180px;"><img src="${mnet.album }"/></td>
						<td style="width:180px;">${mnet.artist }</td>
						<td>${mnet.title }</td>
						
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