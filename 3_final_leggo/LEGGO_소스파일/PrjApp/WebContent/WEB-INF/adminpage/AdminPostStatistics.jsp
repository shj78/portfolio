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
<title>PostStatistics - Leggo Admin</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jes/styles.css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript">
	
		$(function()
		{
			var planSu = $("#plan").val();
			var tripSu = $("#trip").val();
			var photoSu = $("#photo").val(); 
			
			var mychart = $("#bar-chart");
			var myBarChart = new Chart(mychart, {
			    type: 'bar',
			    data: {
			        labels: ['일정 글', '여행기 글', '사진 글'],
			        datasets: [{
			            label: '# of Post',
			            data: [planSu, tripSu, photoSu],
			            backgroundColor: [
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)'
			            ],
			            borderColor: [
			                'rgba(54, 162, 235, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)'
			            ],
			            borderWidth: 1
			        }]
			    },
			    options: {
			    	 legend: {
				         	display: false
				         },
			        scales: {
			        	yAxes: [{
							ticks: {
								beginAtZero: true
							}
						}]
			        }
			    }
			});
			
			var postDaySu1 = $("#postDayList1").val();	//-- 6일전
			var postDaySu2 = $("#postDayList2").val();	//-- 5일전
			var postDaySu3 = $("#postDayList3").val();	//-- 4일전
			var postDaySu4 = $("#postDayList4").val();	//-- 3일전
			var postDaySu5 = $("#postDayList5").val();	//-- 2일전
			var postDaySu6 = $("#postDayList6").val();	//-- 1일전
			var postDaySu7 = $("#postDayList7").val();	//-- 오늘
			
			var mychart2 = $("#line-chart");
			var myLineChart = new Chart(mychart2, {
			    type: 'line',
			    data: {
			        labels: ['6일 전', '5일 전', '4일 전', '3일 전', '2일 전', '1일 전', '오늘'],
			        datasets: [{
			            label: 'of Post su',
			            data: [
			            	postDaySu1, postDaySu2, postDaySu3, postDaySu4, postDaySu5, postDaySu6, postDaySu7
			            ],
			            borderColor: "rgba(255, 201, 14, 1)",
			            backgroundColor: "rgba(255, 201, 14, 0.4)",
			            fill: true,
			            lineTension: 0
			        }]
			    },
			    options: {
			    	 legend: {
				         	display: false
				         },
			        scales: {
			        	yAxes: [{
							ticks: {
								beginAtZero: true
							}
						}]
			        }
			    }
			});
		});
	
</script>
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
                            <div class="collapse show" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="connectStats.action">접속자 통계</a>
                                    <a class="nav-link" href="memberStats.action">회원 통계</a>
                                    <a class="nav-link" href="postStats.action" style="background-color: #2E9AFE; color: black;">게시물 통계</a>
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
                     	<h1 class="mt-4">게시물 통계</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Post Statistics</li>
                        </ol>
                     </div>
                 
                     <br>
                   	 <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                         당일 게시물 통계
                                         <input type="hidden" value="${postCount.plan }" id="plan">
                                         <input type="hidden" value="${postCount.trip }" id="trip">
                                         <input type="hidden" value="${postCount.photo }" id="photo">
                                    </div>
                                    <div class="card-body"><canvas id="bar-chart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        일별 게시물 통계
                                        <c:set var="i" value="1"></c:set>
                                        <c:forEach var="postSu" items="${postDayCount }">
	                                        <input type="hidden" value="${postSu.count }" id="postDayList${i }">
	                                        <c:set var="i" value="${i+1 }"></c:set>
                                        </c:forEach>
                                    </div>
                                    <div class="card-body"><canvas id="line-chart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                     </div>
                     <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                게시물 수 데이터
                            </div>
                            <div class="card-body">
                            	<table id="datatablesSimple" style="text-align: center;">
                                    <thead>
                                    	<tr>
                                    		<th rowspan="2" style="text-align: center; vertical-align: middle;">번호</th>
                                            <th rowspan="2" style="text-align: center; vertical-align: middle;">신규게시물 수</th>
                                            <th rowspan="2" style="text-align: center; vertical-align: middle;">작성일</th>
                                            <th colspan="3" style="text-align: center; vertical-align: middle;">게시판</th>
                                    	</tr>
                                    	<tr>
                                    		<th style="text-align: center;">일정</th>
                                    		<th style="text-align: center;">여행기</th>
                                    		<th style="text-align: center;">사진글</th>
                                    	</tr>
                                    </thead>
                                    <tbody>
                                    	<c:set var="i" value="14"></c:set>
                                    	<c:forEach var="post" items="${totCount }">
                                    	<tr>
                                    		<td>${i }</td>
                                    		<c:set var="i" value="${i-1 }"></c:set>
                                            <td>${post.plan + post.trip + post.photo }</td>
                                            <td>${post.dt }</td>
                                            <td>${post.plan }</td>
                                            <td>${post.trip }</td>
                                            <td>${post.photo }</td>
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