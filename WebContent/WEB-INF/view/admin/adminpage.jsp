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
            <label>MP3</label> 
            <input type="file" id="mp3" name="mp3" required />
         </p>
      </div>
      <p>
         <button id="reg_new" type="submit">등록</button>
      </p>
   </form>

</div>
</header>


</html>