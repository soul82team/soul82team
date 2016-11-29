<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<style>
		.tg  {border: 2px solid gray; background-color: white; border-collapse:collapse;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal; width: 20%;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal; width: 20%;}
		.tg .tg-yw4l{vertical-align:top; cursor: pointer;}
		table.tg {
 		    opacity: 0.9; 
 		    filter: alpha(opacity=90); 
		}
	</style>
</head>

<header>

<div class="container" style="padding-top: 5%">
	<img src="/images/superstar_logo.jpg" class="img-circle" alt="Cinque Terre" width="150" height="150" /><b style="font-size: 24px">&nbsp;&nbsp;SUPER STAR K 2016</b>
</div>

<div class="container"id="castplay" style="padding-top: 3%">
</div>

<div class="container" style="padding-top: 3%; width: 90%">
	<table class="tg"> 
	  <tr>
		<c:forEach var="i" items="${ssk }">
	    <th class="tg-yw4l"><img src="${i.img}" class="img-thumbnail" alt="Cinque Terre" width="200" height="150"></th>
  		</c:forEach>
	  </tr>
	  <tr>
	  	<c:forEach var="i" items="${ssk }">
	    <td class="tg-yw4l" onclick="sskCast('${i.link}')">${i.title}</td>
	    </c:forEach>
	  </tr>
	  <tr>
	  	<c:forEach var="i" items="${ssk }">
	    <td class="tg-yw4l">재생시간 : ${i.time }</td>
	    </c:forEach>
	  </tr>
	</table>
</div>

</header>
<script>
function sskCast(link){
	var url="/naver/cast?link="+link;
// 	window.open(url,"","");
    $.ajax({      
        type:"get",  
        url:url,      
    }).done(function(resp){
    	$("#castplay").html(resp);
    });  
}
 
</script>
