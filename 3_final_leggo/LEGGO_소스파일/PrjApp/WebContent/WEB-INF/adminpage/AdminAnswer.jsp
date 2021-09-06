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
<title>AdminAnswer - Leggo Admin</title>
<style type="text/css">

	.state
	{
		color: white; 
		width: 50pt; 
		border: 1px;
	}
	
</style>
<link rel="stylesheet" href="<%=cp %>/css/jes/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/jes/bootstrap.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#subBtn").click(function()
		{
			if ( $("#subBtn").val() == "등록")
			{
				$("#formId").attr("action", "inquiryanwerInsert.action");
			}
			else if ( $("#subBtn").val() == "수정")
			{
				$("#formId").attr("action", "inquiryanwerUpdate.action");
			}
			
			$("#formId").submit();

		});
		
		$("#closebtn").click(function()
		{

			window.close();  	

		});
	});
	
</script>
</head>
<body>

<div class="container">
	
	<div class="panel-group">
		<div class="panel-default">
		
			<div class="panel-heading" id="title" style="font-weight: bold;">
				일대일문의
			</div>
			
			<div class="panel-body">
				<form role="form" action="" method="post" id="formId">
					
					<input type="hidden" id="mid" name="mid">
					
					<table style="width: 100%; text-align: center;" class="table">
						<tr>
							<th style="text-align: center;">카테고리</th>
							<th style="text-align: center;">제목</th>
							<th style="text-align: center;">작성자</th>
							<th style="text-align: center;">작성일</th>
							<th style="text-align: center;">상태</th>
						</tr>
						<tr>
							<td>[${question.ctg_nm}]</td>
							<td>${question.mem_qst_tt }</td>
							<td>${question.mem_nnm }</td>
							<td>${question.mem_qst_dt }</td>
							<td><button type="button" disabled="disabled" ${inquiry.state=="미답변" ? "style=\"background-color: #198754;\"" : "style=\"background-color: #2E9AFE;\"" }>${question.state }</button></td>
						</tr>
					</table>
					<br><br>
						<div style="font-weight: bold;">문의내용</div>
						<table style="width: 100%;" class="table">
							<tr>
								<td>		
									${question.mem_qst_cont }
								</td>
							</tr>
						</table>
					<br><br>
					<table class="table">
						<tr>
							<td>${answer.mem_nnm }</td>
							<td>${answer.admin_ans_dt }</td>
						</tr>
					</table>
					<div style="font-weight: bold;">답변</div>
					<textarea style="width: 100%" id="admin_ans_cont" name="admin_ans_cont">${answer.admin_ans_cont }</textarea>
					
					<div style="text-align: center;">
					<button type="submit" id="subBtn" class="btn btn-success btn-sm" style="background-color: #2E9AFE; border: 1px;" value="${answer.admin_ans_cd==null ? '등록' : '수정' }">${answer.admin_ans_cd==null ? "등록" : "수정" }</button>
					<button type="button" class="btn btn-success btn-sm btnCancel" id="closebtn" style="background-color: #6c757d; border: 1px;">취소</button>
					</div>
					
					<input type="hidden" id="mem_qst_cd" name="mem_qst_cd" value="${question.mem_qst_cd }">
					<input type="hidden" id="admin_ans_cd" name="admin_ans_cd" value="${answer.admin_ans_cd }">
				</form>
			</div>
		</div><!-- close .panel-default -->
	</div>
</div>

</body>
</html>