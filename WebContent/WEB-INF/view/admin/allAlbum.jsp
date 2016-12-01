<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section id="recent-works">
	<div class="container">
		<div class="row">
			<c:forEach var="allAlbum" items="${allAlbum }" varStatus="status">
				<div class="col-xs-12 col-sm-4 col-md-3">
					<div class="recent-work-wrap" style="padding-top: 10px">
						<img src="/albumimage/${allAlbum.SAVEARTIST}${allAlbum.SAVETITLE}.png"
							style="width: 250px; height: 250px">
						<p>
							<b>${allAlbum.TITLE }</b><br/>${allAlbum.ARTIST }</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>

<div align="center">
	<ul class="pagination pagination-sm">
		<c:forEach var="i" begin="1" end="${last }">
			<li><a href="/admin/allalbum?page=${i }">${i }</a></li>
		</c:forEach>
	</ul>
</div>





