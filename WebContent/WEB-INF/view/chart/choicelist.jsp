<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<p>${title }</p>
${sessionScope.userId }

<div>
	앨범이름 입력 <br/>
	<input type="text" id="albumName"/>
	<input hidden="true" id="title" value=${title } />
	<input hidden="true" id="userId" value="${sessionScope.userId }">
	<button id="albumCh">담기</button>
	<button id="albumlist">리스트보기</button><br/>
	<span id="result"></span>
	<br/>
</div>

<script>
	document.getElementById("albumCh").addEventListener("click", function(){
		var albumName = document.getElementById("albumName").value;
		var title = document.getElementById("title").value;
		var userId = document.getElementById("userId").value;
		
		console.log("/choice/createAlbum?albumName="+albumName+"&title="+title+"&userId="+userId);
		
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/choice/createAlbum?albumName="+albumName+"&title="+title+"&userId="+userId, true);	
		xhr.onreadystatechange=function(){
			if(xhr.status==200&xhr.readyState==4){
				var t =xhr.responseText;
				console.log(t);
				var html;
				if(t=="true") {
					html = "<b style='color:green;'>등록 성공 !</b><br/>";
				}else {
					html = "<b style='color:red;'>등록 실패 !</b><br/>";
				}
				document.getElementById("result").innerHTML = html;
			}
				
		};
		xhr.send();
	});
</script>








