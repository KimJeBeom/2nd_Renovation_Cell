<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			fn_addFile();
		})
		function fn_addFile(){
			var fileIndex = 1;
			//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
			$(".fileAdd_btn").on("click", function(){
/* 				$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div><br>"); */
				$("#fileIndex").append("<td><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></td>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
		}
	</script>
	<body>
	
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			
			<section id="container">
				<form name="writeForm" method="post" action="upload" enctype="multipart/form-data">
						<label>code_nm:</label> <input type="text" name="code_nm"> <br>
						<label>pbns_id:</label> <input type="text" name="pbns_id"> <br>
						<br>
					<table>
						<tr>
							<td>
								<button class="fileAdd_btn" type="button">파일추가</button>
							</td>
						</tr>
						<tr id="fileIndex">
						</tr>
					</table>
						<br> <input type="submit" value="upload">
				</form>
				
			</section>
			<hr />
		</div>
	</body>
</html>