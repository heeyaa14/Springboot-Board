<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="layout/header.jsp" %>
<style>
.h1Section {
	width: 100%;
	height: 70px;
	padding-top: 22px;
	background-color: gray;
	text-align: center;
}

.h1Section > h1 {
	font-size: 20px;
	color: white;
	font-family: sans-serif;
	font-weight: 650;
}

.content {
	width: 65%;
	height: 100%;
	margin: 0 auto;
	text-align: center;
}

#btnSave {
	width: 130px;
	height: 40px;
	background-color: lightgray;
	color: black;
	border-radius: 8px;
	border: 0px;
	font-size: 14px;
	font-weight: 600;
}
</style>
<main>
	<!-- 커멜표기법 사용 -->
	<div class="h1Section">
		<h1>새로운 글등록</h1>
	</div><br /><br />
	<form>
		<div class="content">
			<input type="text" class="form-control" placeholder="제목을 입력하세요." id="title">
			<br />
	
			<!-- content summernote 적용부분 -->
			<textarea id="content" name="content"></textarea><br />
			<script type="text/javascript">
				$(document).ready(function() {
	
					$('#content').summernote({
					height:350 , 
					minHeight: null,            
				    maxHeight: null,            
				    focus: true                					  
				  });
				});
			</script>
			<button type="button" onclick="save()" id="btnSave">글쓰기 완료</button>
			<script type="text/javascript">
			function save() {
				let title = document.querySelector("#title").value;
				let content = document.querySelector("#content").value;
				
				console.log(title);
				console.log(content);
				
				let board = {
					title: title,
					content: content
				};
				
				fetch("/save", {
					method: "post",
					headers: {
						"Content-type" : "application/json; charset=utf-8"
					},
					body: JSON.stringify(board)
				}).then(res=> res.text())
				.then(res => {
					if(res=="ok") {
						alert("등록 성공!");
						location.href="/";
					} else {
						alert("등록 실패");
					}
				});
			}
			
			</script>
			
	 	</div>
	 </form>
</main>
		

<%@ include file="layout/footer.jsp" %>

