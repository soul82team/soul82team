<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
    <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
	<h2>${sessionScope.userId} 님의 앨범 목록</h2> <hr/>
  
    <div >
    	<h4>총 <b> ${total }</b> 개의 앨범 </h4>
    	<hr/>
    	
    	<table class="table">
			<thead>
				<tr>
					<th>앨범명</th>
					<th>생성일자</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="m" items="${m }">
				<tr>
					<td><a onclick="albumList('${m.NUM}')">${m.ALBUMNAME }</a></td>
					<td>${m.CREATEDATE }</td>
					<td><button type="button" class="btn btn-danger" onclick="del('${m.NUM}')">삭제</button></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
    </div>
</div>

<script>
function albumList(val){
	console.log(val);
	var url="/mp3/albumlist?albumNum="+val;
	window.open(url, "", "height=500; width=800");
// 	setTimeout(function(){top.window.opener = top;top.window.open('','_parent','');top.window.close();});
}

function del(val){
	var result = confirm('앨범을 정말 삭제하시겠습니까?');

    if(result) {
       //yes
		location.href="/mp3/deleteAlbum?num="+val;
    } else {
        //no
    }
}

</script>