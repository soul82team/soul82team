<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <section class="no-padding" id="musicchart">
        <div class="container-fluid">
            <div class="row no-gutter popup-gallery">
            <c:forEach var="bugs" items="${bugs }" varStatus="status">
                <div class="col-lg-4 col-sm-6">
                    <a href="${bugs.album}" class="portfolio-box">
                        <img src="${bugs.album}" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                   ${bugs.title }
                                </div>
                                <div class="project-name">
                                    ${bugs.artist }
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>

    