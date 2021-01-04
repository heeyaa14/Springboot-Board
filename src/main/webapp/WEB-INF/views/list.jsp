<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="layout/header.jsp" %>

<style>
.h1Section {
	width: 100%;
	height: 70px;
	padding-top: 22px;
	margin-top: 40px;
	background-color: gray;
	text-align: center;
}

.h1Section > h1 {
	font-size: 20px;
	color: white;
	font-family: sans-serif;
	font-weight: 650;
}

.table {
	text-align: center;
}


</style>

<main class="container">
	<div class="h1Section">
	<h1>게시글 목록</h1>
	</div>
	
	<div class="content">
	<table class="table">
		<thead>
    		<tr>
    			<th>Id</th>
    			<th>Title</th>
		        <th>Date</th>
		        <th>ReadCount</th>
    		</tr>
    	</thead>
    	<tbody>
    	<c:forEach var="board" items='${boards.content}'>
	      <tr>
	      	<td>${board.id }</td>
	        <td><a href="/board/${board.id}">${board.title }</a></td>
	        <td>
	        	<!-- TimeStamp을 Date 형식으로 변환 -->
				<fmt:formatDate value="${board.createDate }" pattern="yyyy-MM-dd"/>
	        </td>
	        <td>${board.readCount }</td>
	      </tr>
	    </c:forEach>
	    </tbody>
    </table>	
	</div>
	
	<ul class="pagination" >
	    <c:choose>
	    	<c:when test="${boards.first}">
	    		<li class="page-item disabled">
					<a class="page-link" href="/list?page=${boards.pageable.pageNumber-1}">Previous</a>
				</li>
	    	</c:when>
	    	<c:otherwise>
	    		<li class="page-item">
					<a class="page-link" href="/list?page=${boards.pageable.pageNumber-1}">Previous</a>
				</li>
	    	</c:otherwise>
	    </c:choose>

		<c:choose>
	    	<c:when test="${boards.last}">
	    		<li class="page-item disabled">
					<a class="page-link" href="/list?page=${boards.pageable.pageNumber+1}">Next</a>
				</li>
	    	</c:when>
	    	<c:otherwise>
	    		<li class="page-item">
					<a class="page-link" href="/list?page=${boards.pageable.pageNumber+1}">Next</a>
				</li>
	    	</c:otherwise>
	    </c:choose>
	</ul>
</main>
<%@ include file="layout/footer.jsp" %>

