<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>


<form class="form-horizontal">
  <fieldset>
    <legend>Q & A</legend>
    <div class="form-group">
      <label for="inputEmail" class="col-lg-2 control-label">작성자</label>
      <div class="col-lg-10">
        <textarea class="form-control" rows="1" readonly="readonly" style="width:80%;resize:none;">${obj.writer }</textarea>
      </div>
    </div>

    <div class="form-group">
      <label for="textArea" class="col-lg-2 control-label">내용</label>
      <div class="col-lg-10">
      
        <div  class="form-control" rows="10" readonly="readonly" style="width:80%; height:30%; resize:none;"  >${obj.content }</div>
      </div>
    </div>

      <div align="right" class="col-lg-10 col-lg-offset-2" style="width:68%;">
        <input type="button" class="btn btn-danger" onclick="delMemo('${obj.num}','${obj.writer }','${sessionScope.userId }')" value="삭제"/>
        <input type="button" class="btn btn-default" onclick="location.href='/qna/qnaList?page=1'" value="목록으로"/>
      </div>
  </fieldset>
</form>


<script>
function delMemo(num,writer,userId){
	if(writer==userId){
		if(confirm("정말로 삭제하시겠습니까?")==true){
			window.alert("삭제되었습니다.")
			location.href="/qna/delMemo?num="+num;
		}else{
			return;
		}
	}else{
		window.alert("자신의 글만 삭제할 수 있습니다.");
	}
}

</script>