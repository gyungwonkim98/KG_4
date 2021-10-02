<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="UTF-8">


<head>
	
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>BucketKurly::Admin-Category</title>
	
	<!-- Custom fonts for this template -->
	<link href="resources/bootstrap/vendor/fontawesome-free/css/all.min.css"
		rel="stylesheet" type="text/css">
	<link
		href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
		rel="stylesheet">
	
	<!-- Custom styles for this template -->
	<link href="resources/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">
	
	<!-- Custom styles for this page -->
	<link
		href="resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.css"
		rel="stylesheet">
		
	<style>
		img { width: 100px; }
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
                            <h4 class="" style="color: #6406ca; font-weight: bolder; float: left; margin-top:10px;" >하위 카테고리 목록</h4>
                            <a href="${pageContext.request.contextPath}/admin_category_goods_insert.mdo" class="btn btn-primary btn-icon-split" name="register" id="addBtn" style="float: right; position: relative; margin-top:7px;">
								<span class="icon text-white-50">
									<i class="fas fa-plus"></i>
								</span>
								<span class="text">등록하기</span>
							</a> 
                        </div>
						<div class="card-body">
							<div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                      	<tr>
                                      		<th width="5%">No</th>
											<th width="5%">1차<br>카테고리</th>
											<th width="5%">2차<br>카테고리</th>
											<th width="10%">상품<br>카테고리</th>
											<th width="25%">썸네일</th>
											<th width="15%">상품명</th>
											<th width="35%">본문 제목</th>										
										</tr>
                                    </thead>
                                   
									<tbody>	
										<c:forEach items="${admin_Category_goods}" var="admin_Category_goods" varStatus="status">													
											<tr>
												<td>${status.count}</td>
												<td><c:out value="${admin_Category_goods.category_goods_parent_no}"/></td>
												<td><c:out value="${admin_Category_goods.category_goods_sub_no}"/></td>
												<td><c:out value="${admin_Category_goods.category_goods_no}"/></td>
												<td>><img src="${admin_Category_goods.category_goods_image_thumb}" style="width: 20%"/></td>
												<td><a href="javascript:void(0);" onClick="fn_category_details('${admin_Category_goods.category_goods_no}')"><c:out value="${admin_Category_goods.category_goods_name}"/></a></td>
												<td><c:out value="${admin_Category_goods.category_goods_contents_tit_main}"/></td>												
											</tr>
										</c:forEach>
									</tbody>
                                </table>
                                                          	
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
    
    <script>
	    //페이지 번호 클릭
		function fn_category_details(category_goods_no) {
			var url = "${pageContext.request.contextPath}/admin_category_goodslist_no.mdo";
			url = url + "?category_goods_no=" + category_goods_no;
			location.href = url;	
	    }
    </script>

</body>

</html>