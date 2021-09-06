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
<title>AdminNotice - LEGGO Admin</title>
<link rel="stylesheet" href="<%=cp%>/css/jes/bootstrap.min.css">
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

<div class="container">
	
	<br>
	<br>
	
	<table style="width: 100%; text-align: center;">
		<tr>
			<th style="text-align: center; font-size: 16px; color: #050099;">알림</th>
		</tr>
		<tr>
			<td style="text-align: center;">${mesagge }이 완료되었습니다.</td>
		</tr>
		<tr>
			<td style="text-align: center;"><button type="button" id="closebtn" class="btn">확인</button></td>
		</tr>
	</table>
		
</div>

</body>
</html>