<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
<h2>Soul Music Chart</h2>
	<tr>
		<th>  <button type="button" class="btn btn-success" id="cBox_all">전체 선택</button></th>
		<th>  <button type="button" class="btn btn-success" id="listen">선택 듣기</button></th>
		<th>  <button type="button" class="btn btn-success" id="select">선택 담기</button></th>
	</tr>
<div class="table-responsive">
	<table class="table">
			<thead>
				<tr>
					<th>선택</th>
					<th>순위</th>
					<th>가수</th>
					<th>제목</th>
					<th>가사</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list }" varStatus="status">
				<tr>
					<td><input type="checkbox" id="cBox"></td>
					<td id="pk">${list.num }</td>
					<td>${list.artist }</td>
					<td id="tt" onclick="selectOne('${list.title}', ${list.num })">${list.title }</td>
					<td><i style="font-size:24px" class="fa" id="lyrics">&nbsp;&#xf0f6;</i></td>
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

//선택담기
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
		window.open(url, "target", "height=500; width=800");
		setTimeout(function(){top.window.opener = top;top.window.open('','_parent','');top.window.close();});
	});
});

//노래 목록에 추가하기===================================================================
function addOne(num){
	var url = "/mp3/listen?mp3="+num;
	console.log(num);
	 $.ajax ({
		  type:"get",  
	      url:url,      
    }).done(function(resp){
    	
    });
}	

//선택한 한곡 듣기
function selectOne(val,num){
	console.log(num);
	window.open("/mp3/Onelisten?num="+num, "target", "width=440,height=150");
	setTimeout(function(){top.window.opener = top;top.window.open('','_parent','');top.window.close();});
}
</script>