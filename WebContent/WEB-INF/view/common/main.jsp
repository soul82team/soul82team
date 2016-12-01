<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 70%;
	margin: auto;
}

.chartV td{
	padding-top: 5px;
}

.chartV th{
	padding-bottom: 5px;
}

.chartImage{
	padding-left:6%;
	padding-right:6%; 
}

.chartTA{
	padding-left:6%;
}


</style>

	<section id="main-slider" class="no-margin" >
		<div class="carousel slide" id="myCarousel" data-ride="carousel">	
			<div class="carousel-inner">
				<div class="item active" style="background-image: url(images/slider/bg1.jpg);">
					<div class="container">
						<div class="carousel-content" align="center">
							<img src="/images/soul.png" class="animation animated-item-2" style="padding: 2% 2% 2% 2%"/>
							<div align="left" style="background-color: white; opacity: 0.9; border: 1px solid black; border-radius: 1em; width: 70%; padding: 1% 1% 1% 2%; margin-bottom: 5%" class="animation animated-item-3">
								<table class="chartV">
								<tr style="text-align: center">
									<th class="chartRank">Rank</th>
									<th class="chartImage">Image</th>
									<th class="chartTA">Music</th>
								</tr>
								<c:forEach var="mp3" items="${mp3 }" varStatus="status" begin="1" end="10" step="1">								
									<tr>
										<td class="chartRank" style="width: 10px; text-align: center">${status.count }</td>
										<td class="chartImage"><img src="/albumimage/${mp3.artist}${mp3.title}.png" style="height:50px; width: 50px"/></td>
										<td class="chartTA">${mp3.title } - ${mp3.artist }</td>
										<p></p>
									</tr>
								</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="item" style="background-image: url(images/slider/bg1.jpg)">
					<div class="container">
						<div class="carousel-content" align="center">
							<img src="/images/bugs.png" class="animation animated-item-2" style="padding: 2% 2% 2% 2%"/>
							<div align="left" style="background-color: white; border: 1px solid black; border-radius: 1em; width: 70%; padding: 1% 1% 1% 2%; margin-bottom: 5%" class="animation animated-item-3">
								<table class="chartV">
								<tr style="text-align: center">
									<th class="chartRank">Rank</th>
									<th class="chartImage">Image</th>
									<th class="chartTA">Music</th>
								</tr>
								<c:forEach var="bugs" items="${bugs2 }" varStatus="status">								
									<tr>
										<td class="chartRank" style="width: 10px; text-align: center">${status.count }</td>
										<td class="chartImage"><img src="${bugs.album }"/></td>
										<td class="chartTA">${bugs.title } - ${bugs.artist }</td>
										<p></p>
									</tr>
								</c:forEach>
								</table>
								
							</div>

						</div>
						
					</div>
				</div>
				
				<div class="item" style="background-image: url(images/slider/bg1.jpg)">
					<div class="container">
						<div class="carousel-content" align="center"> 
							<img src="/images/mnet.png" class="animation animated-item-2" style="padding: 2% 2% 2% 2%"/>
							<div align="left" style="background-color: white; border: 1px solid black; border-radius: 1em; width: 70%; padding: 1% 1% 1% 2%; margin-bottom: 5%" class="animation animated-item-3">
								<table class="chartV">
								<tr style="text-align: center">
									<th class="chartRank">Rank</th>
									<th class="chartImage">Image</th>
									<th class="chartTA">Music</th>
								</tr>
								<c:forEach var="mnet" items="${mnet }" varStatus="status">								
									<tr>
										<td class="chartRank" style="width: 10px; text-align: center">${status.count }</td>
										<td class="chartImage"><img src="${mnet.album }"/></td>
										<td class="chartTA">${mnet.title } - ${mnet.artist }</td>
										<p></p>
									</tr>
								</c:forEach>
								</table>
							</div>
						</div>
				</div>
			</div>
		</div>
	</div>
</section>


<section id="feature" style="background-image: url(images/search_back.jpg); max-width: 100%; height: auto; background-size: cover;" >


	<div class="container" align="center" style="height: 660px">
		<br />
		<br />
		<br />
		<br />
		<form action="/soulSearch">
			<div>
				<font face="Arial Black" color=white size="100"> Soul Music </font>
			</div>
			<br />
			<br />
			<div class="input-group input-group-lg">
				<input type="text" class="form-control"
					placeholder="가수 또는 제목을 입력해주세요" id="search" name="search"
					list="datas" width="">
				<datalist id="datas">
				</datalist>
				<div class="input-group-btn">
					<button class="btn btn-default" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div>
		</form>
		<br /> <br /> <br /> <br /> <br /> <i class="fa fa-play-circle-o" style="font-size: 100px; color: white; cursor: pointer;" onclick="soulplayer()"></i>
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


<section id="conatcat-info" style="background-image: url(images/qna.jpg); max-width: 100%; height: 30%; background-size: ;" >
<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 text-center">
				<h2 class="section-heading">문의사항이 있을 경우 탈퇴하세요!</h2>
				<hr class="primary">
				<p>우리 일꾼들 연락처</p>
			</div>
			<div class="col-lg-4 col-lg-offset-2 text-center">
				<i class="fa fa-phone fa-3x sr-contact"></i>
				<p>voice-fishing</p>
			</div>
			<div class="col-lg-4 text-center">
				<i class="fa fa-envelope-o fa-3x sr-contact"></i>
				<p>
					<a href="mailto:soulteam@gmail.com">soulteam@gmail.com</a>
				</p>
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
