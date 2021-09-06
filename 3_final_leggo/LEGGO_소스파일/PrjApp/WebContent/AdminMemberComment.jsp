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
<title>AdminMemberPhoto.jsp</title>
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

</style>
<link rel="stylesheet" href="<%=cp %>/css/jes/bootstrap.css">
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
		<div class="panel-group">
		<div class="panel-default">
		
			<div class="panel-heading" id="title">
				댓글 상세
			</div>
			
		<br>
		<table class="table">
			<tr>
				<th style="text-align: left;">내용</th>
				<th style="text-align: center;">작성자</th>
				<th style="text-align: center;">작성일</th>
				<th style="text-align: center;">블라인드</th>
			</tr>
			<tr>
				<td style="text-align: left;">너무 예뻐요</td>
				<td style="text-align: center;">프로 제주살이</td>
				<td style="text-align: center;">2021-04-28</td>
				<td style="text-align: center;"><button type="button" id="blind" style="border: 1px; width: 70px; height: 25px; background-color: #dc3545; color: white;" disabled="disabled">블라인드</button></td>
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
				<tr>
					<td>1</td>
					<td><a href="AdminMemberPlan.jsp" style="color: black; text-decoration: none;" onClick="window.open(this.href, '', 'width=400, height=450'); return false;">2021-06-30</a></td>
					<td><button type="button" id="blind" style="border: 1px; width: 70px; height: 25px; background-color: #6c757d; color: white;" disabled="disabled">미처리</button></td>
					<td>-</td>
				</tr>
				<tr>
					<td>2</td>
					<td>2021-05-22</td>
					<td><button type="button" id="blind" style="border: 1px; width: 70px; height: 25px; background-color: #dc3545; color: white;" disabled="disabled">반려</button></td>
					<td>관리자2</td>
				</tr>
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