<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
<div id="reg" align="center">
   <img src="/images/1.png" style="width: 100px; padding-bottom: 20px;" />

  <form id="reg_form" style="width: 700px; border: black solid 1px; border-radius: 1em" action="/member/memUp">
      <h2 align="left">ȸ�� ���� ����</h2>
      <div align="left">
         <p>
            <label>����</label>
            <img src="/memberimage/${img.IMGNAME}" width="30" height="30"/>
         </p>
         <p>
            <label>���̵�</label>&nbsp;&nbsp;<b>${data.ID}</b>                                             
         </p>
         <p>
            <label>��й�ȣ</label> 
            <input type="password" id="pass" name="pass" placeholder="��й�ȣ" required /> 
            <input type="password" id="pass2" placeholder="��й�ȣȮ��" disabled="disabled" required />
         </p>
         <span id="rst2"></span>
         <p>
            <label>�̸�</label> &nbsp;&nbsp;<b>${data.NAME}</b>
              </p>
         <p>
            <label>����</label> &nbsp;&nbsp;<b>${data.GENDER}</b>
            
         </p>
         <p>
            <label>�������</label>&nbsp;&nbsp;<b>${data.BIRTH}</b>
           
         <p>
            <label>�̸���</label>
            <input type="email" id="mail" name="mail" placeholder="E-mail�Է�" required />
         </p>
         <!-- 
         <p id="accept">
         <input id="accept_terms" name="accept_terms" type="checkbox" />
         <label for="accept_terms">
            <strong>
            <a href="#" rel="external" target="_blank">���� �̿� ���</a>, 
            <a href="#" rel="external" target="_blank">���� ���� ���� �̿�</a>�� ����</strong>�մϴ�.
         </label>
         </p>
         -->          
      </div>
      <p>
         <button id="modify" type="submit">�����ϱ�</button><button id="modify">ȸ��Ż��</button>
      </p>
   </form>
</div>
  <div id="port" align="center" name="port">
	<legend>
		<b>ȸ��Ż��</b>
	</legend>
	<form id="reg_form" action="/member/leave">
		 <b> ${id }</b> <br /> <b>PASS</b><br />
		 <input type="password" required="required" name="pass" /><br />
		<hr />
		<button id="modify" type="submit">����</button>
	</form>

</div>
</header>


<script>
$(document.getElementById("port")).hide();
	$(document.getElementsByName("bt")).click(function(){
		$(document.getElementById("port")).slideToggle();
	});
</script>