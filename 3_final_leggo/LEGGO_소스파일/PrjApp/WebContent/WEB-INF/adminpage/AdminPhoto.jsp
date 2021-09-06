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
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Photo - Leggo Admin</title>
<style type="text/css">
	
	.state
	{
		border: 1px; 
		width: 70px; 
		height: 25px; 
		color: white;
	}
	
</style>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jes/styles.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="admin.action"><img src="images/leggo.png" width="130px;"></a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="AdminChange.jsp" onClick="window.open(this.href, '', 'width=400, height=310'); return false;">정보변경</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="logout.action">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                        	<a class="nav-link" href="" style="font-size: 8pt;">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                사용자 페이지 열기 >>
                            </a>
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="admin.action">
                                <div class="sb-nav-link-icon"><img src="images/board.png" height="21px;"></div>대시보드
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><img src="images/member.png" height="23px;"></div>
                                회원 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link" href="memberlist.action">회원 목록</a>
                                    <a class="nav-link" href="inquiry.action">일대일문의</a>
                                    <a class="nav-link" href="survey.action">설문조사 관리</a>
                                </nav>
                            </div>
                            <a class="nav-link" href="plan.action">
                            	<div class="sb-nav-link-icon"><img src="images/calender.png" height="21px;"></div>일정 관리
                            </a>
                            <a class="nav-link" href="trip.action">
                            	<div class="sb-nav-link-icon"><img src="images/paper.png" height="23px;"></div>여행기 관리
                            </a>
                            <a class="nav-link" href="photo.action" style="background-color: #2E9AFE; color: black;">
                            	<div class="sb-nav-link-icon"><img src="images/image.png" height="23px;"></div>사진 관리
                            </a>
                            <a class="nav-link" href="comment.action">
                            	<div class="sb-nav-link-icon"><img src="images/comment.png" height="23px;"></div>댓글 관리
                            </a>
                            <a class="nav-link" href="report.action">
                            	<div class="sb-nav-link-icon"><img src="images/report.png" height="23px;"></div>신고관리
                            </a>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><img src="images/chart.png" height="23px;"></div>
                                통계 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="connectStats.action">접속자 통계</a>
                                    <a class="nav-link" href="memberStats.action">회원 통계</a>
                                    <a class="nav-link" href="postStats.action">게시물 통계</a>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        관리자 페이지
                    </div>
                </nav>
            </div>
            
            <!-- 메인페이지 -->
            <div id="layoutSidenav_content">
                <main>
                     <div class="container-fluid px-4">
                     	<h1 class="mt-4">사진 관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Photo</li>
                        </ol>
                     </div>
                     <br>
                     <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                사진 게시판 데이터
                            </div>
                            <div class="card-body">
                            	<table id="datatablesSimple">
                                    <thead>
                                    	<tr>
                                    		<th>번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>조회수</th>
                                            <th>상태</th>
                                            <th>관리</th>
                                    	</tr>
                                    </thead>
                                    <tbody>
                                    	<c:if test="${empty list }">
                                    		<tr>
                                    			<td colspan="7" style="text-align: center; font-weight: bold;">사진 글 내역이 없습니다.</td>
                                    		</tr>
                                    	</c:if>
                                    	<c:if test="${not empty list }">
                                    		<c:set var="su" value="${count }"></c:set>
                                    		<c:forEach var="photo" items="${list }">
                                    			<tr>
		                                    		<td>${su }</td>
		                                    		<c:set var="su" value="${su-1 }"></c:set>
		                                            <td>${photo.mem_nnm }의 사진 게시물</td>
		                                            <td>${photo.mem_nnm }</td>
		                                            <td>${photo.pp_dt }</td>
		                                            <td>${photo.pp_hits }</td>
		                                            <td><button type="button" disabled="disabled" class="state"  
		                                            ${photo.rpt_st_cont==null ? "style=\"background-color: #198754;\"" : photo.rpt_st_cont=="반려" ? "style=\"background-color: #198754;\"" : "style=\"background-color: #dc3545;\"" }
		                                            >${photo.rpt_st_cont==null ? "정상" : photo.rpt_st_cont=="반려" ? "정상" : "블라인드" }</button></td>
		                                            <td>
		                                            	<a href="memberphoto.action?${photo.pp_cd }" onClick="window.open(this.href, '', 'width=550, height=400'); return false;">
		                                            		<img src="images/menu.png" height="18px;">
		                                            	</a>
		                                            </td>
                                    			</tr>
                                    		</c:forEach>
                                    	</c:if>
                                    	
                                    	<!-- <tr>
                                    		<td>11</td>
                                            <td>프로 제주살이의 사진 게시물</td>
                                            <td>프로 제주살이</td>
                                            <td>2021-06-28</td>
                                            <td>163</td>
                                            <td><button type="button" id="blind" style="border: 1px; width: 70px; height: 25px; background-color: #198754; color: white;">정상</button></td>
                                            <td>
                                            	<a href="AdminMemberPhoto.jsp" onClick="window.open(this.href, '', 'width=550, height=400'); return false;">
                                            		<img src="images/menu.png" height="18px;">
                                            	</a>
                                            </td>
                                    	</tr> -->
                                    	
                                    </tbody>
                                 </table>
                            </div>
                     </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="<%=cp%>/js/jes/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="<%=cp%>/js/jes/datatables-simple-demo.js"></script>
</body>
</html>