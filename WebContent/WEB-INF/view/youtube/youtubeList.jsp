<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<style>
		.tg  {border-collapse:collapse;border-spacing:0;border-width:1px;border-style:solid;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;}
		.tg .tg-yw4l{vertical-align:top}
		table.tg {
 		    opacity: 0.9; 
 		    filter: alpha(opacity=90); 
		}
	</style>
</head>

<body>

<div class="container" style="padding-top: 5%">
	<table class="tg" style="background: white ;" > 
	<c:forEach var="i" items="${search }">
	  <tr>
	    <th class="tg-yw4l" rowspan="3"><img src="${i.image}" class="img-thumbnail" alt="Cinque Terre" width="200" height="150"></th>
	    <th class="tg-yw4l"><a onclick="mvOpen('${i.video}')">${i.title }</a></th>
	  </tr>
	  <tr>
	    <td class="tg-yw4l">재생시간 : ${i.time }</td>
	  </tr>
	  <tr>
	    <td class="tg-yw4l">설명</td>
	  </tr>
	  </c:forEach>
	</table>
</div>

	
<script>
function mvOpen(val){
	var popOption = "width=655, height=380, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
	console.log(val);
	window.open("/youtube/mvplay?key="+val,"youtube",popOption);
}
</script>

