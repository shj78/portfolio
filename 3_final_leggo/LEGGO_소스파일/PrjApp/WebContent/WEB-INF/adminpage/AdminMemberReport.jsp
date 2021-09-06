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
<title>AdminMemberReport - LEGGO Admin</title>
<style type="text/css">

.state
{
	border: 1px; 
	width: 70px; 
	height: 25px; 
	color: white;
}

</style>
<link rel="stylesheet" href="<%=cp%>/css/jes/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jes/bootstrap.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#closebtn").click(function()
		{
			window.close();  	
		});
		
		$("#processbtn").click(function()
		{
			window.open("processreport.action?rpt_cd=${rptList.rpt_cd}", "", "width=520, height=400");
			window.close();  
		});
	});
	
</script>
</head>
<body>

<div class="container">
	<div class="panel-group">
		<div class="panel-default">
		
			<div class="panel-heading" id="title">
				신고 상세
			</div>

			<br>
			<div>
				<table style="width: 100%; text-align: center;" class="table">
					<tr>
						<th style="text-align: left;">제목</th>
						<th style="text-align: center;">작성자</th>
						<th style="text-align: center;">작성일</th>
						<th style="text-align: center;">공개여부</th>
						<th style="text-align: center;">블라인드</th>
					</tr>
					<tr onClick="window.open('https://www.naver.com'); return false;">
						<td style="text-align: left;">${postList.tt }</td>
						<td>${postList.tt }</td>
						<td>${postList.dt }</td>
						<td>${postList.open_st }</td>
						<td><button type="button" class="state" ${postList.blind=="정상" ? "style=\"background-color: #198754;\"" : "style=\"background-color: #dc3545;\"" } disabled="disabled">${postList.blind }</button></td>
					</tr>
				</table>
				
				<hr>
			</div>
			
			<div style="background-color: #e6e6e4; width: 100%">
				<table style="width: 100%" class="table">
					<tr>
						<th style="text-align: center;">신고자</th>
						<th style="text-align: center;">신고사유</th>
						<th style="text-align: center;">신고일</th>
						<th style="text-align: center;">처리상태</th>
					</tr>
					<tr>
						<th style="text-align: center;">${rptList.mem_nnm }</th>
						<th style="text-align: center;">${rptList.rsn }</th>
						<th style="text-align: center;">${rptList.dtt }</th>
						<th style="text-align: center;"><button type="button" class="state" style="background-color: #dc3545;" disabled="disabled">${rptList.st }</button></th>
					</tr>
				</table>
			</div>
			<br>
			<div>
				<p style="text-align: center;">
				<button type="button" class="btn" id="processbtn" style="border: 1px; width: 70px; height: 25px; background-color: #2E9AFE; color: white;" >처리</button>
				<button type="button"  class="btn" id="closebtn" style="border: 1px; width: 70px; height: 25px; background-color: #6c757d; color: white;">닫기</button>
				</p>
			</div>
		
		</div>
	</div>
</div>

</body>
</html>