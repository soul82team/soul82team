<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<head>
	<meta charset="utf-8">
	<meta name="viewport">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>


<header>
	    <div style="width: 40%" align="center">
	      <input type="text" class="form-control" placeholder="Soul Search" name="urlSearch" id="search"/>
	      <div class="input-group-btn">
	        <button class="btn btn-default" type="button" id="bt-okay" ><i class="glyphicon glyphicon-search"></i></button>
	      </div>
	    </div>
	
<div class="container" id="search_rst">
</div>

</header>

<script>
$("#bt-okay").click(function(){  
    var url="/youtube/search?urlSearch="+$("#search").val();  
    $.ajax({      
        type:"get",  
        url:url,      
    }).done(function(resp){
    	$("#search_rst").html(resp);
    });  
});  


</script>