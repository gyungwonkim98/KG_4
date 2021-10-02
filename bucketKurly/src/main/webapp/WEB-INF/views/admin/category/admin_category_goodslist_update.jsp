<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="UTF-8">

<!-- 본 파일은 템플릿입니다.  -->

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>BucketKurly::Admin-Category</title>

    <!-- Custom fonts for this template -->
    <link href="resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	<style type="text/css">
		#buttondiv{text-align: right; margin-top:5px; margin-bottom:8px;}
	</style>
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
			    	<h1 class="h3 mb-2 text-gray-800">카테고리 관리</h1>
					<p class="mb-4">버켓컬리 상품의 하위 카테고리를 관리하는 페이지입니다.</p>
                   
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header">
                            <h4 class="" style="color: #6406ca; font-weight: bolder; float: left; margin-top:10px;" >하위 카테고리 수정</h4>
                        </div>
                        <div class="card-body">
                             <form role="form" id="form" action="${pageContext.request.contextPath}/admin_category_goodslist_updateDB.mdo">
                             <input type="hidden" name="category_goods_no" value="${vo.category_goods_no}">
                            	<c:set var="no" value="${vo.category_goods_no}" />                            	
                                <table border = "1" class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                	
                                      	<tr>
											<th width="16%">1차 카테고리</th><td width="16%"><c:out value="${vo.category_goods_parent_no}"/></td>
											<th width="16%">2차 카테고리</th><td width="16%">${vo.category_goods_sub_no}</td>
											<th width="16%">상품 카테고리</th><td width="16%">${no}</td>
										</tr>
				
										<tr>
											<th>상품명</th><td colspan="2"><input class="form-control" value="${vo.category_goods_name}" name ="category_goods_name"></td>
											<th>상품명 서브</th><td colspan="2"><input class="form-control" value="${vo.category_goods_name_sub}" name ="category_goods_name_sub"></td>
										</tr>
										<tr>
											<th>판매단위</th><td><input class="form-control" value="${vo.category_goods_unit}" name ="category_goods_unit"></td>
											<th>상품용량(중량)</th><td><input class="form-control" value="${vo.category_goods_weight}" name ="category_goods_weight"></td>
											<th>원산지</th><td><input class="form-control" value="${vo.category_goods_from}" name ="category_goods_from"></td>
										</tr>
										<tr>
											<th>포장타입</th><td>${vo.category_goods_packaging_type}</td>
											<th>배송구분</th><td>${vo.category_goods_delivery_type}</td>
											<th>유통기한</th><td>${vo.category_goods_exp_date}</td>
										</tr>
										<tr>
											<th>안내사항</th><td colspan="5"><textarea class="form-control" name ="category_goods_info">${vo.category_goods_info}</textarea></td>
										</tr>
										<tr>
											<th>참고사항</th><td colspan="5"><textarea class="form-control" name ="category_goods_ref">${vo.category_goods_ref}</textarea></td>
										</tr>
										<tr>
											<th>본문 타이틀</th><td colspan="5"><input class="form-control" value="${vo.category_goods_contents_tit_main}" name ="category_goods_contents_tit_main"></td>
										</tr>
										<tr>
											<th>본문<br>서브타이틀</th><td colspan="5"><input class="form-control" value="${vo.category_goods_contents_tit_sub}" name ="category_goods_contents_tit_sub"></td>
										</tr>
										<tr>
											<th>본문 설명</th><td colspan="5"><textarea class="form-control" name ="category_goods_contents_intro">${vo.category_goods_contents_intro}</textarea></td>
										</tr>
										<tr>
											<th>썸네일</th><td colspan="5" height = "150">
												<div style = "height:100%"><img src = "${vo.category_goods_image_thumb}" height = "150"></div></td> <!-- 이미지 크기 자동조절 -->
										</tr>
										<tr>
											<th>헤드 이미지</th><td colspan="5" height = "150">
												<div style = "height:100%"><img src = "${vo.category_goods_image_head}" height = "150"></div></td>
										</tr>
										<tr>
											<th>본문 이미지</th><td colspan="5" height = "400">
												<div style = "height:100%"><img src = "${vo.category_goods_image_contents}" height = "400"></div></td>
										</tr>
										<tr>
											<th>정보 이미지</th><td colspan="5" height = "400">
												<div style = "height:100%"><img src = "${vo.category_goods_image_contents_detail}" height = "400"></div></td>
										</tr>
                                </table>
							</form>
                        </div>
                        <div class="card-footer">
                        	<div id="buttondiv">
								<a href="javascript:document.getElementById('form').submit();" class="btn btn-info btn-icon-split" >
									<span class="icon text-white-50">
										<i class="fas fa-edit"></i>
									</span>
									<span class="text">수정 하기</span>
								</a>
								<a href="javascript:history.back();" class="btn btn-secondary btn-icon-split">
									<span class="icon text-white-50">
										<i class="fas fa-arrow-right"></i>
									</span>
									<span class="text">취소 하기</span>
								</a>
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

    <!-- Bootstrap core JavaScript-->
    <script src="resources/bootstrap/vendor/jquery/jquery.min.js"></script>
    <script src="resources/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/bootstrap/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="resources/bootstrap/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="resources/bootstrap/js/demo/datatables-demo.js"></script>
  
   
</body>

</html>