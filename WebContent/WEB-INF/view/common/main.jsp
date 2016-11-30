<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 70%;
	margin: auto;
}
</style>

<section id="main-slider" class="no-margin">
	<div class="carousel slide" id="myCarousel" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#main-slider" data-slide-to="0" class="active"></li>
			<li data-target="#main-slider" data-slide-to="1"></li>
			<li data-target="#main-slider" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="item active"
				style="background-image: url(images/slider/bg1.jpg)">
				<div class="container">
					<div class="carousel-content" align="center">
						<h2 class="animation animated-item-2">Bugs Chart !!!</h2>
						<div align="left"
							style="background-color: white; border: 1px solid black; border-radius: 1em; width: 70%; padding: 2% 2% 2% 2%"
							class="animation animated-item-3">
							<c:forEach var="bugs" items="${bugs2 }" varStatus="status">
								<tr>
									<td>${status.count }</td>
									<td><img src="${bugs.album }" /></td>
									<td>${bugs.title }</td>
									<td>${bugs.artist }</td>
									<p></p>
								</tr>
							</c:forEach>
						</div>
						<a class="btn-slide animation animated-item-4" href="#">Read
							More</a>
					</div>
					<!-- 						<div class="col-sm-6 hidden-xs animation animated-item-5"> -->
					<!-- 							<div class="slider-img"> -->
					<!-- <!-- 								<img src="/images/slider/img1.png" class="img-responsive"> -->
					-->
					<!-- 							</div> -->
					<!-- 						</div> -->
				</div>
			</div>

			<div class="item"
				style="background-image: url(images/slider/bg1.jpg)">
				<div class="container">
					<div class="carousel-content" align="center">
						<h2 class="animation animated-item-2">Mnet Chart !!!</h2>
						<div align="left"
							style="background-color: white; border: 1px solid black; border-radius: 1em; width: 70%; padding: 2% 2% 2% 2%"
							class="animation animated-item-3">
							<c:forEach var="mnet" items="${mnet }" varStatus="status">
								<tr>
									<td>${status.count }</td>
									<td><img src="${mnet.album }" /></td>
									<td>${mnet.title }</td>
									<td>${mnet.artist }</td>
									<p></p>
								</tr>
							</c:forEach>
						</div>
						<a class="btn-slide animation animated-item-4" href="#">Read
							More</a>
					</div>
					<!-- 						<div class="col-sm-6 hidden-xs animation animated-item-5"> -->
					<!-- 							<div class="slider-img"> -->
					<!-- <!-- 								<img src="/images/slider/img1.png" class="img-responsive"> -->
					-->
					<!-- 							</div> -->
					<!-- 						</div> -->
				</div>
			</div>

			<div class="item"
				style="background-image: url(images/slider/bg1.jpg)">
				<div class="container">
					<div class="carousel-content" align="center">
						<h2 class="animation animated-item-2">Bugs Chart !!!</h2>
						<div align="left"
							style="background-color: white; border: 1px solid black; border-radius: 1em; width: 70%; padding: 2% 2% 2% 2%"
							class="animation animated-item-3">
							<c:forEach var="bugs" items="${bugs2 }" varStatus="status">
								<tr>
									<td>${status.count }</td>
									<td><img src="${bugs.album }" /></td>
									<td>${bugs.title }</td>
									<td>${bugs.artist }</td>
									<p></p>
								</tr>
							</c:forEach>
						</div>
						<a class="btn-slide animation animated-item-4" href="#">Read
							More</a>
					</div>
					<!-- 						<div class="col-sm-6 hidden-xs animation animated-item-5"> -->
					<!-- 							<div class="slider-img"> -->
					<!-- <!-- 								<img src="/images/slider/img1.png" class="img-responsive"> -->
					-->
					<!-- 							</div> -->
					<!-- 						</div> -->
				</div>
			</div>
		</div>
	</div>
</section>


<section id="feature"
	style="background-image: url(images/search_back.jpg)"
	style="max-width: 100%; height: auto;">
	
	<div class="container" align="center" style="height: 660px">
	<br/><br/><br/><br/>
		<form action="/soulSearch">
			<div>
				<font face="Arial Black" color=white size="100"> Soul Music </font> 
			</div>
			<br/><br/>
			<div class="input-group input-group-lg">
				<input type="text" class="form-control" placeholder="가수 또는 제목을 입력해주세요"
					id="search" name="search" list="datas" width="">
				<datalist id="datas">
				</datalist>
				<div class="input-group-btn">
					<button class="btn btn-default" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div>
		</form>
		<br />
		<br />
		<br />
		<br />
		<br /> <i class="fa fa-play-circle-o"
			style="font-size: 100px; color: white" onclick="soulplayer()"></i>
	</div>
