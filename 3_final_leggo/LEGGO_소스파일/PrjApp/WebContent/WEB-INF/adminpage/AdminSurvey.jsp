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
<title>Survey - Leggo Admin</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jes/styles.css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript">
	
	$(function()
	{
		$(".content").click(function()
		{
			if( $("#QnA").css('display') == 'none')
			{
				$("#QnA").show();
			}
			else
			{
				 $("#QnA").hide();
			}

		});
		
		var totSu = ${totCount};
		var ansSu = ${jq_count}
		
		var inwonchart = $("#inwon-chart");
		var myChart = new Chart(inwonchart,	{
		    type: 'doughnut',
		    data: {
		        labels: ['답변', '미답변'],
		        datasets: [{
		            label: '# of Votes',
		            data: [ansSu, totSu],
		            backgroundColor: [
		                'rgba(255, 99, 132, 0.2)',
		                'rgba(204, 204, 204, 0.2)'
		            ],
		            borderColor: [
		                'rgba(255, 99, 132, 1)',
		                'rgba(204, 204, 204, 1)'
		            ],
		            borderWidth: 1
		        }]
		    },
		     options: {
		        scales: {
		            y: {
		                beginAtZero: true
		            }
		        }
		    } 
		});
		
		var a1list = new Array();
		<c:forEach var="a1" items="${jqo_list }">
			<c:if test="${a1.join_qst_num eq '1'}">
			a1list.push("${a1.jqo_cont}");
			</c:if>
		</c:forEach>
		
		var a1Count = new Array();
		<c:forEach var="as1" items="${answer1 }">
			a1Count.push("${as1.count}");
		</c:forEach>
		
		var q1chart = $("#q1-chart");
		var myQ1Chart = new Chart(q1chart, {
		    type: 'doughnut',
		    data: {
		        labels: a1list,
		        datasets: [{
		            label: '# of Votes',
		            data: a1Count,
		            backgroundColor: [
		                'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		                'rgba(255, 159, 64, 0.2)'
		            ],
		            borderColor: [
		                'rgba(255, 99, 132, 1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)'
		            ],
		            borderWidth: 1
		        }]
		    },
		     options: {
		        scales: {
		            y: {
		                beginAtZero: true
		            }
		        }
		    } 
		});
		
		var a2list = new Array();
		<c:forEach var="a2" items="${jqo_list }">
			<c:if test="${a2.join_qst_num eq '2'}">
			a2list.push("${a2.jqo_cont}");
			</c:if>
		</c:forEach>
		
		var a2Count = new Array();
		<c:forEach var="as2" items="${answer2 }">
			a2Count.push("${as2.count}");
		</c:forEach>
		
		var q2chart = $("#q2-chart");
		var myQ2Chart = new Chart(q2chart, {
		    type: 'doughnut',
		    data: {
		        labels: a2list,
		        datasets: [{
		            label: '# of Votes',
		            data: a2Count,
		            backgroundColor: [
		                'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		                'rgba(255, 159, 64, 0.2)'
		            ],
		            borderColor: [
		                'rgba(255, 99, 132, 1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)'
		            ],
		            borderWidth: 1
		        }]
		    },
		     options: {
		        scales: {
		            y: {
		                beginAtZero: true
		            }
		        }
		    } 
		});
		
		var a3list = new Array();
		<c:forEach var="a3" items="${jqo_list }">
			<c:if test="${a3.join_qst_num eq '3'}">
			a3list.push("${a3.jqo_cont}");
			</c:if>
		</c:forEach>
		
		var a3Count = new Array();
		<c:forEach var="as3" items="${answer3 }">
			a3Count.push("${as3.count}");
		</c:forEach>
		
		var q3chart = $("#q3-chart");
		var myQ3Chart = new Chart(q3chart, {
		    type: 'doughnut',
		    data: {
		        labels: a3list,
		        datasets: [{
		            label: '# of Votes',
		            data: a3Count,
		            backgroundColor: [
		                'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		                'rgba(255, 159, 64, 0.2)'
		            ],
		            borderColor: [
		                'rgba(255, 99, 132, 1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)'
		            ],
		            borderWidth: 1
		        }]
		    },
		     options: {
		        scales: {
		            y: {
		                beginAtZero: true
		            }
		        }
		    } 
		});
		

		
	});
	
