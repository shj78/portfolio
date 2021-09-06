<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminSurveyAdd.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/jes/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/jes/bootstrap.min.js"></script>
<script type="text/javascript">

		$(function()
		{

			$("#closebtn").click(function()
			{

				window.close();  	

			});
			
			$("#plusbtn1").click(function()
			{
				
				$("#answerInput1").append( '<br><input type="text" class="form-control">');
				
			});
			
			$("#plusbtn2").click(function()
			{
				
				$("#answerInput2").append( '<br><input type="text" class="form-control">');
				
			});
			
			$("#plusbtn3").click(function()
			{
				
				$("#answerInput3").append( '<br><input type="text" class="form-control">');
				
			});
			
		});

</script>
</head>
<body>

<div class="container">
	<div class="panel-group">
		<div class="panel-default">
		
			<div class="panel-heading" id="title">
				설문지 추가
			</div>
			
			<div class="panel-body">
				<form role="form" action="" method="post">
					
					<input type="hidden" id="mid" name="mid">
					
					<div class="form-group">
						<label for="question1">
							질문1 :
						</label>
						<input type="text" class="form-control">
					</div>
					
					<div class="form-group" id="answerInput1">
						<label for="answer1">
							답변 문항 :
						</label>
						<input type="text" class="form-control">	
					</div>
					
					<div style="text-align: center;">
						<button type="button" class="btn btn-success btn-sm" id="plusbtn1" style="background-color: #2E9AFE; border: 1px;">+</button>
					</div>
					
					<br>
					
					<div class="form-group">
						<label for="question2">
							질문2 :
						</label>
						<input type="text" class="form-control">
					</div>
					
					<div class="form-group" id="answerInput2">
						<label for="answer2">
							답변 문항 :
						</label>
						<input type="text" class="form-control">	
					</div>
					
					<div style="text-align: center;">
						<button type="button" class="btn btn-success btn-sm" id="plusbtn2" style="background-color: #2E9AFE; border: 1px;">+</button>
					</div>
					
					<br>
					
					<div class="form-group">
						<label for="question3">
							질문3 :
						</label>
						<input type="text" class="form-control">
					</div>
					
					<div class="form-group" id="answerInput3">
						<label for="answer3">
							답변 문항 :
						</label>
						<input type="text" class="form-control">	
					</div>
					
					<div style="text-align: center;">
						<button type="button" class="btn btn-success btn-sm" id="plusbtn3" style="background-color: #2E9AFE; border: 1px;">+</button>
					</div>
					
					<br>
					<button type="submit" class="btn btn-success btn-sm" style="background-color: #2E9AFE; border: 1px;">추가</button>
					<button type="button" class="btn btn-success btn-sm btnCancel" id="closebtn" style="background-color: #6c757d; border: 1px;">취소</button>
					
				</form>
			</div>
		</div><!-- close .panel-default -->
		
	</div>
</div>

</body>
</html>