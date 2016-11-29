<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
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
			<div class="carousel-inner" role="listbox">
				<div class="item active" style="background-image: url(images/slider/bg1.jpg)">
					<div class="container">
						<div class="row slide-margin">
							<div class="col-sm-6">
								<div class="carousel-content">
									<!--  <h1 class="animation animated-item-1">Lorem ipsum dolor sit amet consectetur adipisicing elit</h1>-->
									<b class="animation animated-item-2">
									<c:forEach var="bugs" items="${bugs2 }" varStatus="status">
							<tr>
								
								<td>${status.count }</td>
								<td><img src="${bugs.album }" /></td>
								<td>${bugs.title }</td>
								<td>${bugs.artist }</td>
								<br/>
								
							</tr>
						</c:forEach>
									</b>
									<!--  <a class="btn-slide animation animated-item-3" href="#">Read More</a>-->
								</div>
							</div>
							<div class="col-sm-6 hidden-xs animation animated-item-4">
								<div class="slider-img">
									<!--<img src="/images/slider/img1.png" class="img-responsive">-->
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="item" style="background-image: url(images/slider/bg2.jpg)">
					<div class="container">
						<div class="row slide-margin">
							<div class="col-sm-6">
								<div class="carousel-content">
									<h1 class="animation animated-item-1">Lorem ipsum dolor it amet consectetur adipisicing elit</h1>
									<h2 class="animation animated-item-2">Accusantium doloremque laudantium totam rem aperiam, eaque ipsa...</h2>
									<a class="btn-slide animation animated-item-3" href="#">Read More</a>
								</div>
							</div>
							<div class="col-sm-6 hidden-xs animation animated-item-4">
								<div class="slider-img">
									<img src="/images/slider/img2.png" class="img-responsive">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="item" style="background-image: url(images/slider/bg3.jpg)">
					<div class="container">
						<div class="row slide-margin">
							<div class="col-sm-6">
								<div class="carousel-content">
									<h1 class="animation animated-item-1">Lorem ipsum dolor sit amet consectetur adipisicing elit</h1>
									<h2 class="animation animated-item-2">Accusantium doloremque laudantium totam rem aperiam, eaque ipsa...</h2>
									<a class="btn-slide animation animated-item-3" href="#">Read More</a>
								</div>
							</div>
							<div class="col-sm-6 hidden-xs animation animated-item-4">
								<div class="slider-img">
									<img src="/images/slider/img3.png" class="img-responsive">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<!-- 		<a class="prev hidden-xs" href="#main-slider" data-slide="prev"> <i class="fa fa-chevron-left"></i> -->
<!-- 		</a> <a class="next hidden-xs" href="#main-slider" data-slide="next"><i class="fa fa-chevron-right"></i> -->
<!-- 		</a> -->
		<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"><i class="fa fa-chevron-left"></i></span>
			<span class="sr-only">Previous</span></a>
		<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
</section>
	
	<form action="/soulSearch">
			<div class="w3-container">
			  <div class="w3-dropdown-hover">
			    <button class="w3-btn w3-blue">select category</button>
			    <div class="w3-dropdown-content w3-border">
			      <a href="#">artist</a>
			      <a href="#">title</a>
			    </div>
			  </div>
			</div>
				<div class="input-group input-group-lg">
					<input type="text" class="form-control" placeholder="Search music" id="search" name="search" list="datas">
					
					<datalist id="datas">

					</datalist>

					<div class="input-group-btn">
						<button class="btn btn-default" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</form>

			<hr>
			<a onclick="soulplayer()" class="btn btn-primary btn-xl page-scroll">Play
				music</a>
		</div>
	</div>
	<section id="recent-works">
		<div class="container">
			<div class="center wow fadeInDown">
				<h2>Recent Works</h2>
				<p class="lead">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
					eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut
					enim ad minim veniam
				</p>
			</div>
			<div class="row">
				<c:forEach var="mp3" items="${mp3 }" begin="1" end="8" step="1">
					<div class="col-xs-12 col-sm-4 col-md-3">
						<div class="recent-work-wrap">
							<img src="/albumimage/${mp3.artist}${mp3.title}.png" class="img-responsive" style="height:300px" alt="">
								<div class="overlay">
									<div class="recent-work-inner">
										<h3>
											<a href="#">${mp3.title }</a>
										</h3>
										<p>${mp3.artist }</p>
										<a class="preview" onclick="window.open('/albuminfo?num=${mp3.num}','new','width=500px; height=450px')"><i class="fa fa-eye"></i> View</a>
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
	  <button type="button" class="btn btn-success btn-sm" id="superstar">슈퍼스타 K</button>
	  <button type="button" class="btn btn-info btn-sm" id="sketch">유희열의 스케치북</button>      
	</div>
	<div class="container">
		<div class="row" id="channel">
			<c:import url="/naver/channelSSK"></c:import>
			<c:import url="/naver/channelYHY"></c:import>
		</div>
	</div>
