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
<title>Member - Leggo Admin</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jes/styles.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
</head>
<body class="sb-nav-fixed">
		<!-- 상단 고정 메뉴 -->
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="admin.action"><img src="images/leggo.png" width="130px;"></a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>
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
        <!-- 좌측 메뉴 -->
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                        	<a class="nav-link" href="https://www.naver.com" target="_blank" style="font-size: 8pt;">
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
                            <div class="collapse show" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link" href="memberlist.action" style="background-color: #2E9AFE; color: black;">회원 목록</a>
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
                            <a class="nav-link" href="photo.action">
                            	<div class="sb-nav-link-icon"><img src="images/photo.png" height="23px;"></div>사진 관리
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
                     	<h1 class="mt-4">회원 관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Member</li>
                        </ol>
                     </div>
	                 <br>
	                 <div style="padding: 0px 0px 0px 94%; text-align: left;">
                  	 	<button type="button" style="background-color: #e9eae5; height: 26pt; border: 1px;">계정 등록</button>
                     </div>
                     <br>
                     <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                회원 데이터
                            </div>
                            <div class="card-body">
                            	<table id="datatablesSimple"">
                                    <thead>
                                    	<tr>
                                    		<th>번호</th>
                                            <th>아이디</th>
                                            <th>닉네임</th>
                                            <th>가입일</th>
                                            <th>회원상태</th>
                                            <th>계정등급</th>
                                            <th>관리</th>
                                    	</tr>
                                    </thead>
                                    <tbody>
                                    	<c:set var="num" value="${totCount+1 }"></c:set>
                                    	<c:forEach var="member" items="${list}">
                                    	<tr>
                                    		<td>${num-1 }</td>
                                    		<c:set var="num" value="${num-1 }"></c:set>
                                            <td>${member.mem_id!=null ? member.mem_id  : "-" }</td>
                                            <td>${member.mem_nnm!=null ? member.mem_nnm : "-" }</td>
                                            <td>${member.mem_join_dt!=null ? member.mem_join_dt : "-" }</td>
                                            <td>${member.acct_st }</td>
                                            <td>${member.admin_cd!=null ? "관리자" : "사용자"  }</td>
                                            <td>
                                            	<a href="memberprofile.action?mem_cd=${member.mem_cd }" onClick="window.open(this.href, '', 'width=540, height=660'); return false;">
                                            		<img src="images/menu.png" height="18px;">
                                            	</a>
                                            </td>
                                    	</tr>
                                    	</c:forEach>
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