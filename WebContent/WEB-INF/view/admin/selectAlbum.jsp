<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<div class="container">
	<h2>${sessionScope.userId} 님의 앨범 목록</h2> <hr/>
  
    <div >
    	<h4>총 <b> ${total }</b> 개의 노래 선택 </h4>
    	<hr/>
    	
	   	<div class="form-group" id="complete">	
	      <label for="focusedInput">앨범명</label>
	      <input class="form-control" id="albumName" type="text">
	      <button type="submit" class="btn btn-default" id="make">만들기</button>
	    </div>
    	
    	<table class="table">
			<thead>
				<tr>
					<th>앨범명</th>
					<th>생성일자</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="m" items="${m }">
				<tr>
					<td>${m.ALBUMNAME }</td>
					<td>${m.CREATEDATE }</td>
					<td><i style="font-size:24px" class="fa" id="add">&#xf067;</i></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
    </div>
</div>

<script>
$(function(){
	$("#make").click(function(){
		var url = "/mp3/makeAlbum?name=";
		var makeName=$("#albumName").val();
		window.open(url+makeName, "", "height=500; width=800");
		setTimeout(function(){top.window.opener = top;top.window.open('','_parent','');top.window.close();});
	});
});


$(function(){
	$("#add").click(function(){
// 		var url = "/mp3/makeAlbum?name=";
// 		var makeName=$("#albumName").val();
		
		window.open(url+makeName, "", "height=500; width=800");
		setTimeout(function(){top.window.opener = top;top.window.open('','_parent','');top.window.close();});
	});
});
</script>