</script>
</head>
<body class="sb-nav-fixed">
		<!-- 상단 고정 메뉴 -->
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
        <!-- 좌측 메뉴 -->
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
                            <div class="collapse show" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link" href="memberlist.action">회원 목록</a>
                                    <a class="nav-link" href="inquiry.action">일대일문의</a>
                                    <a class="nav-link" href="survey.action" style="background-color: #2E9AFE; color: black;">설문조사 관리</a>
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
	                     	<h1 class="mt-4">설문조사 관리</h1>
	                        <ol class="breadcrumb mb-4">
	                            <li class="breadcrumb-item active">Survey</li>
	                        </ol>
	                 </div>
	                    
	                 <br>
	                 
	                 <div style="padding: 0px 0px 0px 93%; text-align: left;">
                  	 	<button type="button" onClick="window.open('AdminSurveyAdd.jsp', '', 'width=400, height=450'); return false;" style="background-color: #e9eae5; height: 26pt; border: 1px;">설문지 등록</button>
                     </div>
	                 <br>
	                 <div class="card mb-4">
	                 	<div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            설문조사 데이터
                        </div>
	                 	
	                 	<div class="card-body">
                        	<table class="table table-striped">
                        			<c:set var="su" value="${jq_count }"></c:set>
                                	<c:forEach var="question" items="${jq_list }">
	                                	<tr class="content">
		                             		<td>${su }</td>
		                                    <td>설문조사${su }</td>
		                                    <td>${question.mem_nnm }</td>
		                                    <td>${question.dt }</td>
	                                	</tr>
	                                	
	                                	<tr id="QnA" style="display: none;" >
	                                		<td colspan="4">
	                                			<table class="table"s>
	                                				<tr>
	                                					<td colspan="2">질문1. ${question.join_qst_1 }</td>
	                                					
	                                					<td colspan="2">
		                                					<c:forEach var="option" items="${jqo_list }">
	                                							<c:if test="${option.join_qst_cd eq question.join_qst_cd and option.join_qst_num eq '1'}">
	                                								${option.jqo_cont }&nbsp;		
	                                							</c:if>
		                                					</c:forEach>
	                                					<td>
	                                				</tr>
	                                				<tr>
	                                					<td colspan="2">질문2. ${question.join_qst_2 }</td>
	                                					
	                                					<td colspan="2">
	                                					<c:forEach var="option" items="${jqo_list }">
                                							<c:if test="${option.join_qst_cd eq question.join_qst_cd and option.join_qst_num eq '2'}">
                                								${option.jqo_cont }&nbsp;
                                							</c:if>
	                                					</c:forEach>
	                                					</td>
	                                				</tr>
	                                				<tr>
	                                					<td colspan="2">질문3. ${question.join_qst_3 }</td>
	                                					
	                                					<td colspan="2">
		                                					<c:forEach var="option" items="${jqo_list }">
		                                						<c:if test="${option.join_qst_cd eq question.join_qst_cd and option.join_qst_num eq '3'}">
	                                								${option.jqo_cont }&nbsp;	
	                                							</c:if>
		                                					</c:forEach>
	                                					</td>
	                                				</tr>
	                                			</table>
	                                			<br>
	                                			
	                                			<div class="row">
					                            <div class="col-xl-6">
					                                <div class="card mb-4">
					                                    <div class="card-header">
					                                        <i class="fas fa-chart-area me-1"></i>
					                                         응답자 수
					                                    </div>
					                                    <div class="card-body"><canvas id="inwon-chart" width="100%" height="40"></canvas></div>
					                                </div>
					                            </div>
					                            <div class="col-xl-6">
					                                <div class="card mb-4">
					                                    <div class="card-header">
					                                        <i class="fas fa-chart-bar me-1"></i>
					                                        질문1
					                                    </div>
					                                    <div class="card-body"><canvas id="q1-chart" width="100%" height="40"></canvas></div>
					                                </div>
					                            </div>
					                     		</div>
					                     		
					                     		<div class="row">
					                            <div class="col-xl-6">
					                                <div class="card mb-4">
					                                    <div class="card-header">
					                                        <i class="fas fa-chart-area me-1"></i>
					                                         질문2
					                                    </div>
					                                    <div class="card-body"><canvas id="q2-chart" width="100%" height="40"></canvas></div>
					                                </div>
					                            </div>
					                            <div class="col-xl-6">
					                                <div class="card mb-4">
					                                    <div class="card-header">
					                                        <i class="fas fa-chart-bar me-1"></i>
					                                        질문3
					                                    </div>
					                                    <div class="card-body"><canvas id="q3-chart" width="100%" height="40"></canvas></div>
					                                </div>
					                            </div>
					                     		</div>
	                                		</td>
	                          			</tr>
	                          			<c:set var="su" value="${su-1 }"></c:set>
                          			</c:forEach>
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
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="<%=cp%>/js/jes/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="<%=cp%>/js/jes/datatables-simple-demo.js"></script>

</body>
</html>