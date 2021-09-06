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
<title>AdminMemberPlan - LEGGO Admin</title>
<link rel="stylesheet" href="<%=cp %>/css/jes/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/jes/bootstrap.min.js"></script>
<style type="text/css">

div.left 
{
    width: 35%;
    height: 120px;
    float: left;
    box-sizing: border-box;
    
    /* background: #ff0; */
}
div.right 
{
    width: 65%;
    height: 120px;
    float: right;
    box-sizing: border-box;
    
    /* background: #0ff; */
}
.container{
	width: 95%;
	margin: 0 auto;
}



ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current{
	background: #ededed;
	color: #222;
}

.tab-content{
	display: none;
	background: #ededed;
	padding: 15px;
}

.tab-content.current{
	display: inherit;
}

.btn:hover
{
	font-weight: bold;
}

.member-con
{
	text-align: center;
}

.state
{
	border: 1px; 
	width: 70px; 
	height: 25px; 
	color: white;
}

</style>
<link rel="stylesheet" href="<%=cp%>/css/jes/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jes/bootstrap.min.js"></script>
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
		<div class="panel-group">
		<div class="panel-default">
		
			<div class="panel-heading" id="title">
				일정 상세
			</div>
			
		<br>
		<table class="table">
			<tr>
				<th style="text-align: left;">제목</th>
				<th style="text-align: center;">작성자</th>
				<th style="text-align: center;">작성일</th>
				<th style="text-align: center;">공개여부</th>
				<th style="text-align: center;">블라인드</th>
			</tr>
			<tr>
				<td style="text-align: left;">${post.pl_tt }</td>
				<td style="text-align: center;">${post.mem_nnm }</td>
				<td style="text-align: center;">${post.pl_dt }</td>
				<td style="text-align: center;">${post.open_st }</td>
				<td style="text-align: center;"><button type="button" class="state" ${post.blind=="정상" ? "style=\"background-color: #198754;\"" : "style=\"background-color: #dc3545;\"" } disabled="disabled">${post.blind }</button></td>
			</tr>
		</table>
		
		<hr>
		
		
	</div>
	<div class="container">
		<div style="font-weight: bold;">신고 내역</div>
		
		<div id="tab-1" class="tab-content current">
			<table style="width: 100%; text-align: center;">
				<tr>
					<th style="text-align: center;">번호</th>
					<th style="text-align: center;">신고일</th>
					<th style="text-align: center;">상태</th>
					<th style="text-align: center;">처리자</th>
				</tr>
				<c:if test="${rptCount eq 0 }">
					<tr>
						<td colspan="4" style="text-align: center; font-weight: bold;">신고 내역이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${rptCount ne 0 }">
				<c:set var="i" value="${rptCount }"></c:set>
				<c:forEach var="rpt" items="rptList">
				<tr onClick="window.open('memberreport.action?pl_rpt_cd=${rpt.pl_rpt_cd}', '', 'width=570, height=260'); return false;">
					<td>${i }</td>
					<c:set var="i" value="${i-1 }"></c:set>
					<td>${rpt.dt }</td>
					<td><button type="button" class="state" disabled="disabled" ${rpt.rpt_st_cont=="완료" ? "style=\"background-color: #2E9AFE;\"" : rpt.rpt_st_cont=="반려" ? "style=\"background-color: #dc3545;\"" : "style=\"background-color: #6c757d;\"" }>${rpt.rpt_st_cont }</button></td>
					<td>${rpt.mem_nnm==null ? "-" : "rpt.mem_nnm" }</td>
				</tr>
				</c:forEach>
				</c:if>
			</table>
		</div>
		
		
		
		<br>
		<div>
			<p style="text-align: center;">
			<button type="button"  class="btn" id="closebtn" style="border: 1px; width: 70px; height: 25px; background-color: #2E9AFE; color: white;">닫기</button>
			</p>
		</div>
	</div>
	</div>
</div>
</body>
</html>