<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<header>
<div id="reg" align="center">
   <img src="/img/4.png" style="width: 130px; padding-bottom: 20px;" />

   <form id="reg_form" style="width: 700px; border: black solid 1px;
    border-radius: 1em" action="/admin/mp3up" method="post" enctype="multipart/form-data">
      <h2 align="left">Registration</h2>
      <div align="left">
         <p>
            <label>가수명</label> 
            <input type="text" id="artist" name="artist" placeholder="가수명" required /> 
         </p>
         <p>
            <label>노래제목</label> 
            <input type="text" id="title" name="title" placeholder="노래명" required />
         </p>
         <p>
            <label>MP3</label> 
            <input type="file" id="mp3" name="mp3" required />
         </p>
         <p>
            <label>뮤직비디오</label>
            <input type="text" id="mv" name="mv" placeholder="뮤직비디오" width="50%"/>
         </p>
         
      </div>
      <p>
         <button id="reg_new" type="submit">등록</button>
      </p>
   </form>

</div>
</header>


</html>