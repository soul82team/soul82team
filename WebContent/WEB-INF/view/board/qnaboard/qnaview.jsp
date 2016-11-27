<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


<form class="form-horizontal">
  <fieldset>
    <legend>Q & A</legend>
    <div class="form-group">
      <label for="inputEmail" class="col-lg-2 control-label">작성자</label>
      <div class="col-lg-10">
        <textarea class="form-control" rows="1" readonly="readonly" style="resize:none;">${obj.writer }</textarea>
      </div>
    </div>

    <div class="form-group">
      <label for="textArea" class="col-lg-2 control-label">내용</label>
      <div class="col-lg-10">
        <textarea class="form-control" rows="10" readonly="readonly" style="resize:none;">${obj.content }</textarea>
      </div>
    </div>

      <div align="right" class="col-lg-10 col-lg-offset-2">
        <input type="button" class="btn btn-default" onclick="location.href='/qna/qnaList?page=1'" value="목록으로"/>
      </div>
  </fieldset>
</form>