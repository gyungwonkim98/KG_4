<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="resources/css/goods_list.css">
	<link rel="stylesheet" type="text/css" href="resources/css/common.css">
	
	<title>goods_list_search</title>
	<style>
		#goodsList .list_goods .cost .original {display: block;font-size: 16px;color: #999;text-decoration: line-through;}
		#goodsList .list_goods .cost .dc {padding-right: 2px;font-weight: 600;color: #fa622f;}
		.page_search .search_box {    overflow: hidden;    border-top: 2px solid #5f0080;    border-bottom: 1px solid #5f0080;}
		.page_search .search_box .tit {    float: left;    width: 210px;    height: 95px;    padding: 38px 0 0 27px;}
		.page_search .search_box .tit label {    font-weight: 700;    font-size: 14px;    color: #333;    line-height: 18px;    letter-spacing: -1px;}
		.page_search .search_box .desc {    float: right;    width: 840px;    padding: 25px 20px 0 0;}
		.page_search .search_box .inp {    float: left;    width: 603px;    height: 45px;    margin-right: 20px;    padding-left: 20px;    border: 1px solid #ccc;    font-size: 14px;    color: #333;    letter-spacing: -1px;}
		.page_search .search_box .btn_search {    float: left;    width: 175px;    height: 45px;    background-color: #5f0080;    color: #fff;    line-height: 45px;}
		.page_search .search_result {    padding: 132px 12px 12px 28px;    border-bottom: 1px solid #ccc;    font-size: 13px;    color: #333;}
		.head_aticle h2.tit {    font-weight: 400;    font-size: 30px;    color: #333;    line-height: 35px;    text-align: center;    letter-spacing: -1px;}
		.page_section {    overflow: hidden;    width: 1050px;    margin: 0 auto;    padding: 50px 0 51px;}	
		#lnbMenu {    padding-top: 26px;    padding-bottom: 40px;}
		#lnbMenu .inner_lnb {    position: relative;}
		#lnbMenu .tit {    padding-top: 23px;    font-weight: 500;    font-size: 28px;    color: #333;    line-height: 35px;    letter-spacing: -1px;    text-align: center;}
	</style>
</head>
<body>
	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">
		
			<!-- header -->
			<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
			
			<!-- main-->
			<div id="main">
				<div id="content">
		
					<div class="page_aticle">
						
												
						<div id="lnbMenu" class="lnb_menu">
							<div class="inner_lnb">
								<h3 class="tit">????????????</h3>
							</div>
						</div>

						<div class="page_aticle page_search">
							<form name="frmList" action="${pageContext.request.contextPath}/goods_list_search.do "onsubmit="return searchTracking(this)">
								<input type="hidden" name="searched" value="Y">
								<div class="search_box">
									<div class="tit"><label for="sword">?????? ??????</label></div>
									<div class="desc">
									<input type="text" name="search_keyword" id="sword" class="inp" required="required" placeholder="???????????? ??????????????????.">
									<input type="submit" class="styled-button btn_search" value="????????????">
									</div>
								</div>
							</form>
							
							
							<c:if test="${empty goods_sell_list}">
								
								<div id="goodsList" class="page_section section_goodslist">
									<p class="search_result">
									<strong class="emph">??? <span>0</span> ??? </strong>??? ????????? ?????????????????????.
									</p>
								</div>
											
								<div style="margin:100px; text-align: center;">
								 	<img id = "sorryimg" src="https://bucketkurly.s3.ap-northeast-2.amazonaws.com/bucketKurly(main)/sorry_ready.png" style="width:200px; height:200px;"><br>
								 	<p style="margin-top:50px; text-align: center; font-size: 25px;">???????????????.</p>
									<p style="margin-bottom:50px; text-align: center; font-size: 25px;">?????? ????????? ????????? ??????????????????.</p>
								</div>
								
							</c:if>
						
							
							
							
							<c:if test="${not empty goods_sell_list}">
								<div id="goodsList" class="page_section section_goodslist">
									<p class="search_result">
										<strong class="emph">??? <span>${itemCnt}</span> ??? </strong>??? ????????? ?????????????????????.
									</p>
									<div class="list_goods">
										<div class="inner_listgoods">
											<ul class="list">
												<c:forEach items="${goods_sell_list}" var="goods_sell_list">
													<li>
														<div class="item">
															<div class="thumb">
																<a class="img" href="javascript:void(0);" onClick="fn_goods_detail(${goods_sell_list.goods_sell_no})">
																	 <img src="${goods_sell_list.goodsvo.category_goods_image_thumb}">
																</a>
																<!---->
																<div class="group_btn">
																	<button type="button" class="btn btn_cart">
																		<span class="screen_out">${goods_sell_list.goods_sell_no}</span>
																	</button>
																	<!---->
																	<!---->
																</div>
															</div>
															<a class="info" href="javascript:void(0);" onClick="fn_goods_detail(${goods_sell_list.goods_sell_no})">
																<span class="name"><c:out value="${goods_sell_list.goodsvo.category_goods_name}"/></span>
																<span class="cost">
																	<c:set var="discount" value="${goods_sell_list.goods_sell_discount}" />
																	<c:if test="${discount == 0}">
																	    <span class="price"><fmt:formatNumber type="number" maxFractionDigits="0" value="${goods_sell_list.goods_sell_price}"/><span class="won">???</span></span>
																	</c:if>
																	
																	<c:if test="${discount != 0}">
																		<span class="dc">${goods_sell_list.goods_sell_discount}<span class="per">%</span></span> 
																		<span class="price"><fmt:formatNumber type="number" maxFractionDigits="0" value="${goods_sell_list.goods_sell_price - (goods_sell_list.goods_sell_price * goods_sell_list.goods_sell_discount) / 100}" /><span class="won">???</span></span> 
																		<span class="original"><fmt:formatNumber type="number" maxFractionDigits="0" value="${goods_sell_list.goods_sell_price}"/><span class="won">???</span></span>
																	</c:if>
																</span>
																<span class="desc"><c:out value="${goods_sell_list.goodsvo.category_goods_name_sub}"/></span>
															</a>
														</div>
													</li>
												</c:forEach>
											</ul>
										</div>
									</div>
									<!--????????? -->
									<div class="layout-pagination">
					                     <div class="pagediv">
					                        <!-- ??? ???????????? ?????? -->
					                        <a class="layout-pagination-button layout-pagination-first-page" href="javascript:void(0);" 
					                           onClick="fn_first()">??? ?????? ???????????? ??????</a>
					                        
					                     
					                        <!-- ?????? ???????????? ?????? -->
					                        <a class="layout-pagination-button layout-pagination-prev-page" href="javascript:void(0);" 
					                           onClick="fn_prev('${dto.page}','${dto.range}','${dto.rangeSize}')">?????? ???????????? ??????</a>
					                     
					                        
					                        <!-- ????????? ?????? -->
					                        <c:forEach begin="${dto.startPage}" end="${dto.endPage}" var="idx">
					                           <c:out value="${dto.page == idx ? 'active' : ''}"/>
					                           <a class="page-link" href="#" onClick="fn_pagination('${idx}', '${dto.range}', '${dto.rangeSize}')"> 
					                           <strong class="layout-pagination-button layout-pagination-number __active">${idx}</strong></a>
					                        </c:forEach>
					      
					                        <!-- ?????? ???????????? ?????? -->
					                        <a class="layout-pagination-button layout-pagination-next-page" href="javascript:void(0);" 
					                           onClick="fn_next('${dto.page}','${dto.range}','${dto.rangeSize}','${dto.pageCnt}')">?????? ???????????? ??????</a>
					                     
					                        
					                        <!-- ??? ??? ???????????? ?????? -->
					                        <a class="layout-pagination-button layout-pagination-last-page" href="javascript:void(0);" 
					                           onClick="fn_last('${dto.pageCnt}','${dto.rangeSize}')">??? ??? ???????????? ??????</a>
					                     </div>
					                  </div>
								</div>
							</c:if>
						</div>
						
					</div>


					<div class="bg_loading" id="bgLoading" style="display:block">
						<div class="loading_show"></div>
					</div>
					
					<script src="/common_js/common_filter.js?ver=1.39.10"></script>
					<script src="/common_js/goodslist_v1.js?ver=1.39.10"></script>
					<script type="text/javascript">
					
						//?????? ?????? ???????????? ??????
					    function fn_goods_detail(goods_sell_no){
							var url = "${pageContext.request.contextPath}/goods_list_detail.do";
							url = url + "?goods_sell_no=" + goods_sell_no;
							location.href = url;
						}		
					    
					   //?????? ???????????? ??? ????????????
						function getParameter(strParamName) {
						    var arrResult = null;
						    if (strParamName) {
						        arrResult = location.search.match(new RegExp("[&?]" + strParamName+"=(.*?)(&|$)"));
						        return arrResult && arrResult[1] ? arrResult[1] : null;
						    }
						}
					   
					
		               //??? ??? ????????? ?????? ?????????
		                function fn_first() {
		                  var search_keyword = getParameter("search_keyword");
		                  var page = 1;
		                  var range = 1;
		                 
		                  var url = "${pageContext.request.contextPath}/goods_list_search.do";
			              url = url + "?search_keyword=" + search_keyword;
		                  url = url + "&page=" + page;
		                  url = url + "&range=" + range;
		                  location.href = url;
		                 
		               }
		            
		                //?????? ?????? ?????????
		                function fn_prev(page, range, rangeSize) {
		                   var search_keyword = getParameter("search_keyword");
			               
		                   if(page > 1){ // ??? ????????? ???????????? 
		                      var page = parseInt(page - 1);
		                      var range = parseInt((page - 1)/rangeSize+1);
		                   }
		                   
		                   var url = "${pageContext.request.contextPath}/goods_list_search.do";
			               url = url + "?search_keyword=" + search_keyword;
		                   url = url + "&page=" + page;
		                   url = url + "&range=" + range;
		                   location.href = url;
		               }

		                //????????? ?????? ??????
		               function fn_pagination(page, range, rangeSize) {
		                	
		            	  var search_keyword = getParameter("search_keyword");
			                  
			              var url = "${pageContext.request.contextPath}/goods_list_search.do";
			              url = url + "?search_keyword=" + search_keyword;
		                  url = url + "&page=" + page;
		                  url = url + "&range=" + range;
		                  location.href = url;
		                  
		                }

		               //?????? ?????? ?????????
		               function fn_next(page, range, rangeSize, pageCnt) {
		                  var search_keyword = getParameter("search_keyword");
		                  
		                  if(page < pageCnt){ // ????????? ???????????? ???????????? 
		                      var page = parseInt(page)+1;
		                      var range = parseInt((page-1)/rangeSize+1);
		                  }     
		                  
			              var url = "${pageContext.request.contextPath}/goods_list_search.do";
			              url = url + "?search_keyword=" + search_keyword;
		                  url = url + "&page=" + page;
		                  url = url + "&range=" + range;
		                  location.href = url;
		               }
		               
		               //??? ??? ????????? ?????? ????????? (page=????????? ??? ????????? ??? / range=????????? ??? ??????????????? range ????????? ???)
		               function fn_last(pageCnt, rangeSize) {
		                  var search_keyword = getParameter("search_keyword");
		                  var page = parseInt(pageCnt);
		                  var range = parseInt((pageCnt-1)/rangeSize+1);         
		                  
			              var url = "${pageContext.request.contextPath}/goods_list_search.do";
			              url = url + "?search_keyword=" + search_keyword;
		                  url = url + "&page=" + page;
		                  url = url + "&range=" + range;
		                  location.href = url;
		               }
					</script>
				</div>
			</div>
			<!-- layerDSR -->
			<jsp:include page="/WEB-INF/views/layout/layerDSR.jsp"/>
		
			<!-- footer -->
			<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
		</div>
	</div>
	
	<a href="#top" id="pageTop">??? ????????????</a>
</body>
</html>

