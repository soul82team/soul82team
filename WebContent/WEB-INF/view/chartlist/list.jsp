<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <br/><br/><br/>
     <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <div class="container">
  <h2>차트리스트</h2>
  <button type="button" id="bt-b1" class="btn btn-success">벅스</button>
  </div>
  

 
    <div id="list">
    
    
   
<script>
$("#bt-b1").click(function(){  
    var url="/chart/list";  
    $.ajax({      
        type:"get",  
        url:url,
    }).done(function(resp){
    	$("#list").html(resp);
    });  
});  


</script>