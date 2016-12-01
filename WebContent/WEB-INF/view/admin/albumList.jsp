<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<meta charset="utf-8">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Sansita+One" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="/bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- Custom Fonts -->

<div class="container">
<h2>Soul Music Chart</h2>
	<tr>
		<th>  <button type="button" class="btn btn-success" id="cBox_all">전체 선택</button></th>
		<th>  <button type="button" class="btn btn-success" id="listen">선택 듣기</button></th>
		<th>  <button type="button" class="btn btn-danger	" id="select">선택 삭제</button></th>
	</tr>
<div class="table-responsive">
	<table class="table">
			<thead>
				<tr>
					<th>선택</th>
					<th>순위</th>
					<th>뮤직</th>
					<th>가사</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${mp3list }" varStatus="status">
				<tr>
					<td><input type="checkbox" id="cBox"></td>
					<td id="pk">${list.num }</td>
					<td id="tt" onclick="selectOne('${list.title}', ${list.num })">${list.title } - ${list.artist }</td>
					<td><i class="fa fa-file-text-o" style="font-size: 24px" onclick="lyrics('${list.num}')"></i></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<script>

//전체선택
$(function(){
	var chk=false;
	$("#cBox_all").click(function(){
		chk= !chk;
		console.log(chk);
		if(chk){
			$("input:checkbox[id='cBox']").prop("checked", true);
		}else{
			$("input:checkbox[id='cBox']").prop("checked", false);
		}
	});
});

//선택삭제
$(function(){
	$("#select").click(function(){
		var url = "/mp3/pass?mp3="
				
		$("input:checkbox[id='cBox']:checked").each(function(idx,row){
			var record = $(row).parents("tr").children("#pk");
			var t=record[0].innerText+"@@";
			console.log(t);
			url+=t;
		});
		window.open(url, "", "height=500; width=800");
	});
});

//선택듣기===================================================================
$(function(){
	$("#listen").click(function(){
		var url = "/mp3/listen?mp3="
		$("input:checkbox[id='cBox']:checked").each(function(idx,row){
			var record = $(row).parents("tr").children("#pk");
			var t=record[0].innerText+"@@";
			console.log(t);
			url+=t;
		});
		window.open(url, "", "height=500; width=800");
	});
});


//선택한 한곡 듣기
function selectOne(val,num){
	console.log(num);
	window.open("/mp3/Onelisten?num="+num, "", "width=440,height=150");
}

function lyrics(num){
	var url = "/mp3/lyrics?num="+num;
	console.log(num);
	window.open(url, "get", "height=800; width=500");
}

</script>