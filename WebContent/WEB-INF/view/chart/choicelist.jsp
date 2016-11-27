<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<p>${title }</p>
${sessionScope.userId }

<div>
	�ٹ��̸� �Է� <br/>
	<input type="text" id="albumName"/>
	<input hidden="true" id="title" value=${title } />
	<input hidden="true" id="userId" value="${sessionScope.userId }">
	<button id="albumCh">���</button>
	<button id="albumlist">����Ʈ����</button><br/>
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
					html = "<b style='color:green;'>��� ���� !</b><br/>";
				}else {
					html = "<b style='color:red;'>��� ���� !</b><br/>";
				}
				document.getElementById("result").innerHTML = html;
			}
				
		};
		xhr.send();
	});
</script>








