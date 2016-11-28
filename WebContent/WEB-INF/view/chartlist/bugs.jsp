<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="bugs" items="${bugs }" varStatus="status">
	<tr>
		<td><input type="checkbox" name="chk"></td>
		<td>${status.count }</td>
		<td><img src="${bugs.album }" /></td>
		<td>${bugs.title }</td>
		<td>${bugs.artist }</td>
		<td><img src="/img/like.jpg" width="30" height="30" /></td>
		<td><img src="/img/mv.png" width="30" height="30" /></td>
	</tr>
</c:forEach>