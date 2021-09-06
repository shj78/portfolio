<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberProfile - Leggo Admin</title>
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
body{
	margin-top: 100px;
	line-height: 1.6
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

#grade
{
	border: 1px; 
	width: 70px; 
	height: 25px;
	color: white;
}

#state
{
	border: 1px; 
	width: 70px; 
	height: 25px;
	color: white;
}

.table th, .table td
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

			$("#grade").click(function()
			{
				
				if( $(this).html()=="관리자" )
				{
					$(this).html("사용자");
					$(this).css("background-color", "#2E9AFE");
					$("#rank").val("0");
					
				}
				else
				{
					$(this).html("관리자");
					$(this).css("background-color", "#dc3545");
					$("#rank").val("1");
				}
				
			});
			
			$("#state").click(function()
			{
				
				if( $(this).html()=="정상" )
				{
					$(this).html("차단");
					$(this).css("background-color", "#dc3545" );
					$("#memState").val("0");
				}
				else if( $(this).html()=="차단" )
				{
					$(this).html("정상");
					$(this).css("background-color", "#198754");
					$("#memState").val("1");
				}
				
			});
			
			$('ul.tabs li').click(function(){
				var tab_id = $(this).attr('data-tab');

				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#"+tab_id).addClass('current');
			});
			
			$("#updateBtn").click(function()
			{
				$("#formId").attr("action", "memberprofileUpdate.action");
				
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

<div>
<form action="" method="post" id="formId">
<br>
<div>
	<p style="text-align: center;"><img src="${memberProfile.mem_img==null ? 'https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg' : memberProfile.mem_img}" style="width: 170px; border-radius: 50%;"></p>
</div>

<div>
	<p style="text-align: center;">${memberProfile.mem_id }</p>
	<p style="text-align: center;">${memberProfile.mem_nnm==null ? "탈퇴회원" :  memberProfile.mem_nnm}</p>
	<p style="text-align: center;">
		<button type="button" id="grade" ${memberProfile.admin_cd!=null ? "style=\"background-color: #dc3545;\"" : "style=\"background-color: #2E9AFE;\"" } ${memberProfile.acct_st== "탈퇴" ? "disabled=\"disabled\"" : ""}>${memberProfile.admin_cd!=null ? "관리자" : "사용자" }</button>
		<button type="button" id="state" ${memberProfile.acct_st== "정상" ? "style=\"background-color: #198754;\"" : memberProfile.acct_st== "탈퇴"? "style=\"background-color: #6c757d;\"" : "style=\"background-color: #dc3545;\"" } ${memberProfile.acct_st== "탈퇴" ? "disabled=\"disabled\"" : ""}>${memberProfile.acct_st }</button>
	</p>
	<hr>
	<input type="hidden" id="rank" name="rank">
	<input type="hidden" id="memState" name="memState">
	<input type="hidden" id="mem_cd" name="mem_cd" value="${memberProfile.mem_cd }">
</div>

<div class="container">

	<ul class="tabs">
		<li class="tab-link current" data-tab="tab-1">회원 정보</li>
		<li class="tab-link" data-tab="tab-2">회원 작성 글</li>
		<li class="tab-link" data-tab="tab-3">신고 내역</li>
	</ul>

	<div id="tab-1" class="tab-content current">
		<div style="font-weight: bold;">활동 기록</div>
		가입방식 : ${memberProfile.join_mtd==null ? "-" : memberProfile.join_mtd }<br>
		가입일 : ${memberProfile.mem_join_dt==null ? "-" : memberProfile.mem_join_dt}<br>
		${memberProfile.qt_mem_quit_dt==null? "" : "탈퇴일 : " }
		${memberProfile.qt_mem_quit_dt } 
	</div>
	<div id="tab-2" class="tab-content">
		<table style="width: 100%;" class="table member-con">
			<tr>
				<th>카테고리</th>
				<th style="text-align: left;">제목</th>
				<th>작성일</th>
				<th>공개</th>
				<th>상태</th>
				<th>관리</th>
			</tr>
			<c:if test="${empty postList }">
                 <tr>
                 	<td colspan="6" style="text-align: center; font-weight: bold;">작성 글 내역이 없습니다.</td>
                 </tr>
            </c:if>
			<c:if test="${not empty postList }">
			<c:forEach var="post" items="${postList }">
				<tr>
					<td>${fn:substring(post.post_cd,0,2)=="PL" ? "[일정]" : fn:substring(post.post_cd,0,2)=="TR" ? "[여행기]" : "[사진]" }</td>
					<td style="text-align: left;">${post.tt }</td>
					<td>${post.dt }</td>
					<td>${post.open_st }</td>
					<td><button type="button" disabled="disabled" class="state" ${post.blind=="정상" ? "style=\"background-color: #198754;\"" : "style=\"background-color: #dc3545;\"" }>${post.blind }</button></td>
					<c:set var="code" value="${fn:substring(post.post_cd,0,2) }"></c:set>
					<td>
						<c:if test="${code==\"PL\" }">
							<a href="memberplan.action?pl_cd=${post.post_cd }" onClick="window.open(this.href, '', 'width=400, height=450'); return false;"><img src="images/menu.png" height="18px;"></a>
						</c:if>
						<c:if test="${code==\"TR\" }">
							<a href="membertrip.action?tr_cd=${post.post_cd }" onClick="window.open(this.href, '', 'width=400, height=450'); return false;"><img src="images/menu.png" height="18px;"></a>
						</c:if>
						<c:if test="${code==\"PP\" }">
							<a href="memberphoto.action??tr_cd=${post.post_cd }" onClick="window.open(this.href, '', 'width=400, height=450'); return false;"><img src="images/menu.png" height="18px;"></a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
			</c:if>
		</table>
		
	</div>
	<div id="tab-3" class="tab-content">
		<table style="width: 220px; text-align: center;" class="table">
			<tr>
				<th>신고</th>
				<th>오신고</th>
				<th>총 합</th>
			</tr>
			<tr>
				<td>${rptTotCount-oRptCount }</td>
				<td>${oRptCount }</td>
				<td>${rptTotCount }</td>
			</tr>
		</table>
		<br>
		<table style="width: 100%;" class="table member-rep">
			<tr>
				<th>카테고리</th>
				<th style="text-align: left;">제목</th>
				<th>신고일</th>
				<th>상태</th>
			</tr>
			
			<c:if test="${empty memRptList }">
	            <tr>
	                <td colspan="6" style="text-align: center; font-weight: bold;">신고 내역이 없습니다.</td>
	            </tr>
            </c:if>
            
            <c:if test="${not empty memRptList }">
           		<c:set var="tot" value="${rptTotCount }"></c:set>
               	<c:forEach var="report" items="${memRptList }">
                   	<tr onClick="window.open('AdminMemberReport.jsp', '', 'width=570, height=260'); return false;">
                       	<td>${tot }</td>
                           <c:set var="tot" value="${tot-1 }"></c:set>
                           <td>${fn:substring(report.post_cd,0,2)=="PL" ? "[일정]" : fn:substring(report.post_cd,0,2)=="TR" ? "[여행기]" : "[사진]" }</td>
                           <td>${report.tt }</td>
                           <td>${report.dt }</td>
                           <td><button type="button" disabled="disabled" class="state"  ${report.st=="완료" ? "style=\"background-color: #2E9AFE;\"" : report.st=="반려" ? "style=\"background-color: #dc3545;\"" : "style=\"background-color: #6c757d;\"" }>${report.st }</button></td>
                       </tr>
                </c:forEach>
            </c:if>
		</table>
	</div>
	
	<br>
	
	<div style="width: 100%;">
		<div style="font-weight: bold;">비고</div>
		<textarea style="width:100%; height:100px;"></textarea>
	</div>
	
	<br>
	<div>
		<p style="text-align: center;">
		<c:if test="${memberProfile.acct_st eq '탈퇴' }">
			<button type="button"  class="btn" id="closebtn" style="border: 1px; width: 70px; height: 25px; background-color: #6c757d; color: white;">닫기</button>
		</c:if>
		<c:if test="${memberProfile.acct_st ne '탈퇴' }">
			<button type="button" class="btn" id="updateBtn" style="border: 1px; width: 70px; height: 25px; background-color: #dc3545; color: white;" >수정</button>
			<button type="button"  class="btn" id="closebtn" style="border: 1px; width: 70px; height: 25px; background-color: #6c757d; color: white;">취소</button>
		</c:if>
		</p>
	</div>
</div>
</form>
</div>


</body>
</html>