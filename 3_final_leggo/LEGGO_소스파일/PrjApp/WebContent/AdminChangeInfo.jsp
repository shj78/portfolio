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
<title>Insert title here</title>
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
			
		});

</script>
</head>
<body>
<div style="text-align: center; font-weight: bold;">
	<h3>정보 변경</h3>
</div>
<br><br>

<div class="container">
	
	<div class="panel-group">
		<div class="panel-default">
		
			<div class="panel-heading" id="title" style="font-weight: bold;">
				정보 변경
			</div>
			
			<div class="panel-body">
				<form role="form" action="" method="post">
					
					<input type="hidden" id="mid" name="mid">
					
					<div class="form-group">
						<label for="name">
							닉네임 :
						</label>
						<input type="text" class="form-control" id="name" name="name" placeholder="관리자1">
					</div>
					
					<div class="form-group">
						<label for="password">
							비밀번호 :
						</label>
						<input type="password" class="form-control" id="password" name="password">
					</div>
					
					<div class="form-group">
						<label for="passwordCheck">
							비밀번호 확인 :
						</label>
						<input type="password" class="form-control" id="passwordCheck" name="passwordCheck">
					</div>
					
					<div style="text-align: center;">
					<button type="submit" class="btn btn-success btn-sm" style="background-color: #2E9AFE; border: 1px;">확인</button>
					<button type="button" class="btn btn-success btn-sm btnCancel" id="closebtn" style="background-color: #6c757d; border: 1px;">취소</button>
					</div>
					
				</form>
			</div>
		</div><!-- close .panel-default -->
	</div>
</div>

</body>
</html>