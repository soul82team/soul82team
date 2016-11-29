<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	
	<footer id="footer" class="midnight-blue">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					&copy; 2013 <a target="_blank" href="http://shapebootstrap.net/" title="Free Twitter Bootstrap WordPress Themes and HTML templates">ShapeBootstrap</a>. All Rights Reserved.
				</div>
				<div class="col-sm-6">
					<ul class="pull-right">
						<li><a href="#">Home</a></li>
						<li><a href="#">About Us</a></li>
						<li><a href="#">Faq</a></li>
						<li><a href="#">Contact Us</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>	
	<script src="/js/jquery.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/jquery.prettyPhoto.js"></script>
	<script src="/js/jquery.isotope.min.js"></script>
	<script src="/js/main.js"></script>
	<script src="/js/wow.min.js"></script>
	
<script>

	document.getElementById("createId").addEventListener("blur", function(){
		var v =document.getElementById("createId").value;
		console.log(v);
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/member/joinAjax.it?id="+v, true);
		xhr.onreadystatechange=function(){
			if(xhr.status==200&xhr.readyState==4){
				var t =xhr.responseText;
				var html;
				if(t=="TRUE") {
					html = "<b style='color:red;'>������� ���̵��Դϴ�</b><br/>";
				}else if(v.length < 6){
					html = "<b style='color:red;'>���̵� 6�� �̻� �Է����ּ���</b><br/>";
				}else {
					html = "<b style='color:green;'>���� ���̵��Դϴ�</b><br/>";
				}
				document.getElementById("rst").innerHTML = html;
			}
				
		};
		xhr.send();
	});
	
	document.getElementById("pass1").addEventListener("blur", function(){
			var pass1 = document.getElementById("pass1").value;
			var pass2 = document.getElementById("pass2").value;
			var chk_num = pass1.search(/[0-9]/g);
			var chk_eng = pass1.search(/[a-z]/ig);
			
			
	 			if(pass1.length < 8){
	 				html = "<b style='color:red; padding-left : 100px;'>��й�ȣ�� 8~20�ڸ��� �������ּ���.</b><br/><br/>";
	 			}else {
	 				if(chk_num<0 || chk_eng<0){
	 					html = "<b style='color:red; padding-left : 100px;'>��й�ȣ��  ����, ���� �������� �������ּ���.</b><br/><br/>";
	 				}else if(/(\w)\1\1\1/.test(pass1)){
	 					html = "<b style='color:red; padding-left : 100px;'>��й�ȣ�� ���� ���ڸ� 4���̻� ����Ͻ� �� �����ϴ�.</b><br/><br/>";
	 				}else{
	 					html = "";
	 					document.getElementById("rst2").innerHTML = html;
	 					document.getElementById("pass2").disabled = false;
	 				}
				}
			document.getElementById("rst2").innerHTML = html;		
		});
	
	
	document.getElementById("pass2").addEventListener("blur", function(){
		var pass1 = document.getElementById("pass1").value;
		var pass2 = document.getElementById("pass2").value;
			if(pass2.length < 1){
				document.getElementById("pass2").disabled = true;
			}else if(pass2==pass1){
				html = "<b style='color:green; padding-left : 100px;'>��й�ȣ ��ġ</b><br/><br/>";
			}else {
				html = "<b style='color:red; padding-left : 100px;'>��й�ȣ ����ġ</b><br/><br/>";
			}					
		document.getElementById("rst2").innerHTML = html;
	});
	
	// �̸��� ����
	function authpop(){
		var mail = document.getElementById("mail").value;
		var url = "/member/mailConfirm?authmail="+mail;
		window.open(url, "authmail", "heigth=100; width=150");
	}

</script>
    