</section>
	
	
<section id="content">
		

		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-8 wow fadeInDown">
					<div class="tab-wrap">
						<div class="media">
							<div class="parrent pull-left">
								<ul class="nav nav-tabs nav-stacked">
									<li class=""><a href="#tab1" data-toggle="tab"
										class="analistic-01">Responsive Web Design</a></li>
									<li class="active"><a href="#tab2" data-toggle="tab"
										class="analistic-02">Premium Plugin Included</a></li>
									<li class=""><a href="#tab3" data-toggle="tab"
										class="tehnical">Predefine Layout</a></li>
									<li class=""><a href="#tab4" data-toggle="tab"
										class="tehnical">Our Philosopy</a></li>
									<li class=""><a href="#tab5" data-toggle="tab"
										class="tehnical">What We Do?</a></li>
								</ul>
							</div>
							<div class="parrent media-body">
								<div class="tab-content">
									<div class="tab-pane fade" id="tab1">
										<div class="media">
											<div class="pull-left">
												<img class="img-responsive" src="/images/tab2.png">
											</div>
											<div class="media-body">
												<h2>Adipisicing elit</h2>
												<p>There are many variations of passages of Lorem Ipsum
													available, but the majority have suffered alteration in
													some form, by injected humour, or randomised words which
													don't look even slightly believable. If you are going to
													use.</p>
											</div>
										</div>
									</div>
									<div class="tab-pane fade active in" id="tab2">
										<div class="media">
											<div class="pull-left">
												<img class="img-responsive" src="/images/tab1.png">
											</div>
											<div class="media-body">
												<h2>Adipisicing elit</h2>
												<p>There are many variations of passages of Lorem Ipsum
													available, but the majority have suffered alteration in
													some form, by injected humour, or randomised words which
													don't look even slightly believable. If you are going to
													use.</p>
											</div>
										</div>
									</div>
									<div class="tab-pane fade" id="tab3">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit, sed do eiusmod tempor incididunt ut labore et dolore
											magna aliqua. Ut enim ad minim veniam, quis nostrud
											exercitation ullamco laboris nisi ut aliquip ex ea commodo
											consequat. Duis aute irure dolor in reprehenderit.</p>
									</div>
									<div class="tab-pane fade" id="tab4">
										<p>There are many variations of passages of Lorem Ipsum
											available, but the majority have suffered alteration in some
											form, by injected humour, or randomised words which don't
											look even slightly believable. If you are going to use a
											passage of Lorem Ipsum, you need to be sure there isn't
											anything embarrassing hidden in the middle of text. All the
											Lorem Ipsum generators on the Internet tend to repeat
											predefined chunks as necessary, making this the first true
											generator on the Internet. It uses a dictionary of over 200
											Latin words</p>
									</div>
									<div class="tab-pane fade" id="tab5">
										<p>There are many variations of passages of Lorem Ipsum
											available, but the majority have suffered alteration in some
											form, by injected humour, or randomised words which don't
											look even slightly believable. If you are going to use a
											passage of Lorem Ipsum, you need to be sure there isn't
											anything embarrassing hidden in the middle of text. All the
											Lorem Ipsum generators on the Internet tend to repeat
											predefined chunks as necessary, making this the first true
											generator on the Internet. It uses a dictionary of over 200
											Latin words, combined with a handful of model sentence
											structures,</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-4 wow fadeInDown">
					<div class="testimonial">
						<h2>Testimonials</h2>
						<div class="media testimonial-inner">
							<div class="pull-left">
								<img class="img-responsive img-circle"
									src="/images/testimonials1.png">
							</div>
							<div class="media-body">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempor incididunt</p>
								<span><strong>-John Doe/</strong> Director of corlate.com</span>
							</div>
						</div>
						<div class="media testimonial-inner">
							<div class="pull-left">
								<img class="img-responsive img-circle"
									src="/images/testimonials1.png">
							</div>
							<div class="media-body">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempor incididunt</p>
								<span><strong>-John Doe/</strong> Director of corlate.com</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section id="partner">
		<div class="container">
			<div class="center wow fadeInDown">
				<h2>Our Partners</h2>
				<p class="lead">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
					eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut
					enim ad minim veniam
				</p>
			</div>
			<div class="partners">
				<ul>
					<li><a href="#"><img class="img-responsive wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="300ms"
							src="/images/partners/partner1.png"></a></li>
					<li><a href="#"><img class="img-responsive wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="600ms"
							src="/images/partners/partner2.png"></a></li>
					<li><a href="#"><img class="img-responsive wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="900ms"
							src="/images/partners/partner3.png"></a></li>
					<li><a href="#"><img class="img-responsive wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="1200ms"
							src="/images/partners/partner4.png"></a></li>
					<li><a href="#"><img class="img-responsive wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="1500ms"
							src="/images/partners/partner5.png"></a></li>
				</ul>
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
	<section id="bottom">
		<div class="container wow fadeInDown" data-wow-duration="1000ms"
			data-wow-delay="600ms">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="widget">
						<h3>Company</h3>
						<ul>
							<li><a href="#">About us</a></li>
							<li><a href="#">We are hiring</a></li>
							<li><a href="#">Meet the team</a></li>
							<li><a href="#">Copyright</a></li>
							<li><a href="#">Terms of use</a></li>
							<li><a href="#">Privacy policy</a></li>
							<li><a href="#">Contact us</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="widget">
						<h3>Support</h3>
						<ul>
							<li><a href="#">Faq</a></li>
							<li><a href="#">Blog</a></li>
							<li><a href="#">Forum</a></li>
							<li><a href="#">Documentation</a></li>
							<li><a href="#">Refund policy</a></li>
							<li><a href="#">Ticket system</a></li>
							<li><a href="#">Billing system</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="widget">
						<h3>Developers</h3>
						<ul>
							<li><a href="#">Web Development</a></li>
							<li><a href="#">SEO Marketing</a></li>
							<li><a href="#">Theme</a></li>
							<li><a href="#">Development</a></li>
							<li><a href="#">Email Marketing</a></li>
							<li><a href="#">Plugin Development</a></li>
							<li><a href="#">Article Writing</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="widget">
						<h3>Our Partners</h3>
						<ul>
							<li><a href="#">Adipisicing Elit</a></li>
							<li><a href="#">Eiusmod</a></li>
							<li><a href="#">Tempor</a></li>
							<li><a href="#">Veniam</a></li>
							<li><a href="#">Exercitation</a></li>
							<li><a href="#">Ullamco</a></li>
							<li><a href="#">Laboris</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

<script>	
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
	
	$("#superstar").click(function(){  
	    var url="/naver/channelSSK";
	    $.ajax({      
	        type:"get",  
	        url:url,      
	    }).done(function(resp){
	    	$("#channel").html(resp);
	    });  
	});  
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