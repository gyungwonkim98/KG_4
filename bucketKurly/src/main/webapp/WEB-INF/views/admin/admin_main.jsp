<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
	<link rel="shortcut icon"
	href="https://bucketkurly.s3.ap-northeast-2.amazonaws.com/bucketKurly(main)/favicon_v2.webp"
	type="image/x-icon">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>BucketKurly::Admin - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    
    <link href="resources/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- header -->
		<%@ include file="/WEB-INF/views/admin_layout/admin_sidebar.jsp"%>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

              <!-- topbar -->
				<%@ include file="/WEB-INF/views/admin_layout/admin_topbar.jsp"%>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- ๋์  ๋งค์ถ -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1" style="color: #4e73df!important;">
                                                ๋์  ๋งค์ถ</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${revenue_total}</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- ์ด ํ์ ์ -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1" style="color: #1cc88a!important;">
                                                ์ด ํ์ ์</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${member_num}</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-user fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- ์๋ฌด ์งํ์จ -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1" style="color: #36b9cc!important;">์๋ฌด ์งํ์จ
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">68%</div>
                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: 68%" aria-valuenow="68" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 1:1๋ฌธ์ ๋ต๋ณ ๋๊ธฐ๊ธ -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                1:1๋ฌธ์ ๋ต๋ณ ๋๊ธฐ๊ธ</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${board_qnaList_answait}</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
                        <!-- ๋ฑ๊ธ๋ณ ํ์ ์ฐจํธ -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">๋ฑ๊ธ๋ณ ํ์ ์</h6>
                                    
                                     <c:forEach items="${Admin_StatisticsVO}" var="Admin_StatisticsVO">
                                    <c:set var="rank" value="${Admin_StatisticsVO.member_rank }" scope="session"/>
                                 	 <c:choose>
								        <c:when test='${rank eq "ํผํ"}'>
								            <input type="hidden" id= "purple" data-purple="${Admin_StatisticsVO.member_rank_total }" >
								        </c:when> 
								        <c:when test='${rank eq "๋ผ๋ฒค๋"}'>
								              <input type="hidden" id= "laven" data-laven="${Admin_StatisticsVO.member_rank_total }">
								        </c:when>  
								        <c:when test='${rank eq "ํ์ดํธ"}'>
								            <input type="hidden" id= "white" data-white="${Admin_StatisticsVO.member_rank_total }">
								        </c:when>  
								        <c:when test='${rank eq "์ผ๋ฐ"}'>
								            <input type="hidden" id= "normal" data-normal="${Admin_StatisticsVO.member_rank_total }">
								        </c:when>          
							   		 </c:choose>
                                 	</c:forEach>
                                 
                                     <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-download fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                           
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin_getRankPDF.mdo">๋ฑ๊ธ๋ณ ํ์ ๋ค์ด๋ก๋(PDF)</a>
                                             <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin_getRankEXCEL.mdo">๋ฑ๊ธ๋ณ ํ์ ๋ค์ด๋ก๋(EXCEL)</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                    <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> ํผํ
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> ๋ผ๋ฒค๋
                                        </span>
                                         <span class="mr-2">
                                            <i class="fas fa-circle text-defalut"></i> ํ์ดํธ
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> ์ผ๋ฐ
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <!-- ๋ฒ ์คํธ ์ํ - TOP 5 -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">๋ฒ ์คํธ ์ํ - TOP 5</h6>
                                    
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-download fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">ํ์ผ ๋ค์ด๋ก๋:</div>
                                            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin_getBestItemPDF.mdo">๋ฒ ์คํธ ์ํ ๋ค์ด๋ก๋(PDF)</a>
                                             <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin_getBestItemEXCEL.mdo">๋ฒ ์คํธ ์ํ ๋ค์ด๋ก๋(EXCEL)</a>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Card Body -->
                                <div class="card-body" style="text-align:center;">
									<c:forEach items="${Admin_StatisticsBestVO}" var="Admin_StatisticsBestVO" varStatus="status">
										<c:if test="${status.count <= 5}">
		                                    <div class="text-xs font-weight-bold .text-gray-900 text-uppercase mb-1" style="padding:8px;" >
			                                        <span style="font-size:18px;"><b>${status.count}.&nbsp;&nbsp;&nbsp; ${Admin_StatisticsBestVO.category_goods_name}</b></span><br>
			                                 		<div class="text-gray-70"><b>&nbsp;&nbsp;&nbsp;&nbsp;๋์  ํ๋งค ํ์ :  ${Admin_StatisticsBestVO.count_total}</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;
			                                 		๋์  ํ๋งค ๊ธ์ก : ${Admin_StatisticsBestVO.goods_sell_price}</div>
			                                 </div>
                                    	</c:if>
	                                </c:forEach>
                                </div>
                            </div>
                        </div>
                        <!-- ๊ด๋ฆฌ์ ๊ณต์ง์ฌํญ -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">๊ด๋ฆฌ์ ๊ณต์ง์ฌํญ</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body" style="margin-left:15px">
                                    <p>1. ๊ด๋ฆฌ์ ๊ณต์ง์ฌํญ์ ์์ง ํ ์๋ฌด๋ฅผ ์งํํด์ฃผ์๊ธฐ ๋ฐ๋๋๋ค.</p>
                                    <p>2. 1:1๋ฌธ์ ๋ต๋ณ์ ๋ฌธ์ ๋ฑ๋ก ์๋๋ก ์งํํด์ฃผ์๊ธฐ ๋ฐ๋๋๋ค.</p>
                                    <p>3. ๋ฐฐ์ก์ํ ์๋ ๋ณ๊ฒฝ์ ์ฃผ๋ฌธ์ผ์ ์์ผ๋ก ์งํํด์ฃผ์๊ธฐ ๋ฐ๋๋๋ค.</p>
                                    <p>4. 1:1๋ฌธ์ ๋ต๋ณ์ ๋ฌธ์ ๋ฑ๋ก ์๋๋ก ์งํํด์ฃผ์๊ธฐ ๋ฐ๋๋๋ค.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- ๋งค์ถ ์ฐจํธ -->
                    <div class="row">
						<!-- Area Chart -->
                        <div class="col-lg-6 mb-4">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">์ผ๋ณ ๋งค์ถ ์ฐจํธ</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-download fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                           
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">ํ์ผ ๋ค์ด๋ก๋:</div>
                                            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin_getRevenuePDF_daily.mdo">์ผ๋ณ ๋งค์ถ ๋ค์ด๋ก๋(PDF)</a>
                                             <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin_getRevenueEXCEL_daily.mdo">์ผ๋ณ ๋งค์ถ ๋ค์ด๋ก๋(EXCEL)</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
					
						<!-- Area Chart -->
                       <div class="col-lg-6 mb-4">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                 <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">์๋ณ ๋งค์ถ ์ฐจํธ</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-download fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                           
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">ํ์ผ ๋ค์ด๋ก๋:</div>
                                            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin_getRevenuePDF_monthly.mdo">์๋ณ ๋งค์ถ ๋ค์ด๋ก๋(PDF)</a>
                                             <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin_getRevenueEXCEL_monthly.mdo">์๋ณ ๋งค์ถ ๋ค์ด๋ก๋(EXCEL)</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myBarChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
					</div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

           
			<!-- Footer -->
			<%@ include file="/WEB-INF/views/admin_layout/admin_footer.jsp"%>
			<!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
  
    <!-- Bootstrap core JavaScript-->
    <script src="resources/bootstrap/vendor/jquery/jquery.min.js"></script>
    <script src="resources/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/bootstrap/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="resources/bootstrap/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>

	 <script type="text/javascript">
    function number_format(number, decimals, dec_point, thousands_sep) {
    	  // *     example: number_format(1234.56, 2, ',', ' ');
    	  // *     return: '1 234,56'
    	  number = (number + '').replace(',', '').replace(' ', '');
    	  var n = !isFinite(+number) ? 0 : +number,
    	    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    	    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    	    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    	    s = '',
    	    toFixedFix = function(n, prec) {
    	      var k = Math.pow(10, prec);
    	      return '' + Math.round(n * k) / k;
    	    };
    	  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
    	  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
    	  if (s[0].length > 3) {
    	    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
    	  }
    	  if ((s[1] || '').length < prec) {
    	    s[1] = s[1] || '';
    	    s[1] += new Array(prec - s[1].length + 1).join('0');
    	  }
    	  return s.join(dec);
    	}
    </script>

    <script type="text/javascript">
    
    $(document).ready(function(){
    	
    	// Pie Chart Example
        var ctx = document.getElementById("myPieChart");
     	var purple = document.getElementById("purple");
     	var laven = document.getElementById("laven");
     	var white = document.getElementById("white");
        var normal = document.getElementById("normal");
        
        var myPieChart = new Chart(ctx, {
          type: 'doughnut',
          data: {
            labels: ["ํผํ", "๋ผ๋ฒค๋", "ํ์ดํธ", "์ผ๋ฐ"],
            datasets: [{
              data: [purple.dataset.purple, laven.dataset.laven, white.dataset.white, normal.dataset.normal],
              backgroundColor: ['#9933ff', '#d9b3ff', '#FFCCFF','#cccccc'],
              hoverBackgroundColor: ['#8000ff', '#bf80ff', '#f2f2f2','#a6a6a6'],
              hoverBorderColor: "rgba(234, 236, 244, 1)",
            }],
          },
          options: {
            maintainAspectRatio: false,
            tooltips: {
              backgroundColor: "rgb(255,255,255)",
              bodyFontColor: "#858796",
              borderColor: '#dddfeb',
              borderWidth: 1,
              xPadding: 15,
              yPadding: 15,
              displayColors: false,
              caretPadding: 10,
            },
            legend: {
              display: false
            },
            cutoutPercentage: 80,
          },
        });
        
     // ์ผ๋ณ ์ฐจํธ
    	var ctx1 = document.getElementById("myAreaChart");
    	
    	var labels_daily = ${dailyList_json_label}; 
     	var data_daily = ${dailyList_json_data};

    	console.log(${dailyList_json_label}); 
    	console.log(${dailyList_json_data});
    	
    	var myLineChart = new Chart(ctx1, {
    	  type: 'line',
    	  data: {
    	    labels: labels_daily,
    	    datasets: [{
    	      label: "์ผ๋ณ ๋งค์ถ",
    	      lineTension: 0.3,
    	      backgroundColor: "rgba(78, 115, 223, 0.05)",
    	      borderColor: "rgba(78, 115, 223, 1)",
    	      pointRadius: 3,
    	      pointBackgroundColor: "rgba(78, 115, 223, 1)",
    	      pointBorderColor: "rgba(78, 115, 223, 1)",
    	      pointHoverRadius: 3,
    	      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
    	      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
    	      pointHitRadius: 10,
    	      pointBorderWidth: 2,
    	      data: data_daily,
    	    }],
    	  },
    	  options: {
    	    maintainAspectRatio: false,
    	    layout: {
    	      padding: {
    	        left: 10,
    	        right: 25,
    	        top: 25,
    	        bottom: 0
    	      }
    	    },
    	    scales: {
    	      xAxes: [{
    	        time: {
    	          unit: 'date'
    	        },
    	        gridLines: {
    	          display: false,
    	          drawBorder: false
    	        },
    	        ticks: {
    	          maxTicksLimit: 7
    	        }
    	      }],
    	      yAxes: [{
    	        ticks: {
    	          maxTicksLimit: 5,
    	          padding: 10,
    	          // Include a dollar sign in the ticks
    	          callback: function(value, index, values) {
    	            return number_format(value) + '์';
    	          }
    	        },
    	        gridLines: {
    	          color: "rgb(234, 236, 244)",
    	          zeroLineColor: "rgb(234, 236, 244)",
    	          drawBorder: false,
    	          borderDash: [2],
    	          zeroLineBorderDash: [2]
    	        }
    	      }],
    	    },
    	    legend: {
    	      display: false
    	    },
    	    tooltips: {
    	      backgroundColor: "rgb(255,255,255)",
    	      bodyFontColor: "#858796",
    	      titleMarginBottom: 10,
    	      titleFontColor: '#6e707e',
    	      titleFontSize: 14,
    	      borderColor: '#dddfeb',
    	      borderWidth: 1,
    	      xPadding: 15,
    	      yPadding: 15,
    	      displayColors: false,
    	      intersect: false,
    	      mode: 'index',
    	      caretPadding: 10,
    	      callbacks: {
    	        label: function(tooltipItem, chart) {
    	          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
    	          return datasetLabel + ': ์' + number_format(tooltipItem.yLabel);
    	        }
    	      }
    	    }
    	  }
    	});
    		
    	// ์๋ณ ์ฐจํธ
    	// Bar Chart Example
    	var ctx2 = document.getElementById("myBarChart");
     	
     	var labels_monthly = ${monthlyList_json_label}; 
     	var data_monthly = ${monthlyList_json_data};
     	

    	console.log(${monthlyList_json_label}); 
    	console.log(${monthlyList_json_data});
    	var myBarChart = new Chart(ctx2, {
    	  type: 'bar',
    	  data: {
    	    labels: labels_monthly,
    	    datasets: [{
    	      label: "์๋ณ ๋งค์ถ",
    	      backgroundColor: "#4e73df",
    	      hoverBackgroundColor: "#2e59d9",
    	      borderColor: "#4e73df",
    	      data: data_monthly,
    	    }],
    	  },
    	  options: {
    	    maintainAspectRatio: false,
    	    layout: {
    	      padding: {
    	        left: 10,
    	        right: 25,
    	        top: 25,
    	        bottom: 0
    	      }
    	    },
    	    scales: {
    	      xAxes: [{
    	        time: {
    	          unit: 'month'
    	        },
    	        gridLines: {
    	          display: false,
    	          drawBorder: false
    	        },
    	        ticks: {
    	          maxTicksLimit: 6
    	        },
    	        maxBarThickness: 25,
    	      }],
    	      yAxes: [{
    	        ticks: {
    	          min: 0,
    	          max: 15000,
    	          maxTicksLimit: 5,
    	          padding: 10,
    	          // Include a dollar sign in the ticks
    	          callback: function(value, index, values) {
    	            return  number_format(value) + '์';
    	          }
    	        },
    	        gridLines: {
    	          color: "rgb(234, 236, 244)",
    	          zeroLineColor: "rgb(234, 236, 244)",
    	          drawBorder: false,
    	          borderDash: [2],
    	          zeroLineBorderDash: [2]
    	        }
    	      }],
    	    },
    	    legend: {
    	      display: false
    	    },
    	    tooltips: {
    	      titleMarginBottom: 10,
    	      titleFontColor: '#6e707e',
    	      titleFontSize: 14,
    	      backgroundColor: "rgb(255,255,255)",
    	      bodyFontColor: "#858796",
    	      borderColor: '#dddfeb',
    	      borderWidth: 1,
    	      xPadding: 15,
    	      yPadding: 15,
    	      displayColors: false,
    	      caretPadding: 10,
    	      callbacks: {
    	        label: function(tooltipItem, chart) {
    	          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
    	          return datasetLabel + ': ์' + number_format(tooltipItem.yLabel);
    	        }
    	      }
    	    },
    	  }
    	});
    	

    });
    </script>
    

</body>

</html>