</section>



<section id="recent-works">
	<div class="container">
		<div class="center wow fadeInDown">
			<h2>오늘의 노래</h2>
			<p class="lead">
				오늘의 인기차트 <b>TOP 10</b>
			</p>
		</div>
		<div class="row">
			<c:forEach var="mp3" items="${mp3 }" begin="1" end="8" step="1">
				<div class="col-xs-12 col-sm-4 col-md-3">
					<div class="recent-work-wrap">
						<img src="/albumimage/${mp3.artist}${mp3.title}.png"
							class="img-responsive" style="height: 300px" alt="">
						<div class="overlay">
							<div class="recent-work-inner">
								<h3>
									<a href="#">${mp3.title }</a>
								</h3>
								<p>${mp3.artist }</p>
								<a class="preview"
									onclick="albumView('${mp3.num}', '${mp3.title }')"><i
									class="fa fa-eye"></i> View</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>




<!-- 채널 섹션 -->
<section id="middle">
	<div class="container">
		<button type="button" class="btn btn-success btn-sm" id="superstar">슈퍼스타
			K</button>
		<button type="button" class="btn btn-info btn-sm" id="sketch">유희열의
			스케치북</button>
	</div>
	<div class="container">
		<div class="row" id="channel">
			<c:import url="/naver/channelSSK"></c:import>
			<%-- 			<c:import url="/naver/channelYHY"></c:import> --%>
		</div>
	</div>
</section>

<section id="conatcat-info">
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<div class="media contact-info wow fadeInDown"
					data-wow-duration="1000ms" data-wow-delay="600ms">
					<div class="pull-left">
						<i class="fa fa-phone"></i>
					</div>
					<div class="media-body">
						<h2>Have a question or need a custom quote?</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore dolore magna aliqua.
							Ut enim ad minim veniam, quis nostrud exercitation +0123 456 70
							80</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<script>
	$("#superstar").click(function(){  
	    var url="/naver/channelSSK";
	    $.ajax({      
	        type:"get",  
	        url:url,      
	    }).done(function(resp){
	    	$("#channel").html(resp);
	    });  
	});
	
	$("#sketch").click(function(){  
	    var url="/naver/channelYHY";
	    $.ajax({      
	        type:"get",  
	        url:url,      
	    }).done(function(resp){
	    	$("#channel").html(resp);
	    });  
	});

	function allChk(){
		var chk = $("input[name='chk_all']").is(":checked");
		
		if(chk){
			$("input[name='chk']").prop("checked", true);
		}else{
			$("input[name='chk']").prop("checked", false);
		}
	}
	
	function allChk2(){
		var chk = $("input[name='chk_all']").is(":checked");
		
		if(chk){
			$("input[name='chk']").prop("checked", false);
			$("input[name='chk_all']").prop("checked", false);	
		}else{
			$("input[name='chk']").prop("checked", true);
			$("input[name='chk_all']").prop("checked", true);	
		}
	}
	
	document.getElementById("choice").addEventListener("click", function(){
		
		var url = "/choice/list?tt=";

		if(${sessionScope.userId eq null}){
			window.alert("로그인이 필요합니다 !");
		}else{
			$(".chkc").each(function(){
				//	console.log($(this).val());
				//	console.log($(this).prop("checked"));
				
					if($(this).prop("checked")){
						var tt = Array();
						tt = $(this).val() + "/";
						// console.log(tt);
						url += tt;
					}
			});
		}
		console.log(url);
		window.open(url, "choice", "height=200; width=100");
	});
	
	function albumView(num, title){
		var url="/music/inform?num=" + num + "&title=" + title;
		console.log(num + "" + title);
		location.href = url;
	}
	
	$("#search").keyup(function(){
		var word=$("#search").val();
		console.log(word);
		
		 var url="/search/word?search="+word;  
		 $.ajax({      
		   type:"get",  
		    url:url,      
		 }).done(function(resp){
		  	$("#datas").html(resp);
		});
	});

</script>
