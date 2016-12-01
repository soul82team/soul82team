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

	<div align="center" style="padding-top: 5%;">
	
	 <h1> <i class="fa fa-youtube-play" style="font-size:48px;color:red"></i> Soul Music Video</h1>
	    <div style="width: 40%">
	      <div class="input-group-btn">
		      <input type="text" class="form-control" placeholder="Soul Search" name="urlSearch" id="search" style="margin-bottom: 3%"/>
		      <button class="btn btn-default" type="button" id="bt-okay" style="width: 10%; height: 15%;"><i class="glyphicon glyphicon-search"></i></button>
	      </div>
	    </div>
   
		<div class="container" id="search_rst" style="padding-bottom: 5%">
		</div>
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