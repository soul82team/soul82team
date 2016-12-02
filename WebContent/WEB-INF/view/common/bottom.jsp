<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	
	<footer id="footer" class="midnight-blue">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					&copy; 2016 SoulCompany. All Rights Reserved.
				</div>
				<a href="/" style="float: right; width: 100px; height: 30px"><img src="/images/soul2.png"/></a>
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
	function albumView(num, title){
		var url="/music/inform?num=" + num + "&title=" + title;
		console.log(num + "" + title);
		location.href = url;
	}
	
	function lyrics(num){
		var url = "/mp3/lyrics?num="+num;
		console.log(num);
		window.open(url, "get", "height=300; width=300");
	}
	
	//º±≈√«— «—∞Ó µË±‚
	function selectOne(val,num){
		console.log(num);
		window.open("/mp3/Onelisten?num="+num, "target", "width=420,height=150");
		setTimeout(function(){top.window.opener = top;top.window.open('','_parent','');top.window.close();});
	}
	
	</script>

    