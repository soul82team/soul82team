<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<h2>질문남기기</h2>

<form action="/qna/regqna" method="get" onsubmit="convert()" style="border-color: black">
	<select name="cate">
		<option value="음악">음악</option>
		<option value="서비스 문의">서비스 문의/오류</option>
		<option value="회원정보">회원정보</option>
		<option value="기타">기타</option>
	</select>
	<input type="text" name="title" size="80"/> <br/>
	<textarea name="content" id="ta" style="width:726px;">
	</textarea>
	<br/>
	<div align="center">
		<input type="submit" class="btn btn-primary" value="등록"/>
	</div>
</form>

<script src="/editor/js/HuskyEZCreator.js"></script>


<script>
	function convert(){
		window.alert("등록되었습니다.");
		oEditors.getById["ta"].exec("UPDATE_CONTENTS_FIELD", []);	
	}

</script>

<script>
	var oEditors = [];
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "ta",
		sSkinURI: "/editor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			fOnBeforeUnload : function(){
			}
		}, //boolean
		fOnAppLoad : function(){
		},
		fCreator: "createSEditor2"
	});
</script>