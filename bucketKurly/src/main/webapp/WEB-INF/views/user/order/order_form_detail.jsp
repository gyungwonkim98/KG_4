<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="title" content="마켓컬리 :: 내일의 장보기, 마켓컬리">
<meta name="description" content="Love Food, Love Life. 마켓컬리! 당일 수확 채소, 과일, 맛집 음식까지 내일 아침 문 앞에서 만나요!">
<meta property="og:title" content="마켓컬리 :: 내일의 장보기, 마켓컬리">
<meta property="og:description" content="Love Food, Love Life. 마켓컬리! 당일 수확 채소, 과일, 맛집 음식까지 내일 아침 문 앞에서 만나요!">
<meta property="og:image" content="https://res.kurly.com/images/marketkurly/logo/logo_sns_marketkurly.jpg">
<meta property="og:url" content="https://www.kurly.com/shop/goods/goods_cart.php?">
<meta property="og:type" content="website">
<meta property="og:site_name" content="www.kurly.com">
<meta name="keywords" content="다이어트, 식단, 닭가슴살, 요리, 치아바타, 레시피, 요리, 상차림, 다이어트음식, 이유식, 건강이유식">

<title>버켓컬리 :: 내일의 장보기, 버켓컬리</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<meta name="naver-site-verification" content="58ff7c242d41178131208256bfec0c2f93426a1d">
<meta name="facebook-domain-verification" content="tyur3wmoos7t63tpkb7zosur6p98m1">

<link rel="shortcut icon" href="https://bucketkurly.s3.ap-northeast-2.amazonaws.com/bucketKurly(main)/favicon_v2.webp" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="resources/css/order_form_detail.css">
<link rel="stylesheet" type="text/css" href="resources/css/goods_cart.css">
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
</head>
<body>
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/layout/header.jsp"%>
		<!-- header 끝-->
	
		<!-- main 시작 -->
		<div class="tit_page">
			<h2 class="tit">주문서</h2>
		</div>

		<div id="main">
			<div id="content">
	
				<div id="qnb" class="quick-navigation" style="top: 70px;">
					<div class="bnr_qnb" id="brnQuick"></div>
						<script>
					    var brnQuick = {
					        nowTime : '1632974217279',
					        update : function(){
					            $.ajax({
					                url : campaginUrl + 'pc/service/bnr_quick.html'
					            }).done(function(result){
					                $('#brnQuick').html(result);
					            });    
					        }
					    }
					    brnQuick.update();
						</script>
						
						<div class="side_menu">
							<a href="/shop/main/html.php?htmid=event/kurly.htm&name=lovers"	class="link_menu ">등급별 혜택</a> 
							<a href="/shop/board/list.php?id=recipe" class="link_menu ">레시피</a>
							<a href="/shop/goods/goods_review_best.php" class="link_menu ">베스트 후기</a>
						</div>
							<div class="side_recent" >
								<strong class="tit">최근 본 상품</strong>
								<div class="list_goods" data-height="209" style="height: 0px;"> 
									<ul class="list"></ul>
								</div>
								<button type="button" class="btn btn_up off">최근 본 상품 위로 올리기</button>
								<button type="button" class="btn btn_down">최근 본 상품 아래로 내리기</button>
							</div>
							
							<script>
							/**
							 * 상품상세일때 현재 보고 있는 상품 담기. 상품URL & 상품이미지
							 * 최종 저장 날짜로 부터 24시가 지날시 localStorage 삭제
							 */
							var getGoodsRecent = (function(){
							    var i, len, getGoodsRecent, item, _nowTime = '1632974217279';
							
							    _goodsRecent();
							    function _goodsRecent(){
							        if(localStorage.getItem('goodsRecent') === null){
							            return false;
							        }
							        
							        try{
							            getGoodsRecent = JSON.parse(localStorage.getItem("goodsRecent"));
							            len = getGoodsRecent.length;
							            if(addDays(getGoodsRecent[len - 1].time, 1) < _nowTime){
							                localStorage.removeItem('goodsRecent');
							            }else{
							                for(i = 0; i < len; i++){
							                    item = '<li><a class="link_goods" href="/shop/goods/goods_view.php?goodsno=' + getGoodsRecent[i].no + '"><img src="' + getGoodsRecent[i].thumb + '" alt=""></a></li>';
							                    $('.side_recent .list').append(item);
							                }
							                $('.side_recent').show();
							            }
							        } catch(e){
							            console.log("JSON parse error from the Quick menu goods list!!!", e);
							        }
							    }
							
							    function addDays(date, days){
							        var result = new Date(date);
							        result.setDate(result.getDate() + days);
							        return result.getTime();
							    }
							    
							    // return {
							    // }
							})();
							</script>
							
							
			</div>

				<script src="https://res.kurly.com/js/vue/lodash_v2.min.js"></script> <!-- 외부 스크립트 링크 -->
					<script>
					  // 적립금 사용시 서버 호출 빈도수 감소
					  var func = function () {
					    calcu_settle();
					  };
					
					  var debounceCalcuSettle = _.debounce(func, 300);
					</script>
					
			<div class="user_form"> <!-- 배송 관련 -->
				<script id="delivery"></script>


					<div id="popup-for-new-satbyul-user-web" class="service_delivery" >
						<h2 class="tit_bnr">
							<span id="new-satbyul-region"></span>
							<span class="emph">
							<span class="in_emph">샛별배송 </span>
							</span> 
								서비스가 시작됩니다!
						</h2>
						<ul class="list">
							<li class="fst"><strong class="tit">이제부터 새벽에 배송됩니다.</strong>
								<strong class="emph" id="new-satbyul-order-end-time"></strong>까지 주문하시면<br>
								<strong class="emph" id="new-satbyul-order-delivery-time"></strong>까지 배송됩니다.</li>
							<li class="snd">
								<strong class="tit">공동현관 비밀번호를 입력해주세요.</strong>새벽 시간 공동 현관 출입이 불가한 경우,<br>
								<strong class="emph">공동현관 앞에 배송될 수 있습니다.</strong></li>
						</ul>
					</div>
					
			<!------------------------------------ 주문 상품 ------------------------------------>	
				<h2 class="tit_section fst">주문상품</h2>
					<div id="itemList" class="page_aticle order_goodslist on"></div>
						<div id="info_prodct">
							<a class="btn" href="#none">
								<span class="screen_out">펼침 / 닫힘</span>
							</a>
							<div class="short_info">								
								<span class="num">								
								</span>
								
							</div>
						</div>
						<ul class="list_product"> 
							<li>
								<div class="thumb">사진</div>
								<div class="name">감자</div>
								<div class="ea">2개</div>
								<div class="info_price">1,1000원</div>
							</li>
						</ul>
						</div>	
						<form id=form name=frmOrder action="###" method=post onsubmit="return validateOrderForm(this)" class="order_view" novalidate>
							<input type=hidden name=platform value="desktop">
							<input type="hidden" id="order_method" name="order_method" value="cart">
							<input type="hidden" name="fallback_on_delivery_fail_method" value="2">
							<input type="hidden" name="save_payment_method" value="true">
							<input type="hidden" name="settlement_price" value="">
							<input type="hidden" name="settlekind_option" value="">
							<input type="hidden" id="package_benefit_apply" name="package_benefit_apply" value="false" />
							<input type="hidden" id="package_type" name="package_type" value="DEFAULT" />
							<div id="apply_coupon"></div>
							<input type="hidden" name="apr_coupon_data" value="">
							
			<!------------------------------------ 주문자 정보 ------------------------------------>	
							<h2 class="tit_section" id="titFocusOrderer">주문자 정보</h2>
								<div class="order_section data_orderer">
									<table class="goodsinfo_table ">
										<tbody>
											<tr class="fst">
												<th>보내는 분</th>
												<td>이상원 <input type="hidden" name="orderer_name" value="이상원">
												</td>
											</tr>
											<tr>
												<th>휴대폰</th>
												<td>01094087111 <input type="hidden" name="orderer_phone" value="01094087111">
												</td>
											</tr>
											<tr>
												<th>이메일</th>
												<td><input type="hidden" id="email" name="orderer_email"
													value="lswon9212@gmail.com" option="regEmail">lswon9212@gmail.com<p class="txt_guide">
														<span class="txt txt_case1">이메일을 통해 주문처리과정을 보내드립니다.</span>
														<span class="txt txt_case2">정보 변경은 <span class="txt_desc">마이컬리 > 개인정보 수정</span> 메뉴에서 가능합니다.
														</span>
													</p>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								
									<input type="hidden" name="zonecode" id="zonecode" value="">
									<input type="hidden" name=zipcode[] id="zipcode0" value="">
									<input type="hidden" name=zipcode[] id="zipcode1" value="">
									<input type="hidden" name=address id="address" value="">
									<input type="hidden" name="road_address" id="road_address" value="">
									<input type="hidden" name=address_sub id="address_sub" value="">				
									<input type="hidden" name="deliPoli" id="deliPoli" value="">
									<input type="hidden" name="deliveryType" id="deliveryType" value="">				
									<input type="hidden" id="means_inp" name="means" value="">
									<input type="hidden" id="addressBookNo" name="addressbook_no" value="">
									
				<!------------------------------------ 배송 정보 ------------------------------------>	
								
								<h2 class="tit_section" id="divAddressWrapper">
									배송 정보 <span class="desc">배송 휴무일: 샛별배송(휴무없음), 택배배송(일요일)</span>
								</h2>
				
									<div class="address_info">
										<a href="#none" id="btnLayerInfo" class="desc">배송지 변경 안내</a>
										<div class="layer_info" id="layerInfo">
											<strong class="emph">장바구니, 홈</strong>에서 <br> 배송지를 변경할 수 있어요.
										</div>
									</div>

										<div class="order_section order_address" id="dataDelivery">
											<h3 href="#none" class="section_crux">배송지</h3>
											<div class="section_full">
												<span class="address" id="divDestination" >
													<span class="default" id="addrDefault" data-text="기본배송지"></span>
													<span class="addr" id='addrInfo'>서울특별시 ###</span>
													<span class="tag"  id="addrTags">
													<span class="badge star" id="addrBadge">샛별배송</span>
												</span>
												</span>
											</div>
										</div>

									<div class="order_section order_reception" id="divReception" >
										<h3 class="section_crux">상세 정보</h3>
											<div class="section_full">					
												<div class="receiving off" id="receiverInfo">받으실 분 정보를 입력해 주세요</div>
													<div class="way" id="wayPlace" >
														<span class="place" id="areaInfo">문앞</span>
															<span class="txt" id="meanType">받으실 장소를 입력해 주세요</span>					
																<div class="message" id="deliveryMessage" >
															<span class="place" id="deliveryMessageTitle">배송완료 메시지</span>
																<span class="txt" id="deliveryMessageDetail">배송 직후</span>
																</div>
															</div>
															<button type="button" id="btnUpdateSubAddress" data-address-no="" class="btn active">입력</button>					
											</div>
									</div>

										<div id="package-method" class="order_section reusable_packaging"></div>
											<div id="bnrOrder" class="bnr_order" style="display: block;">
												<img src="https://res.kurly.com/kurly/img/2021/banner-order-paper_1050_107%402x.jpg" alt="All Paper Challenge">
													<p class="screen_out">사람에게도 환경에도 더 이로운 배송 친환경 포장재 자세히 보기</p>
											</div>
												<div id="divFrozen" class="order_section order_pack">
													<h3 class="section_crux">냉동상품 포장*</h3>
														<div class="section_full">
															<input type="hidden" name="isFrozenPack" value="">
															<label class="label_radio checked">
															<input type="radio" name="frozen_product_packing_option" value="0" checked="checked">
																<span class="ico"></span> 종이박스 포장 (기본)</label>
																	<label class="label_radio">
																		<input type="radio" name="frozen_product_packing_option" value="1">
																			<span class="ico"></span> 스티로폼 박스 포장 </label>
														</div>
												</div>
												
								<!------------------------------------ 결제 금액 ------------------------------------>		
								
												
											<div class="tax_absolute">
												<div class="inner_sticky" id="sticky" style="top: 0px;">
													<h2 class="tit_section">결제금액</h2>
														<div id="orderitem_money_info">
															<dl class="amount fst">
																<dt class="tit">주문금액</dt>
																<dd class="price">
																	<span id="productsTotalPrice">####</span> 원
																</dd>
															</dl>
															
															<dl class="amount sub">
																<dt class="tit">상품금액</dt>
																<dd class="price">
																	<span id="paper_goodsprice">###</span> 원
																</dd>
															</dl>
															
															<dl class="amount sub">
																<dt class="tit">상품할인금액</dt>
																<dd class="price sales_area">
																	<span class="pm_sign normal" style="display: inline;">-</span>
																		<span id="special_discount_amount" class="normal">####</span> 원</dd>
																<dd id="paper_sale" class="screen_out">####</dd>
															</dl>
															
															<dl class="amount">
																<dt class="tit">배송비</dt>
																<dd class="price delivery_area">
																	<div id="paper_delivery_msg1">
																		<span class="pm_sign">+</span>
																		<span id="paper_delivery" class="screen_out">0</span>
																		<span id="paper_delivery2" >0</span> 원
																	</div>
																	<div id="paper_delivery_msg2" style="display: block;">0 원</div>
																	<div id="paper_delivery_msg_extra" class="small" ></div>
																	<span id="free_delivery_coupon_msg" class="screen_out">미적용</span>
																	<input type="hidden" name="free_delivery" value="0">
																</dd>
															</dl>
															
															<dl class="amount">
																<dt class="tit">쿠폰할인금액</dt>
																<dd class="price coupon_area">
																	<span class="pm_sign">-</span>
																	<span id="apr_coupon_data">0</span>	원 
																	<input type="hidden" name="coupon" size="12" value="0" readonly>
																</dd>
															</dl>
															
															<dl class="amount">
																<dt class="tit">적립금사용</dt>
																<dd class="price">
																	<span class="num pay_sum" id="paper_reserves">0 원</span>
																	<input type="hidden" name="coupon_emoney" size="12" value="0" readonly>
																</dd>
															</dl>
															
															<dl class="amount lst">
																<dt class="tit">최종결제금액</dt>
																<dd class="price">
																	<span id="paper_settlement">00,000</span>
																	<span class="won">원</span>
																</dd>
															</dl>
															
															<p class="reserve" style="display: block;">
																<span class="ico">적립</span>
																구매 시
																<span class="emph">
																<span id="expectAmount">0</span> 원 (<span class="ratio"></span>%) 적립</span>
															</p>
														</div>
						
													<div id="msgEvent"></div>
												</div>
											</div>
											
							<!------------------------------------ 쿠폰 / 적립금 ------------------------------------>			

												<div class="data_payment">
													<div class="tbl_left">
														<h2 class="tit_section">쿠폰 / 적립금</h2>
							
														<table class="goodsinfo_table">
															<tbody>
															<tr>
																<th>쿠폰 적용</th>
																<td>
																	<div class="view_popselbox">
																		<div id="popselboxView" class="select_box off">
																			사용 가능 쿠폰 <span id="useCoupon">0</span>개 / 전체 <span id="haveCoupon">0</span>개
																		</div>
																		
																		<div id="popSelbox" class="layer_coupon">
																			<ul id="addpopSelList" class="list">																			
																				<li class="fst checked ">
																					<div class="inner_item">
																						<span class="txt_tit default">쿠폰 적용 안 함</span>
																					</div>
																				</li>
																			</ul>																																				
																			<div class="coupon_list_default" >
																				<li class="fst checked" >	
																					<div class="inner_item">
																						<span class="txt_tit default">쿠폰 적용 안 함</span>
																					</div>
																				</li>
																			</div>																		
																			<div id="listItem" >	
																				<div class="inner_item">	
																					<div class="item_row">
																						<div class="item_td left">
																							<span class="txt_apr"></span>
																						</div>
																						
																							<div class="item_td">
																								<span class="txt_tit"></span>
																								<span class="txt_desc"></span>
																								<span class="txt_expire"></span>
																								<div id="apply_delivery_coupon"	class="is_delivery_coupon" ></div>
																								<div class="txt_apply_coupon" ></div>
																								<ul id="payment_gateways" ></ul>
																								<div id="point_allowed" ></div>
																							</div>
																					</div>
																				</div>
																			</div>																			
																					<button id="popSelboxCancel" type="button" class="btn btn_cancel screen_out">취소</button>
																					<button id="popSelboxSelect" type="button" class="btn btn_conf screen_out">확인</button>
																					<button id="popSelboxClose" type="button" class="btn_close screen_out">닫기</button>
																	</div>
																</div>
																	<div id="notavailableMsg" class="txt_notavailable"></div>
																	<p class="txt_inquiry">
																		<a href="#none" class="link" id="happyTalk">쿠폰사용문의(카카오톡)</a>
																	</p>
																</td>
															</tr>
															<tr class="emoney_use ">
																<th class="no_emoney">적립금 적용
																	<input type="hidden" value="0" name="checkEmoney">
																</th>
																	<td>사용 가능한 적립금이 없습니다.
																		<input type="hidden" name="using_point" id="emoney" value="0">
																	</td>
															</tr>
														</tbody>
														</table>
													</div>
												</div>

										<!------------------------------------ 결제 수단 --------------------------------------------->
													<div class="data_method">
														<h2 class="tit_section" id="titFocusMethod">결제수단</h2>
								
															<input type=hidden name=escrow value="N">
																<table class="goodsinfo_table tbl_left">
																<tbody>
																	<tr id="kakaopay_payment" class="payments fst">
																		<th>카카오페이 결제</th>
																		<td>
																			<label class="label_radio" id="cardBenefitKakaopay">
																			<input type="radio" name="settlekind" value="kakao-pay"	onclick="input_escrow(this,'N')" checked="checked">
																				<img src="https://res.kurly.com/pc/service/order/2105/logo_kakaopay.png" height="22" alt="카카오페이 결제">
																					<span class="img_benefit" style="display: inline-block;">
																					6만원 이상 결제 시
																					<span>3천원 즉시할인</span>
																					</span>
																						<div class="info txt_kakao"></div>
																							<div class="info_benefit">
																								<span class="info">· 10/1 11시 ~ 10/17 23시, 카카오페이 ID당 1회(실명인증 기준), 선착순</span>
																							</div>
																			</label>
																		</td>
																	</tr>
																		<tr class="payments card" >
																			<th>일반결제</th>
																			<td class="noline" style="position: relative">
																				<label class="label_radio checked" id="settlekindCard" onclick="option_pay_standard('');">
																					<input type=radio name=settlekind value="c" onclick="input_escrow(this,'N');">신용카드</label>
																			</td>
																		</tr>
										
																	<tr class="card_detail">
																		<th></th>
																		<td>
																			<div id="cardSelect">
																				<div>
																					<div class="select_box">
																					<!--------->
																					<strong class="tit">신한 (무이자)</strong>
																						<select name="lguplus_card_code" class="list">
																							<option disabled="disabled" value="" >카드를 선택해주세요</option>
																							<option value="61">현대 (무이자)</option>
																							<option value="41">신한 (무이자)</option>
																							<option value="31">비씨 (무이자)</option>
																							<option value="11">KB국민 (무이자)</option>
																							<option value="51">삼성 (무이자)</option>
																							<option value="36">씨티 (무이자)</option>
																							<option value="71">롯데 (무이자)</option>
																							<option value="21">하나 (외환)(무이자)</option>
																							<option value="91">NH채움 (무이자)</option>
																							<option value="33">우리 (무이자)</option>
																							<option value="34">수협</option>
																							<option value="46">광주 (무이자)</option>
																							<option value="35">전북 (무이자)</option>
																							<option value="42">제주</option>
																							<option value="62">신현체크</option>
																							<option value="38">MG새마을체크</option>
																							<option value="37">우체국카드</option>
																							<option value="30">KDB산업은행</option>
																							<option value="15">카카오뱅크</option>
																						</select>
																					</div>	
																				<div class="selec_box" >
																					<!------->
																					<strong class="tit">일시불</strong>
																						<select name="lguplus_card_installment_month" class="list">
																							<option disabled="disabled" value="" >할부기간을 선택해주세요</option>
																							<option value="0">일시불</option>
																							<option value="2">2개월 (무이자)</option>
																							<option value="3">3개월 (무이자)</option>
																							<option value="4">4개월 (무이자)</option>
																							<option value="5">5개월 (무이자)</option>
																							<option value="6">6개월 (무이자)</option>
																							<option value="7">7개월 (무이자)</option>
																							<option value="8">8개월</option>
																							<option value="9">9개월</option>
																							<option value="10">10개월</option>
																							<option value="11">11개월</option>
																							<option value="12">12개월</option>
																						</select>
																					</div>
																				</div>
																					<!--------->
																					<div class="card_event">
																						<div></div>
																						<div class="inner_card">
																							<div>
																								<strong class="emph">. 무이자 할부 유의사항</strong>																								
																							</div>
																						</div>
																					</div>
																				
																					<card-select :card-data="cardData" :current-code="currentCode"
																						:install-card="installCard" :point-card="pointCard"
																						:card-description="cardDescription"
																						:selected-card="selectedCard"
																						:selected-install="selectedInstall"
																						:card-discount-event="cardDiscountEvent"
																						:cur-card-event-data="curCardEventData"
																						@on-selected="onSelected"></card-select>
																			</div>
																		</td>
																	</tr>
										
																	<tr class="payments">
																		<th>CHAI 결제</th>
																		<td><label class="label_radio" id="cardBenefitChai">
																				<input type="radio" name="settlekind" value="chai" onclick="input_escrow(this,'N')">
																					<img src="https://res.kurly.com/pc/service/order/2106/ico_chai.png" height="22" alt="Chai 결제">
																						<span class="img_benefit" style="display: inline-block;">
																						"2만원 이상 생애 첫 결제 시 "<span>3천원 즉시 할인</span>
																						</span>
																				<div class="info_benefit">
																					<span class="info_benefit">· 10/1 0시 ~ 10/31 24시, 기간 내 차이 ID당 1회, 선착순</span>
																				</div>
																			</label>
																		</td>
																	</tr>
																	
																	<tr class="payments">
																		<th>토스 결제</th>
																			<td><label class="label_radio" id="cardBenefitToss">
																					<input type="radio" name="settlekind" value="toss" onclick="input_escrow(this,'N')">
																						<img src="https://res.kurly.com/pc/service/order/2106/ico_toss.png" height="22" alt="토스 결제">
																							<span class="img_benefit"></span>																							
																								<div class="info_benefit"></div>
																				</label>
																			</td>
																	</tr>
																	<tr class="payments">
																		<th>네이버페이 결제</th>
																			<td class="noline">
																				<label class="label_radio" id="cardBenefitNaverpay">
																					<input type=radio name=settlekind value="n" onclick="input_escrow(this,'N');">
																						<img src="https://res.kurly.com/pc/service/order/2106/ico_naverpay.png" height="22" alt="네이버 페이 로고">
																							<span class="img_benefit"></span>
																							<div class="info_benefit"></div>
																				</label>
																			</td>
																	</tr>
																	<tr class="payments">
																		<th>PAYCO 결제</th>
																		<td><label class="label_radio" id="cardBenefitPayco">
																				<input type=radio name=settlekind value="t" onclick="input_escrow(this,'N');check_naverNcashUseAble();">													
										
																				<img src="https://res.kurly.com/pc/service/order/2106/ico_payco.png" alt="PAYCO 간편결제" height="22">
																					<span class="img_benefit" style="display: inline-block;">
																					"페이코 충전포인트로 결제할 때마다"
																						<span>최대 5% 적립</span>
																					</span>
																						<div class="info_benefit">
																							<span class="info">
																							"· 09/01 0시 ~ 10/31 24시, 기본 2% + 추가 3% 페이코 포인트 적립 (건당 최대 1,000원)"
																							<br>
																							"· 페이코로 15,000원 이상 구매 시 페이코 앱 내 1천원 쿠폰 적용 (1일 ID당 1회)"
																							<br>
																							"· *페이코 앱 내 쿠폰영역에서 마켓컬리 쿠폰 다운로드, 결제 시 페이코 앱 내 적용"
																							</span>
																						</div>
																			</label>
																		</td>
																	</tr>
																	<tr class="payments">
																		<th>스마일페이 결제</th>
																			<td><label class="label_radio" id="cardBenefitSmilepay">
																				<input type="radio" name="settlekind" value="s" onclick="input_escrow(this,'N')">
																					<img src="https://res.kurly.com/pc/service/order/2106/ico_smilepay.png" alt="스마일페이" height="22">
																						<span class="img_benefit"  style="display: inline-block;">
																							"2만원 이상 첫 결제 시 "
																							<span>결제금액의 10% 즉시 할인</span>
																						</span>
																					<div class="info_benefit">
																						<span class="info">
																						"· 10/1 0시 ~ 10/31 24시, 스마일페이 ID당 1회 (실명인증 기준) 선착순"
																						<br>
																						"· 스마일페이로 첫 결제 시 결제금액의 10% (최대 3천원) 즉시 할인"
																						</span>
																					</div>																					
																				</label>
																			</td>
																	</tr>
																	<tr class="payments phone">
																		<th>휴대폰 결제</th>
																			<td>
																				<label class="label_radio"> 
																					<input type=radio name=settlekind value="h" onclick="input_escrow(this,'N')">휴대폰</label>
																			</td>
																	</tr>
										
																	<tr>
																		<td class="txt_notice" colspan="2">
																			<ul>
																				<li>※ 카카오페이, 차이, 토스, 네이버페이, 페이코 결제 시, 결제하신 수단으로만 환불되는 점	양해부탁드립니다.</li>
																				<li>※ 고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 토스 페이먼츠의 구매안전(에스크로) 서비스를 이용하실 수 있습니다.</li>
																				<li>※ 보안강화로 Internet Explorer 8 미만 사용 시 결제창이 뜨지 않을 수 	있습니다. <a href="####"	target="_blank">공지 보러가기</a></li>
																				<li id="coupon_typinfo" style="display: none">※ 무통장입금에서만	사용가능한 쿠폰을 선택하였습니다. 다른 결제 수단을 선택하시려면 쿠폰을 제거 하여 주십시오.</li>
																			</ul>
																		</td>
																	</tr>
																</tbody>
																</table>
														<input type="hidden" name="undeliver_way" value="2" />
								
																<div id="cash" >
																	<h2 class="tit_section">현금영수증발급</h2>
																		<table class="goodsinfo_table">
																			<tbody>
																				<tr>
																					<th>현금영수증</th>
																					<td><label class="label_radio">
																						<input type="radio" name="cashreceipt" value="Y" onClick="cash_required()"> 신청 </label>
																					<label class="label_radio checked"> <input type="radio" name="cashreceipt" value="N" onClick="cash_required()" checked>신청안함</label>
																					</td>
																				</tr>
																				<tr>
																					<th>발행용도</th>
																					<td><label class="label_radio checked">
																						<input type="radio" name="cashuseopt" value="0" onClick="setUseopt()" checked> 소득공제용 </label>
																							<label class="label_radio"> <input type="radio" name="cashuseopt" value="1" onClick="setUseopt()">지출증빙용</label>
																					</td>
																				</tr>
																				<tr>
																					<th><span id="cert_0" style="display: block;">휴대폰번호</span>
																						<span id="cert_1" style="display: none;">사업자번호</span></th>
																					<td style="padding-top: 14px;"><input type="text" name="cashcertno" value="" option="regNum" class="line" placeholder="- 생략">
																					</td>
																				</tr>
																			</tbody>
																		</table>
																</div>
														
															<script>
															function cash_required()
															{
																var display = 'block';
																if (_ID('cash') == null) return;
															
																var obj = document.getElementsByName('settlekind');
																for (var i = 0; i < obj.length; i++){
																	if (obj[i].checked != true) continue;
																	var settlekind = obj[i];
																	break;
																}
																if (settlekind == null) display = 'none';
																else if (settlekind.value != 'a') display = 'none';
															
																if (_ID('cash').style.display == display && display =='none') return;
																_ID('cash').style.display = display;
															
																items = new Array();
																items.push( {name : "cashreceipt", label : "현금영수증 신청여부", msgR : ""} );
																items.push( {name : "cashuseopt", label : "현금영수증 발행용도", msgR : "현금영수증 발행용도를 선택해야 합니다."} );
																items.push( {name : "cashcertno", label : "휴대폰번호", msgR : ""} );
															
																for (var i = 0; i < items.length; i++){
																	var obj = document.getElementsByName(items[i].name);
																	if (display == 'block' && items[i].name != 'cashreceipt' && typeof(document.getElementsByName('cashreceipt')[0]) != "undefined")
																		state = (document.getElementsByName('cashreceipt')[0].checked ? 'block' : 'none');
																	else state = display;
																	for (var j = 0; j < obj.length; j++){
																		if (state == 'block'){
																			obj[j].setAttribute('required', '');
																			obj[j].setAttribute('label', items[i].label);
																			obj[j].setAttribute('msgR', items[i].msgR);
																			obj[j].disabled = false;
															
																			if (items[i].name == 'cashcertno') setUseopt();
																		}
																		else {
																			obj[j].removeAttribute('required');
																			obj[j].removeAttribute('label');
																			obj[j].removeAttribute('msgR');
																			obj[j].disabled = true;
																		}
																	}
																}
															}
															
															function setUseopt()
															{
																var useopt = document.getElementsByName('cashuseopt');
																if (useopt[0].checked)
																{
																	_ID('cert_0').style.display = "block";
																	_ID('cert_1').style.display = "none";
																	useopt[0].form.cashcertno.setAttribute('label', '휴대폰번호');
																	useopt[0].form.cashcertno.setAttribute('msgR', '휴대폰번호를 정확히 입력하세요.');
																}
																else if (useopt[1].checked)
																{
																	_ID('cert_0').style.display = "none";
																	_ID('cert_1').style.display = "block";
																	useopt[1].form.cashcertno.setAttribute('label', '사업자번호');
																	useopt[1].form.cashcertno.setAttribute('msgR', '사업자번호를 정확히 입력하세요.');
																}
															}
															</script>
														
													</div>
													
							<!------------------------------------ 개인정보 수집/제공 ------------------------------------>							
					
										<div style="clear: both;"></div>
											<h2 class="tit_section" id="titFocusAgree">개인정보 수집/제공</h2>
										<table class="goodsinfo_table">
											<tbody>
												<tr>
													<td class="reg_agree">
														<div class="bg_dim"></div>
														<div class="check type_form">
															<label class="agree_check">
																<input type="checkbox" name="ordAgree" value="y" required fld_esssential label="결제 진행 필수 동의" msgR="결제 진행 필수 동의 내용에 동의하셔야 결제가 가능합니다.">
																	<span class="ico"></span> 결제 진행 필수 동의 </label>
																<ul class="list_agree">
																	<li><span class="subject">개인정보 수집 · 이용 및 처리 동의 <span class="emph">(필수)</span></span>
																		<a href="#terms" class="link_terms">약관보기</a></li>
																	<li id="pgTerms"><span class="subject">결제대행 서비스 약관 동의 <span class="emph">(필수)</span>
																		</span> <a href="#pgTerms" class="link_terms">약관보기</a>
																	</li>
																</ul>
																	<div class="layer layer_agree">
																		<div class="choice_agree view_terms">
																			<div class="inner_layer">
																				<div class="in_layer" id="viewTerms"></div>
																				<button type="button" class="btn_ok">확인</button>
																				<button type="button" class="btn_close">
																					<span class="screen_out">레이어 닫기</span>
																				</button>
																			</div>
																		</div>
																		<div class="choice_agree view_pg">
																			<div class="inner_layer">
																				<div class="in_layer" id="viewPg"></div>
																				<button type="button" class="btn_ok">확인</button>
																				<button type="button" class="btn_close">
																					<span class="screen_out">레이어 닫기</span>
																				</button>
																			</div>
																		</div>
							
																		<div class="choice_agree view_layer">
																			<div class="inner_layer">
																				<div class="in_layer in_allpaper">
																					<img src="https://res.kurly.com/pc/service/order/2012/bnr_allpaper_big_v2.png" alt="샛별배송은 왜 종이 포장재를 사용할까요?">
																					<p class="screen_out">샛별배송을 사용하는 것만으로도 지구를 위하는 일에 함께하실 수 있어요. 신선함을 지키는 보냉력과 내구성은 그대로! 다른 어떤 소재보다도 재활용성이 우수하니까! 폐기해도 빠르게 분해되니까!</p>
																				</div>
																				<button type="button" class="btn_ok">확인</button>
																			</div>
																		</div>
																	</div>
																	
																	<script>
														            // 레이어 열기,닫기 (KM-725 주문서 카드 단일화 : 장차석)
														            var termsShow = {
														              winScrollTop : 0,
														              winHeight : 0,
														              resultHeight : 0,
														              layer : $('.layer_agree'),
														              bg : null,
														              action : function(){
														                var $self = this;
														                $self.body = $('body');
														
														                $('.list_agree .link_terms, .btn_layershow').on('click',function(e){
														                  e.preventDefault();
														
														                  $self.winScrollTop = $(window).scrollTop();
														                  $self.body.addClass('noBody').css({
														                    'top' : -$self.winScrollTop
														                  });
														
														                  $self.winHeight = $(window).height();
														
														                  $('.bg_dim').css('display','block');
														                  var obj = $(this).attr('href');
														                  $self.layer.find('.choice_agree').hide();
														                  $self.layer.show();
														
														                  if(obj === '#terms'){
														                    $self.getTerms(obj);
														                    $self.layer.find('.view_terms').show();
														                  }else if(obj === '#pgTerms'){
														                    $self.getTerms(obj);
														                    $self.layer.find('.view_pg').show();
														                  }else if(obj === '#layerShow'){
														                    $self.layer.find('.view_layer').show();
														                    // $self.layerPosition();
														                  }else{
														                    $self.layerClose();
														                    // $self.layerPosition();
														                  }
														                });
														
														                $('.layer_agree .btn_ok, .layer_agree .btn_close').on('click',function(e){
														                  e.preventDefault();
														                  $self.layerClose();
														                  $('.bg_dim').css('display','none');
														                });
														              },
														              layerClose : function(){
														                var $self = this;
														                $self.body.removeClass('noBody').removeAttr('style');
														                $self.layer.hide().removeAttr('style');
														                $self.layer.find('.box_tbl').removeAttr('style');
														                window.scrollTo(0, $self.winScrollTop);
														              }
														              ,getTerms: function(obj){
														                var ajaxUrl, $target, $self = this;
														                try {
														                  if(obj === '#terms'){
														                    $target = $('#viewTerms');
														                    ajaxUrl = 'https://res.kurly.com/json/terms/202108/private_v3.html';
														                  }else if(obj === '#pgTerms'){
														                    $target = $('#viewPg');
														                    ajaxUrl = 'https://res.kurly.com/json/terms/202008/pg_v2.html';
														                  }
														                  $.get(ajaxUrl, function (response) {
														                    $target.html(response);
														                    $target.find('.log_in, .log_out').hide();
														                    if( window.webStatus.isSession ){
														                      $target.find('.log_in').show();
														                    }
														                    if( !window.webStatus.isSession ){
														                      $target.find('.log_out').show();
														                    }
														
														                    // $self.layerPosition(obj);
														                  });
														                } catch (e) {
														                  alert(e);
														                }
														              }
														            }
														            termsShow.action();
														          </script>
																</div>
															</td>
														</tr>
													</tbody>
												</table>

														<div id="paymentMethodResult">
															<input type="hidden" name="payment_method" value="">
														</div>
															<input type="submit" value="결제하기" class="btn_payment">
							</form>
							</div>
								<ul class="notice_order">
									<li>직접 주문취소는 <span class="emph">‘입금확인’</span> 상태에서만 가능합니다.</li>
									<li>미성년자가 결제 시 법정대리인이 거래를 취소할 수 있습니다.</li>
									<li class="emph">상품 미 배송시, 결제수단으로 환불됩니다.</li>
								</ul>
									<div id="dynamic"></div>

									<script src="/common_js/order_card_v1.js?ver=1.39.15"></script>
									<script src="/common_js/pc_coupon_receiver.js?ver=1.39.15"></script>

						<script>
						  /**
						   * 결제하기 클릭시 validate fail focus
						   * @param name : ex) #test .test ...(id나 class)
						   */
						   var validateFocusAction = function(name){
						    window.scrollTo(0, $(name).offset().top);
						  }
						
						  // 바로구매 체킹
						  var orderMethod = window.sessionStorage.getItem('isDirect') === '1' ? 'direct' : 'cart'; // pc_coupon_receiver.js 에서도 사용중
						  $('#order_method').val(orderMethod);
						
						  // KM-2118 특수문자 입력 방지
						  var preventSpecialChars = function($self, type) {
						    var str = $self.val();
						    var regExp = /(?:[^\w\s\uAC00-\uD7A3\u1100-\u11FF\u3131-\u314E\u314F-\u3163\u318D\u119E\u11A2\u2022\u2025a\u00B7\uFE55]|_)+/g;
						    var msg = '수령인 이름에 한글, 영어, 숫자 외 특수문자를 사용할 수 없습니다.';
						    if($self.attr('name') === 'orderer_name'){
						      msg = '보내는 분 이름에 한글, 영어, 숫자 외 특수문자를 사용할 수 없습니다. \n마이컬리 > 개인정보 수정 화면에서 회원 이름을 변경해주세요.';
						    }
						
						    if(type === 'write'){
						      if(regExp.test(str) && $self.attr('readOnly') !== 'readonly'){
						        $self.val(str.replace(regExp, ''));
						      }
						    }else{
						      if(regExp.test(str)){
						        alert(msg);
						        validateFocusAction('#titFocusOrderer');
						        if(type === 'result'){
						          return false;
						        }
						      }
						      return true;
						    }
						  }
						
						  var chkSpecialChars = function(str) {
						    var regExp = /(?:[^\w\s\uAC00-\uD7A3\u1100-\u11FF\u3131-\u314E\u314F-\u3163\u318D\u119E\u11A2\u2022\u2025a\u00B7\uFE55]|_)+/g;
						    var rtnVal = true;
						    if(regExp.test(str)){
						      rtnVal = false;
						    }
						
						    return rtnVal;
						  }
						
						  $('input[name=orderer_name]').on('keyup keydown blur', function(){
						    preventSpecialChars($(this), 'write');
						  });
						
						  $("textarea").keydown(function(e) {
						    var lengthF = $(this).val();
						
						    if (lengthF.length > 55){
						      e.preventDefault();
						    }
						  });
						
						  var  parseJSON = function(str) {
						    var json;
						    try {
						      json = JSON.parse(str);
						    }
						    catch (err) {
						      console.error(err);
						    }
						
						    return json;
						  };
						
						  // 사용 가능 문자열 체크
						  var Allow_Chars = "가각간갇갈갉갊감갑값갓갔강갖갗같갚갛개객갠갤갬갭갯갰갱갸갹갼걀걋걍걔걘걜거걱건걷걸걺검겁것겄겅겆겉겊겋게겐겔겜겝겟겠겡겨격겪견겯결겸겹겻겼경곁계곈곌곕곗고곡곤곧골곪곬곯곰곱곳공곶과곽관괄괆괌괍괏광괘괜괠괩괬괭괴괵괸괼굄굅굇굉교굔굘굡굣구국군굳굴굵굶굻굼굽굿궁궂궈궉권"
						    +"궐궜궝궤궷귀귁귄귈귐귑귓규균귤그극근귿글긁금급긋긍긔기긱긴긷길긺김깁깃깅깆깊까깍깎깐깔깖깜깝깟깠깡깥깨깩깬깰깸깹깻깼깽꺄꺅꺌꺼꺽꺾껀껄껌껍껏껐껑께껙껜껨껫껭껴껸껼꼇꼈꼍꼐꼬꼭꼰꼲꼴꼼꼽꼿꽁꽂꽃꽈꽉꽐꽜꽝꽤꽥꽹꾀꾄꾈꾐꾑꾕꾜꾸꾹꾼꿀꿇꿈꿉꿋꿍꿎꿔꿜꿨꿩꿰꿱꿴꿸뀀뀁뀄뀌뀐뀔뀜뀝뀨끄끅끈끊"
						    +"끌끎끓끔끕끗끙끝끼끽낀낄낌낍낏낑나낙낚난낟날낡낢남납낫났낭낮낯낱낳내낵낸낼냄냅냇냈냉냐냑냔냘냠냥너넉넋넌널넒넓넘넙넛넜넝넣네넥넨넬넴넵넷넸넹녀녁년녈념녑녔녕녘녜녠노녹논놀놂놈놉놋농높놓놔놘놜놨뇌뇐뇔뇜뇝뇟??뇩뇬뇰뇹뇻뇽누눅눈눋눌눔눕눗눙눠눴눼뉘뉜뉠뉨뉩뉴뉵뉼늄늅늉느늑는늘늙늚늠늡늣능"
						    +"늦늪늬늰늴니닉닌닐닒님닙닛닝닢다닥닦단닫달닭닮닯닳담답닷닸당닺닻닿대댁댄댈댐댑댓댔댕댜더덕덖던덛덜덞덟덤덥덧덩덫덮데덱덴델뎀뎁뎃뎄뎅뎌뎐뎔뎠뎡뎨뎬도독돈돋돌돎돐돔돕돗동돛돝돠돤돨돼됐되된될됨됩됫됴두둑둔둘둠둡둣둥둬뒀뒈뒝뒤뒨뒬뒵뒷뒹듀듄듈듐듕드득든듣들듦듬듭듯등듸디딕딘딛딜딤딥딧딨딩"
						    +"딪따딱딴딸땀땁땃땄땅땋때땍땐땔땜땝땟땠땡떠떡떤떨떪떫떰떱떳떴떵떻떼떽뗀뗄뗌뗍뗏뗐뗑뗘뗬또똑똔똘똥똬똴뙈뙤뙨뚜뚝뚠뚤뚫뚬뚱뛔뛰뛴뛸뜀뜁뜅뜨뜩뜬뜯뜰뜸뜹뜻띄띈띌띔띕띠띤띨띰띱띳띵라락란랄람랍랏랐랑랒랖랗래랙랜랠램랩랫랬랭랴략랸럇량러럭런럴럼럽럿렀렁렇레렉렌렐렘렙렛렝려력련렬렴렵렷렸령례롄"
						    +"롑롓로록론롤롬롭롯롱롸롼뢍뢨뢰뢴뢸룀룁룃룅료룐룔룝룟룡루룩룬룰룸룹룻룽뤄뤘뤠뤼뤽륀륄륌륏륑류륙륜률륨륩륫륭르륵른를름릅릇릉릊릍릎리릭린릴림립릿링마막만많맏말맑맒맘맙맛망맞맡맣매맥맨맬맴맵맷맸맹맺먀먁먈먕머먹먼멀멂멈멉멋멍멎멓메멕멘멜멤멥멧멨멩며멱면멸몃몄명몇몌모목몫몬몰몲몸몹못몽뫄뫈"
						    +"뫘뫙뫼묀묄묍묏묑묘묜묠묩묫무묵묶문묻물묽묾뭄뭅뭇뭉뭍뭏뭐뭔뭘뭡뭣뭬뮈뮌뮐뮤뮨뮬뮴뮷므믄믈믐믓미믹민믿밀밂밈밉밋밌밍및밑바박밖밗반받발밝밞밟밤밥밧방밭배백밴밸뱀뱁뱃뱄뱅뱉뱌뱍뱐뱝버벅번벋벌벎범법벗벙벚베벡벤벧벨벰벱벳벴벵벼벽변별볍볏볐병볕볘볜보복볶본볼봄봅봇봉봐봔봤봬뵀뵈뵉뵌뵐뵘뵙뵤뵨"
						    +"부북분붇불붉붊붐붑붓붕붙붚붜붤붰붸뷔뷕뷘뷜뷩뷰뷴뷸븀븃븅브븍븐블븜븝븟비빅빈빌빎빔빕빗빙빚빛빠빡빤빨빪빰빱빳빴빵빻빼빽뺀뺄뺌뺍뺏뺐뺑뺘뺙뺨뻐뻑뻔뻗뻘뻠뻣뻤뻥뻬뼁뼈뼉뼘뼙뼛뼜뼝뽀뽁뽄뽈뽐뽑뽕뾔뾰뿅뿌뿍뿐뿔뿜뿟뿡쀼쁑쁘쁜쁠쁨쁩삐삑삔삘삠삡삣삥사삭삯산삳살삵삶삼삽삿샀상샅새색샌샐샘샙샛샜생"
						    +"샤샥샨샬샴샵샷샹섀섄섈섐섕서석섞섟선섣설섦섧섬섭섯섰성섶세섹센셀셈셉셋셌셍셔셕션셜셤셥셧셨셩셰셴셸솅소속솎손솔솖솜솝솟송솥솨솩솬솰솽쇄쇈쇌쇔쇗쇘쇠쇤쇨쇰쇱쇳쇼쇽숀숄숌숍숏숑수숙순숟술숨숩숫숭숯숱숲숴쉈쉐쉑쉔쉘쉠쉥쉬쉭쉰쉴쉼쉽쉿슁슈슉슐슘슛슝스슥슨슬슭슴습슷승시식신싣실싫심십싯싱싶싸싹"
						    +"싻싼쌀쌈쌉쌌쌍쌓쌔쌕쌘쌜쌤쌥쌨쌩썅써썩썬썰썲썸썹썼썽쎄쎈쎌쏀쏘쏙쏜쏟쏠쏢쏨쏩쏭쏴쏵쏸쐈쐐쐤쐬쐰쐴쐼쐽쑈쑤쑥쑨쑬쑴쑵쑹쒀쒔쒜쒸쒼쓩쓰쓱쓴쓸쓺쓿씀씁씌씐씔씜씨씩씬씰씸씹씻씽아악안앉않알앍앎앓암압앗았앙앝앞애액앤앨앰앱앳앴앵야약얀얄얇얌얍얏양얕얗얘얜얠얩어억언얹얻얼얽얾엄업없엇었엉엊엌엎에"
						    +"엑엔엘엠엡엣엥여역엮연열엶엷염엽엾엿였영옅옆옇예옌옐옘옙옛옜오옥온올옭옮옰옳옴옵옷옹옻와왁완왈왐왑왓왔왕왜왝왠왬왯왱외왹왼욀욈욉욋욍요욕욘욜욤욥욧용우욱운울욹욺움웁웃웅워웍원월웜웝웠웡웨웩웬웰웸웹웽위윅윈윌윔윕윗윙유육윤율윰윱윳융윷으윽은을읊음읍읏응읒읓읔읕읖읗의읜읠읨읫이익인일읽읾"
						    +"잃임입잇있잉잊잎자작잔잖잗잘잚잠잡잣잤장잦재잭잰잴잼잽잿쟀쟁쟈쟉쟌쟎쟐쟘쟝쟤쟨쟬저적전절젊점접젓정젖제젝젠젤젬젭젯젱져젼졀졈졉졌졍졔조족존졸졺좀좁좃종좆좇좋좌좍좔좝좟좡좨좼좽죄죈죌죔죕죗죙죠죡죤죵주죽준줄줅줆줌줍줏중줘줬줴쥐쥑쥔쥘쥠쥡쥣쥬쥰쥴쥼즈즉즌즐즘즙즛증지직진짇질짊짐집짓징짖짙"
						    +"짚짜짝짠짢짤짧짬짭짯짰짱째짹짼쨀쨈쨉쨋쨌쨍쨔쨘쨩쩌쩍쩐쩔쩜쩝쩟쩠쩡쩨쩽쪄쪘쪼쪽쫀쫄쫌쫍쫏쫑쫓쫘쫙쫠쫬쫴쬈쬐쬔쬘쬠쬡쭁쭈쭉쭌쭐쭘쭙쭝쭤쭸쭹쮜쮸쯔쯤쯧쯩찌찍찐찔찜찝찡찢찧차착찬찮찰참찹찻찼창찾채책챈챌챔챕챗챘챙챠챤챦챨챰챵처척천철첨첩첫첬청체첵첸첼쳄쳅쳇쳉쳐쳔쳤쳬쳰촁초촉촌촐촘촙촛총촤촨"
						    +"촬촹최쵠쵤쵬쵭쵯쵱쵸춈추축춘출춤춥춧충춰췄췌췐취췬췰췸췹췻췽츄츈츌츔츙츠측츤츨츰츱츳층치칙친칟칠칡침칩칫칭카칵칸칼캄캅캇캉캐캑캔캘캠캡캣캤캥캬캭컁커컥컨컫컬컴컵컷컸컹케켁켄켈켐켑켓켕켜켠켤켬켭켯켰켱켸코콕콘콜콤콥콧콩콰콱콴콸쾀쾅쾌쾡쾨쾰쿄쿠쿡쿤쿨쿰쿱쿳쿵쿼퀀퀄퀑퀘퀭퀴퀵퀸퀼큄큅큇큉큐"
						    +"큔큘큠크큭큰클큼큽킁키킥킨킬킴킵킷킹타탁탄탈탉탐탑탓탔탕태택탠탤탬탭탯탰탱탸턍터턱턴털턺텀텁텃텄텅테텍텐텔템텝텟텡텨텬텼톄톈토톡톤톨톰톱톳통톺톼퇀퇘퇴퇸툇툉툐투툭툰툴툼툽툿퉁퉈퉜퉤튀튁튄튈튐튑튕튜튠튤튬튱트특튼튿틀틂틈틉틋틔틘틜틤틥티틱틴틸팀팁팃팅파팍팎판팔팖팜팝팟팠팡팥패팩팬팰팸팹"
						    +"팻팼팽퍄퍅퍼퍽펀펄펌펍펏펐펑페펙펜펠펨펩펫펭펴편펼폄폅폈평폐폘폡폣포폭폰폴폼폽폿퐁퐈퐝푀푄표푠푤푭푯푸푹푼푿풀풂품풉풋풍풔풩퓌퓐퓔퓜퓟퓨퓬퓰퓸퓻퓽프픈플픔픕픗피픽핀필핌핍핏핑하학한할핥함합핫항해핵핸핼햄햅햇했행햐향허헉헌헐헒험헙헛헝헤헥헨헬헴헵헷헹혀혁현혈혐협혓혔형혜혠혤혭호혹혼홀홅"
						    +"홈홉홋홍홑화확환활홧황홰홱홴횃횅회획횐횔횝횟횡효횬횰횹횻후훅훈훌훑훔훗훙훠훤훨훰훵훼훽휀휄휑휘휙휜휠휨휩휫휭휴휵휸휼흄흇흉흐흑흔흖흗흘흙흠흡흣흥흩희흰흴흼흽힁히힉힌힐힘힙힛힝ㄱㄲㄴㄷㄸㄹㅁㅂㅃㅅㅆㅇㅈㅉㅊㅋㅌㅍㅎㅏㅑㅓㅕㅗㅛㅜㅠㅡㅣ"
						    +"ァィゥェォアイウエオカキクケコガギグゲゴサシスセソザジズゼゾタチッツテトダヂヅデドナニヌネノハヒフヘホバビブベボパピプペポマミムメモャヤュユョヨラリルレロヮワヰヱヲンヴヵヶぁぃぅぇぉあいうえおかきくけこがぎぐげごさしすせそざじずぜぞたちっつてとだぢづでどなにぬねのはひふへほばびぶべぼ"
						    +"ぱぴぷぺぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんзº　"
						    +"！'，．／：；？＾＿｀｜￣、。·‥…¨〃­―∥＼～´?ˇ˘˝˚˙¸˛¡¿ː＂（）［］｛｝‘’“”〔〕〈〉《》「」『』【】+－＜=＞±×÷≠≤≥∞∴♂♀∠⊥⌒∂∇≡≒≪≫√∽∝∵∫∬∈∋⊆⊇⊂⊃∪∩∧∨￢⇒⇔∀∃∮∑∏＄％￦Ｆ′″"
						    +"℃Å￠￡￥¤℉‰㎕㎖㎗ℓ㎘㏄㎣㎤㎥㎦㎙㎚㎛㎜㎝㎞㎟㎠㎡㎢㏊㎍㎎㎏㏏㎈㎉㏈㎧㎨㎰㎱㎳㎴㎵㎶㎷㎸㎹㎀㎁㎂㎃㎄㎺㎻㎼㎽㎾㎿㎐㎑㎒㎓㎔Ω㏀㏁㎊㎋㎌㏖㏅㎭㎭㎮㎯㏛㎩㎪㎫㎬㏝㏐㏓㏃㏉㏜㏆"
						    +"＃＆＊＠■※☆★○●◎◇◆□■△▲▽▼→←↔〓◁◀▷▶♤♠♡♥♧♣⊙◈▣◐◑▒▤▥▨▧▦▩♨☏☎☜☞■†‡↕↗↙↖↘♭♩♪♬㉿㈜№㏇™㏂㏘℡■■─│┌┐┘└├┬┤┴┼━┃┏┓┛┗┣┳┫┻╋┠┯┨┷┿┝┰┥┸╂┒┑┚┙┖┕┎┍┞┟┡┢┦┧┩┪┭┮┱┲┵┶┹┺┽┾╀╁╃╄╅╆╇╈╉╊"
						    +"㉠㉡㉢㉣㉤㉥㉦㉧㉨㉩㉪㉫㉬㉭㉮㉯㉰㉱㉲㉳㉴㉵㉶㉷㉸㉹㉺㉻㈀㈁㈂㈃㈄㈅㈆㈇㈈㈉㈊㈋㈌㈍㈎㈏㈐㈑㈒㈓㈔㈕㈖㈗㈘㈙㈚㈛ⓐⓑⓒⓓⓔⓕⓖⓗⓘⓙⓚⓛⓜⓝⓞⓟⓠⓡⓢⓣⓤⓥⓦⓧⓨⓩ①②③④⑤⑥⑦⑧⑨⑩⑪⑫⑬⑭⑮⒜⒝⒞⒟⒠⒡⒢⒣⒤⒥⒦⒧⒨⒩⒪⒫⒬⒭⒮⒯⒰⒱⒲⒳⑻⒵⑴⑵⑶⑷⑸⑹⑺⒴⑼⑽⑾⑿⒀⒁⒂"
						    +"ⅰⅱⅲⅳⅴⅵⅶⅷⅸⅹⅠⅡⅢⅣⅤⅥⅦⅧⅨⅩ½⅔⅔¼¾⅛⅜⅝⅞¹²³⁴ⁿ₁₂₃₄ㄱㄲㄳㄴㄵㄶㄷㄸㄹㄺㄻㄼㄽㄾㄿㅀㅁㅂㅃㅄㅅㅆㅇㅈㅉㅊㅋㅌㅍㅎㅏㅐㅑㅒㅓㅔㅕㅖㅗㅘㅙㅚㅛㅜㅝㅞㅟㅠㅡㅢㅣㅥㅦㅧㅨㅩㅪㅫㅬㅭㅮㅯㅰㅱㅲㅳㅴㅵㅶㅷㅸㅹㅺㅻㅼㅽㅾㅿㆀㆁㆂㆃㆄㆅㆆㆇㆈㆉㆊㆋㆌㆍㆎ"
						    +"ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚㅍΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩαβγδεζηθικλμνξοπρστυφχψω";
						  function check_str(s)
						  {
						    var u, c, p, allow = "", not = "";
						    for(var i=0;i<s.length;i++)
						    {
						      u = s.charCodeAt(i); // Unicode
						      c = s.charAt(i); // Char
						      if ((u>127 && Allow_Chars.indexOf(c) < 0) || p + c === '__') {
						        not+= c;
						      } else {
						        allow+= c;
						      }
						      p = c;
						    }
						    return {
						      "error":(not.length?1:0)
						      ,"not":not
						      ,"allow":allow
						    };
						  }
						
						  var emoney_max =  0 ;
						  function isPossibleSubmit(fm)
						  {
						    // var means = document.getElementsByName('means_type');
						    // var means_pass = document.getElementsByName('means');
						    var msg_mean = '';
						    var deliPoli = fm.deliPoli;
						
						    // KM-2118 : cs
						
						    // 보내는 분 이름 체킹
						    var $inputOrderName = $('input[name=orderer_name]');
						    if (typeof $inputOrderName.val() !== 'undefined') {
						      if (! preventSpecialChars($inputOrderName, 'result')) {
						        $inputOrderName.focus();
						        return false;
						      }
						
						      var f_order_name_chk = check_str($inputOrderName.val());
						      if ( f_order_name_chk.error ) {
						        _oldAlert("보내는 분에 사용할 수 없는 문자가\n포함되어 제거되었습니다.\n다시 확인 후 결제를 진행해주세요.\n\n" + f_order_name_chk.not);
						        $inputOrderName.val(f_order_name_chk.allow);
						        $inputOrderName.focus();
						        return false;
						      }
						    }
						
						
						    var $inputEmail = $('#email');
						    if (typeof $inputEmail.val() !== 'undefined') {
						      var f_email_chk = check_str($inputEmail.val());
						      if ( f_email_chk.error ) {
						        _oldAlert("이메일에 사용할 수 없는 문자가\n포함되어 제거되었습니다.\n다시 확인 후 결제를 진행해주세요.\n\n" + f_email_chk.not);
						        $inputEmail.val(f_email_chk.allow);
						        $inputEmail.focus();
						        return false;
						      }
						    }
						    // 2018-07-19 장차석 : PD-617 샛별 only 상품 주문시 주문서 에러메세지 노출 수정
						    if(star_only('submit') === false){
						      validateFocusAction('#divAddressWrapper');
						      return false;
						    }
						
						    // 배송지 체크
						    // TODO : 새로 변경된 입력폼으로 validation 할것
						    var isAddrErr = false, addrErrMsg = '';
						    var $divDestination = $('#dataDelivery');
						    var $divReception = $('#divReception');
						    if($('#addressBookNo').val() === '') {
						      isAddrErr = true;
						      addrErrMsg = '배송지를 입력해주세요.';
						      $divDestination.addClass('invalid');
						    }
						
						    if(window._addrData !== '') {
						      var addrData = parseJSON(window._addrData);
						
						      if (addrData.name.trim() === '' || addrData.mobile.trim() === '') {
						        _oldAlert('받으실 분 정보를 입력해 주세요.');
						        $divReception.addClass('invalid');
						        window.scrollTo(0, $divDestination.offset().top);
						        return false;
						      }
						
						      var f_receiver_name_chk = check_str(addrData.name);
						      if (!chkSpecialChars(addrData.name) || f_receiver_name_chk.error ) {
						        _oldAlert('받는 분 이름에 사용할 수 없는 문자가 있습니다. 확인 후 다시 결제해주세요.');
						        window.scrollTo(0, $divDestination.offset().top);
						        return false;
						      }
						
						      var f_sub_addr_chk = check_str(addrData.address_sub);
						      if (f_sub_addr_chk.error ) {
						        _oldAlert('상세 주소에 사용할 수 없는 문자가 있습니다. 확인 후 다시 결제해주세요.');
						        window.scrollTo(0, $divDestination.offset().top);
						        return false;
						      }
						
						      var $spanMeanType = $('#meanType');
						      if (addrData.delivery_type === 'direct'
						        && $spanMeanType.css('display') !== 'none'
						        && $spanMeanType.text() === '받으실 장소를 입력해 주세요') {
						        isAddrErr = true;
						        addrErrMsg = '받으실 장소를 입력해주세요.';
						        $divReception.addClass('invalid');
						      } else if(addrData.delivery_type === 'disable') {
						        isAddrErr = true;
						        addrErrMsg = '안타깝지만 배송 불가 지역입니다. 배송지를 변경해주세요.';
						        $divDestination.addClass('invalid');
						      }
						    }
						
						    if(isAddrErr) {
						      alert(addrErrMsg);
						      validateFocusAction('#divAddressWrapper');
						      return false;
						    }
						
						    if(parseInt(fm.settlement_price.value) < 100 && parseInt(fm.settlement_price.value) > 0)
						    {
						      alert('최소 결제금액은 100원 이상입니다.');
						      validateFocusAction('#titFocusMethod');
						      return false;
						    }
						
						    if (typeof(fm.settlekind)=="undefined"){
						      alert("결제수단이 활성화가 안 되었습니다. 관리자에게 문의하세요.");
						      return false;
						    }
						
						    var obj = document.getElementsByName('settlekind');
						    if (obj[0].getAttribute('required') == undefined){
						      obj[0].setAttribute('required', '');
						      obj[0].setAttribute('label', '결제수단');
						    }
						
						    var obj = document.getElementsByName('save_mode');
						    if (obj.length > 0 && obj[0].getAttribute('required') == undefined){
						      obj[0].setAttribute('required', '');
						      obj[0].setAttribute('label', '적립 위치');
						    }
						
						    var save_mode = "";
						
						    for(var i=0;i<obj.length;i++){
						      if(obj[i].checked){
						        save_mode = obj[i].value;
						      }
						    }
						
						    if(check_naverNcashUseAble() === false){
						      return false;
						    }
						
						    if( (save_mode == 'ncash' || save_mode == 'both') && document.getElementById('reqTxId').value == ''){
						      alert("네이버 마일리지 적립 시 네이버 마일리지 적립 및 사용 버튼을 클릭해주세요.");
						      return false;
						    }
						
						    // KM-725 주문서 1차 개편 - 카드결제인경우
						    var cardCheckResult = true;
						    $('[name=settlekind]').each(function(){
						      if($(this).is(':checked')){
						        if($(this).val() === 'c' && $(this).attr('id') != 'settlekind_option_sel'){
						          if(!cardSelect.updateResultCode()) cardCheckResult  = false;
						        }
						      }
						    });
						    if(!cardCheckResult) return false;
						    // // KM-725 주문서 1차 개편 - 카드결제인경우
						
						    // 2017-10-24 장차석 : 동의추가
						    if( $('input[name=ordAgree]').is(':checked') === false ){
						      alert('결제를 진행을 위해 결제 진행 필수 동의에 체크해주세요.');
						      validateFocusAction('#titFocusAgree');
						      $('input[name=ordAgree]').focus();
						      return false;
						    }
						
						    var packageType = fm.package_type.value;
						    if (packageType === 'PERSONAL') {
						      var answer = confirm('포장 방법을 개인 보냉 박스로 선택하셨습니다. ' +
						      '개인 보냉 박스 이용 유의사항 및 책임 범위를 확인했으며 주문을 계속합니다.');
						      if (!answer) {
						        return false;
						      }
						    }
						
						    var usingPointValue = Number( $('[name=using_point]').val().replace(/[^0-9]/g,'') );
						    var pointAllowed = $('[name=point_allowed]').val() === "false" ? false : true;
						
						    if(usingPointValue !== 0 && !pointAllowed) {
						      _oldAlert('적립금을 사용할 수 없습니다.');
						      return false;
						    }
						
						    // // 2017-10-24 장차석 : 동의추가
						
						    // 컬리패스 정기결제는 배송관련 얼럿 보여주지 않음
						    $("input[name='undeliver_way']").each(function(){
						      var i = 0;
						      if ( $(this).prop("checked")){
						        i++;
						        if(i <= 0){
						          alert('미출시 조치방법을 선택해주세요');
						          return false;
						        }
						      }
						    });
						
						    // 냉동상품 포장 없는 경우 -1 값 전달
						    // if( $('[name=isFrozenPack]').val() === '0' ){
						    //   $('[name=frozen_product_packing_option]').val('-1');
						    // }
						    $('[name=frozen_product_packing_option]').val('-1');
						
						    var paymentMethodValue = null;
						    var settlekindValue = null;
						
						    var settleLen = document.getElementsByName("settlekind").length;
						    for(var i = 0; i < settleLen; i++){
						      if (document.getElementsByName("settlekind")[i].checked) {
						        settlekindValue = document.getElementsByName("settlekind")[i].value;
						      }
						    }
						    switch(settlekindValue){
						      case 'c' : // 결제하기 성공 전송(결제완료)
						        paymentMethodValue = 'toss-payments';
						        break;
						      case 'h' :
						        paymentMethodValue = 'danal';
						        break;
						      case 's' :
						        paymentMethodValue = 'smile-pay';
						        break;
						      case 't' :
						        paymentMethodValue = 'payco';
						        break;
						      case 'n' :
						        paymentMethodValue = 'naver-pay';
						        break;
						      default :
						        paymentMethodValue = settlekindValue; // 'toss', 'chai' 는 value 그대로 전달
						        break;
						    }
						
						    if( Number( $('#paper_settlement').text().replace(/[^0-9]/g,'') ) === 0 ){
						      if(usingPointValue > 0){
						        paymentMethodValue = 'discount';
						      }else{
						        paymentMethodValue = 'discount';
						      }
						    }
						    $('[name=payment_method]').val(paymentMethodValue)
						    $('[name=using_point]').val( usingPointValue );
						    return chkForm(fm);
						  }
						
						  function checkUsablePackagingType(form) {
						    var errorMessage = '선택하신 포장 방법으로 주문할 수 없습니다.\n' +
						      '종이 포장재로 포장 방법을 변경하거나 주문서를 새로 고침 후 다시 시도해 주세요.';
						    var $packageTypeOptionsArea = $('#package-method');
						    var selectPackageType = form.package_type.value;
						    if(selectPackageType === 'DEFAULT') {
						      form.submit();
						      return;
						    }
						
						    kurlyApi({
						      method: 'get',
						      url: 'reusable-package/v1/reusable-package/orders/default-package-type'
						    })
						    .then(function(response) {
						      var availablePackagingType = response.data.data.available_packaging_type;
						      var kurlyBag = availablePackagingType.kurly_bag;
						      var personalBag = availablePackagingType.personal_bag;
						
						      if((selectPackageType === 'PERSONAL' && !personalBag) ||
						          (selectPackageType === 'KURLY' && !kurlyBag)) {
						        alert(errorMessage);
						        window.scrollTo(0, $packageTypeOptionsArea.offset().top);
						        return false;
						      }
						      form.submit();
						    }).catch(function(error) {
						      alert(errorMessage);
						    });
						  }
						
						  function validateOrderForm(fm) {
						    var isOk = isPossibleSubmit(fm);
						    if(!isOk) {
						      return false;
						    }
						
						    var hasKurlyPurpleBag = document.getElementById('package_benefit_apply').value;
						    if(hasKurlyPurpleBag === 'true') {
						      kurlyApi({
						        method: 'get',
						        url: '/reusable-package/v1/reusable-package/orders/kurly-bag/ability',
						      }).then(function(response) {
						        var kurlyBagPurchasable = response.data.data;
						        if (!kurlyBagPurchasable) {
						          _oldAlert('컬리 퍼플 박스는 화이트 등급 이상인 샛별 배송(수도권)지역 주문 고객만 구매가 가능합니다. 제외 후 다시 주문을 시도해주세요.');
						          window.history.go(-1);
						          return;
						        }
						        checkUsablePackagingType(fm);
						      })
						      .catch(function(err) {
						        _oldAalert('컬리 퍼플 박스는 화이트 등급 이상인 샛별 배송(수도권)지역 주문 고객만 구매가 가능합니다. 제외 후 다시 주문을 시도해주세요.');
						        window.history.go(-1);
						        return;
						      });
						      return false;
						    }
						    checkUsablePackagingType(fm);
						    return false;
						  }
						
						  function input_escrow(obj,val) {
						    obj.form.escrow.value = val;
						    if (typeof(egg_required) == 'function') egg_required();
						    if (typeof(cash_required) == 'function') cash_required();
						  }
						  // 일반결제 옵션
						  function option_pay_standard(type)
						  {
						    var f = document.frmOrder;
						    f.settlekind_option.value = type;
						  }
						  function popup_zipcode(form)
						  {
						    window.open("../proc/popup_zipcode.php?form="+form,"","width=400,height=500");
						  }
						
						  function cutting(emoney)
						  {
						    var chk_emoney = new String(emoney);
						    reg = /()$/g;
						    if (emoney && !chk_emoney.match(reg)){
						      emoney = Math.floor(emoney/1) * 1;
						    }
						    $('.number_only').on("keyup", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") )});
						
						    return emoney;
						  }
						  function chk_emoney(obj)
						  {
						    var form = document.frmOrder;
						    var my_emoney = 0;
						    var max = '0';
						    var min = '0';
						    var hold = '0';
						    var limit = '';
						
						    var delivery	= uncomma(document.getElementById('paper_delivery').innerHTML);
						    var goodsprice = uncomma(document.getElementById('paper_goodsprice').innerHTML);
						    var erangeprice = goodsprice + delivery;
						    var special_discount_amount= (_ID('special_discount_amount')) ? uncomma(_ID('special_discount_amount').innerHTML) : 0;
						    var max_base = erangeprice - uncomma(document.getElementsByName('coupon')[0].value) - special_discount_amount;
						    max_base		= max_base > 0 ? max_base : 0;
						    var coupon = coupon_emoney = 0;
						    if( form.coupon ){
						      coupon = uncomma(form.coupon.value);
						    }
						    if( form.coupon_emoney ){
						      coupon_emoney = uncomma(form.coupon_emoney.value);
						    }
						    max = getDcprice(max_base,max,1);
						    min = parseInt(min);
						
						    if (max > max_base)  max = max_base;
						    if( _ID('print_emoney_max') && _ID('print_emoney_max').innerHTML != comma(max)  )_ID('print_emoney_max').innerHTML = comma(max);
						
						    var emoney = uncomma(obj.value);
						
						    if (emoney>my_emoney){
						      if(my_emoney < 0){
						        emoney = 0;
						      }else{
						        emoney = my_emoney;
						      }
						    }
						
						    // 중복 사용 체크
						    var dup = true;
						    if (my_emoney > 0 && emoney > 0 && (parseInt(coupon) > 0  || parseInt(coupon_emoney) > 0 ) && !dup ) {
						      if($('.emoney_chkbox').hasClass('checked')){
						        emoney = 0;
						        $('.emoney_chkbox ').trigger('click');
						        alert('적립금과 쿠폰 사용이 중복적용되지 않습니다.');
						      }else{
						        emoney = 0;
						        alert('적립금과 쿠폰 사용이 중복적용되지 않습니다.');
						      }
						    }
						
						    if(my_emoney > 0 && emoney > 0 && limit > goodsprice){
						      alert("상품 주문 합계액이 "+ comma(limit) + "원 이상 일 경우 사용하실 수 있습니다.");
						      emoney = 0;
						    }
						    if(my_emoney > 0 && emoney > 0 && my_emoney < hold){
						      alert("보유적립금이 "+ comma(hold) + "원 이상 일 경우에만 사용하실 수 있습니다.");
						      emoney = 0;
						    }
						    if (min && emoney > 0 && emoney < min){
						      alert("적립금은 " + comma(min) + "원 부터 " + comma(max) + "원 까지만 사용이 가능합니다");
						      emoney = 0;
						    } else if (max && emoney > max && emoney > 0){
						      if(emoney_max < min){
						        alert("주문 상품 금액이 최소 사용 적립금 " + comma(min) + "원 보다  작습니다.");
						        emoney = 0;
						      }else{
						        alert("적립금은 " + comma(min) + "원 부터 " + comma(max) + "원 까지만 사용이 가능합니다");
						        emoney = max;
						      }
						    }
						
						    obj.value = comma(cutting(emoney));
						    // calcu_settle();
						  }
						
						    var cntCall = 0;
						    var isCouponCheck = false; // KQA-4046 사용가능 쿠폰 체크
						    function calcu_settle()
						    {
						      var dc=0;
						      var special_discount_amount = 0;
						      var coupon = settleprice = 0;
						      var goodsprice	= uncomma(document.getElementById('paper_goodsprice').innerHTML);
						      var delivery	= uncomma(document.getElementById('paper_delivery').innerHTML);
						      if(_ID('special_discount_amount')) special_discount_amount = uncomma(_ID('special_discount_amount').innerHTML);
						      var emoney = (document.frmOrder.emoney) ? uncomma(document.frmOrder.emoney.value) : 0;
						
						      if (document.frmOrder.coupon){
						        // PD-781 장차석 : 적립금 + 무료배송쿠폰처리
						        coupon =  uncomma(document.getElementById('apr_coupon_data').innerHTML);
						        if (coupon >= (goodsprice + delivery - dc - special_discount_amount)) coupon = goodsprice + delivery - dc - special_discount_amount;
						
						        if (goodsprice + delivery - dc - coupon - special_discount_amount - emoney  < 0){
						          emoney = goodsprice + delivery - dc - coupon - special_discount_amount;
						          document.frmOrder.emoney.value = comma(cutting(emoney));
						        }
						        dc += coupon + emoney;
						        // TODO : KM-3578 쿠폰 사용 금액 수정시 사은 품 정보 다시 불러오게 하기
						        // 기존  window.sessionStorage값이랑 다르면 저장하고 이벤트 호출해서 알려주기
						        var prevCouponAmount = parseInt(window.sessionStorage.getItem('order.couponAmount'), 10) || 0;
						        var prevPointAmount = parseInt(window.sessionStorage.getItem('order.pointAmount'), 10) || 0;
						        var prevDeliveryFeeAmount = parseInt(window.sessionStorage.getItem('order.deliveryFeeAmount'), 10)
						          || parseInt(window.sessionStorage.getItem('cart.deliveryFee'), 10)  || 0;
						
						        if (coupon !== prevCouponAmount || emoney !== prevPointAmount || delivery !== prevDeliveryFeeAmount) {
						          window.sessionStorage.setItem('order.couponAmount', coupon);
						          window.sessionStorage.setItem('order.pointAmount', emoney);
						          window.sessionStorage.setItem('order.deliveryFeeAmount', delivery);
						          document.dispatchEvent(new Event('checkGifts'));
						        }
						        // end
						      }
						      if(document.frmOrder.free_delivery.value == 1) {
						        dc -= delivery_default; // 배송비 무료쿠폰 사용시 그 금액을 제거함.
						        if(dc < 0) dc = 0;
						      }
						      var settlement = (goodsprice + delivery - dc - special_discount_amount);
						      var saleAll = (dc + special_discount_amount);
						
						
						          settlement += calcu_eggFee(settlement); // 전자보증보험 발급수수료 계산
						          document.getElementById('paper_settlement').innerHTML = (comma(settlement));
						          document.getElementById('paper_sale').innerHTML = ("- "+comma(saleAll));
						
						          document.frmOrder.settlement_price.value = settlement;
						
						          if(uncomma(document.frmOrder.emoney.value) == 0
						            || document.frmOrder.emoney.value == ''){
						            $('#paper_reserves').text('0 원');
						          }else if(uncomma(document.frmOrder.emoney.value) > 0){
						            $('#paper_reserves').text('- '
						              + comma(onlyNum(document.frmOrder.emoney.value))
						              +' 원');
						          }
						
						          var origin_settlement = settlement + uncomma(document.frmOrder.emoney.value);
						          if(emoney <= 0 || !0 ){
						          $('.emoney_chkbox').removeClass('checked');
						        }
						          $(document.frmOrder.emoney).on('blur', function () {
						            if(uncomma(document.frmOrder.emoney.value) >= (origin_settlement)){
						              $('.emoney_chkbox').addClass('checked');
						            }else{
						              if(origin_settlement >= uncomma(document.frmOrder.emoney.value) && uncomma(document.frmOrder.emoney.value)  == 0){
						                $('.emoney_chkbox').addClass('checked');
						              }else{
						                $('.emoney_chkbox').removeClass('checked');
						              }
						            }
						          });
						
						          // 배송비
						          signUpdate(delivery, 'delivery');
						
						          // 쿠폰
						          signUpdate(coupon, 'coupon');
						
						          // 상품할인
						          signUpdate(special_discount_amount, 'discount');
						
						          // 컬리러버스 - 사용자 등급가져옴 : 과거에 사용했던것으로 이벤트성 적립금 적용시 해당 포인트 적용 노출 되도록 처리
						          var pointBenefitValue = '5';
						
						          // KM-3159 cs : 적립금 제외 - 적립금 노출 방식 변경
						          cntCall++;
						
						          kurlyApi({
						            method: 'post',
						            url: '/v3/checkout/calculate-price?_t=' + window.webStatus.timestamp + '&echo_text=' + cntCall,
						            data: {
						              order_method: orderMethod,
						              using_point: document.frmOrder.using_point.value !== '' ? onlyNum(document.frmOrder.using_point.value) : 0,
						              using_coupon_code: document.frmOrder.using_coupon_code ? onlyNum(document.frmOrder.using_coupon_code.value) : null,
						              delivery_type: form.deliPoli.value ? 'indirect' : 'direct'
						            }
						          }).then(function (res) {
						            if (res.status === 200) {
						              var echoText = res.data.meta.echo_text;
						              var data = res.data.data;
						              var arrUnavailableCoupons = data.unavailable_coupons ? data.unavailable_coupons : [];
						              if (parseInt(echoText, 10) === cntCall) {
						                // 적립율적용
						                if (data.charging_point_ratio > 0 || pointBenefitValue > 0) {
						                  $('.reserve').show().find('.ratio').text(pointBenefitValue > data.charging_point_ratio ? pointBenefitValue : data.charging_point_ratio);
						                  $('#expectAmount').text(comma(data.expected_point));
						                }
						
						                // 최초 결제 금액 내역 내용 추가
						                // 주문금액
						                $('#productsTotalPrice').text( comma(data.products_total_price - data.products_discounting_price) );
						                // 상품금액
						                $('#paper_goodsprice').text( comma(data.products_total_price) );
						                // 상품할인금액
						                $('#special_discount_amount').text( comma(data.products_discounting_price) );
						                signUpdate(data.products_discounting_price, 'discount');
						                $('#paper_sale').text( data.products_discounting_price );
						                // 배송비
						                $('#paper_delivery').text( comma(data.delivery_fee) );
						                // 배송비 업데이트
						                getDelivery(); // 컬리패스인경우 배송비 업데이트 시간이 지연되면, 정상 노출 되지 않아 한번더 업데이트 하도록 수정
						                signUpdate(data.delivery_fee, 'delivery');
						                //$('#paper_delivery_msg1').text( comma(data.delivery_fee) );
						                // 쿠폰 할인 금액
						                //$('#apr_coupon_data').text( comma(data.coupon_discounting_price) );
						                signUpdate(data.coupon_discounting_price, 'coupon');
						
						                // 최종결제금액
						                $('#paper_settlement').text( comma(data.calculated_total_price) );
						
						                // 카드 정보 업데이트
						                cardUpdate(data.calculated_total_price);
						
						                /**
						                * KQA-4046 사용가능 쿠폰 체크
						                * API : /v3/checkout/calculate-price 에서 사용불가 쿠폰을 따로 전달해줌.
						                * 사용불가 쿠폰이 해당 데이터의 키값으로 옴. unavailable_coupons: [] // 값이 없더라도 array.
						                * 해당 값을 변수화 해서 인자값으로 전달 : arrUnavailableCoupons
						                * 쿠폰목록 업데이트 : 최초 로딩시 한번만.
						                * getCouponList() 처리는 pc_coupon_receiver.js 에 있음.
						                */
						                if(!isCouponCheck && window.webStatus.isSession){
						                  getCouponList(delivery_coupon_na, arrUnavailableCoupons);
						                  isCouponCheck = true;
						                }
						              }
						            }
						          }.bind(this)).catch(function (e) {
						            console.error(e)
						          });
						        }
						
						        function signUpdate(num, type){
						          var $target = null;
						          if(type === 'coupon'){
						            $target = $('.coupon_area .pm_sign');
						          }
						          if(type === 'discount'){
						            $target = $('.sales_area .pm_sign');
						          }
						          if(type === 'delivery'){
						            $target = $('.delivery_area .pm_sign');
						          }
						
						          if(num === 0){
						            $target.hide();
						          }else{
						            $target.show();
						          }
						
						          if(type === 'delivery'){
						            if($('#paper_delivery2').css('display') != 'none'){
						              if(parseInt($('#paper_delivery2').text()) != 0){
						                $target.show();
						              }
						            }
						          }
						        }
						
						        var isFirstCardCheck = false;
						        function cardUpdate(settlement){
						          // KM-725 주문서 1차 개편 - settlement 값이 바뀔때마다 업데이트됨 + 결제수단에 따라 결제 진행 필수 동의항목이 변경됨.
						          $('#pgTerms').hide();
						          if(settlement != 0){
						            $('[name=settlekind]').each(function(){
						              if($(this).is(':checked')){
						                if($(this).val() === 'c' || $(this).val() === 'cb'){
						                  $('#pgTerms').show();
						                }
						              }
						            });
						          }
						
						          /**
						           * settlement: 결제 금액에 따라 카드의 할부등이 영향을 받기 때문에 그때그때 업데이트 진행
						           * isFirstCardCheck: 상관없이 최초 1회 호출 필요.(카드목록 및 혜택안내)
						           * 기존에는 신용카드에 selected가 있어 최초 한번은 호출 해줬었으나, 카카오페이로 인해 최초 한번 호출을 변수로 하게끔 변경
						           */
						          if($('[name=settlekind]').val() === 'c' || !isFirstCardCheck){
						            if(!isFirstCardCheck) {
						              isFirstCardCheck = true;
						            }
						            cardSelect.accountNum = settlement;
						            cardSelect.update();
						            if(cardSelect.selectedCard === '61'){
						              cardSelect.onSelected('61', 'card');
						            }
						          }
						          // // KM-725 주문서 1차 개편
						        }
						
						
						        function onlyNum(str){
						          var result = str.trim().replace(/[^\d]/g, '');
						          return parseInt(result, 10)
						        }
						
						        function egg_required()
						        {
						          egg_display();
						          calcu_settle();
						        }
						        function calcu_eggFee(settlement)
						        {
						          egg_display(settlement);
						          var eggFee = 0;
						          if (typeof(document.getElementsByName('eggFee')[0]) != "undefined"){
						            var feerate = (0.535 / 100);
						            if (document.getElementsByName('eggFee')[0].disabled == false) eggFee = parseInt(settlement * feerate);
						            document.getElementsByName('eggFee')[0].value = eggFee;
						          }
						          if (_ID('paper_eggFee') != null) _ID('paper_eggFee').innerHTML = comma(eggFee);
						          if (_ID('infor_eggFee') != null){
						            _ID('infor_eggFee').innerHTML = '<b>' + comma(eggFee) + '</b> 원';
						            if (eggFee) _ID('infor_eggFee').innerHTML += ' (총 결제금액에 포함되었습니다.)';
						          }
						          return eggFee;
						        }
						        function egg_display(settlement)
						        {
						          var min = parseInt('0');
						          var display = 'block';
						          if (_ID('egg') == null) return;
						          if (typeof(settlement) != "undefined"){
						            if (settlement < min && typeof(document.getElementsByName('eggIssue')[0]) != "undefined") display = 'none';
						            else if (settlement <= 0) display = 'none';
						            else if (_ID('egg').style.display != 'none') return;
						          }
						          if (display != 'none'){
						            var obj = document.getElementsByName('settlekind');
						            for (var i = 0; i < obj.length; i++){
						              if (obj[i].checked != true) continue;
						              var settlekind = obj[i];
						              break;
						            }
						            if (settlekind == null) display = 'none';
						            else if (settlekind.value == 'h') display = 'none';
						            else if (document.getElementsByName('escrow')[0].value == 'Y') display = 'none';
						            else if (typeof(document.getElementsByName('eggIssue')[0]) != "undefined"){
						              if (settlekind.value != 'a') display = 'none';
						              else if(typeof(settlement) == "undefined"){
						                settlement = uncomma(_ID('paper_settlement').innerHTML);
						                if (typeof(document.getElementsByName('eggFee')[0]) != "undefined") settlement -= document.getElementsByName('eggFee')[0].value;
						                if (settlement < min) display = 'none';
						              }
						            }
						          }
						          if (_ID('egg').style.display == display && display =='none' && settlekind.value != 't') return;
						          _ID('egg').style.display = display;
						
						          items = new Array();
						          items.push( {name : "eggIssue", label : "전자보증보험 발급여부", msgR : ""} );
						          items.push( {name : "eggBirthYear", label : "생년월일(년)", msgR : "전자보증보험을 발급받으시려면, 생년월일(년)을 입력하셔야 결제가 가능합니다."} );
						          items.push( {name : "eggBirthMon", label : "생년월일(월)", msgR : "전자보증보험을 발급받으시려면, 생년월일(월)을 입력하셔야 결제가 가능합니다."} );
						          items.push( {name : "eggBirthDay", label : "생년월일(일)", msgR : "전자보증보험을 발급받으시려면, 생년월일(일)을 입력하셔야 결제가 가능합니다."} );
						          items.push( {name : "eggSex", label : "성별", msgR : "전자보증보험을 발급받으시려면, 성별을 입력하셔야 결제가 가능합니다."} );
						          items.push( {name : "eggAgree", label : "개인정보 이용동의", msgR : "전자보증보험을 발급받으시려면, 개인정보 이용동의가 필요합니다."} );
						          items.push( {name : "eggFee", label : "발급수수료", msgR : ""} );
						          for (var i = 0; i < items.length; i++){
						            var obj = document.getElementsByName(items[i].name);
						            if (display == 'block' && items[i].name != 'eggIssue' && typeof(document.getElementsByName('eggIssue')[0]) != "undefined")
						              state = (document.getElementsByName('eggIssue')[0].checked ? 'block' : 'none');
						            else state = display;
						            for (var j = 0; j < obj.length; j++){
						              if (state == 'block'){
						                obj[j].setAttribute('required', '');
						                obj[j].setAttribute('label', items[i].label);
						                obj[j].setAttribute('msgR', items[i].msgR);
						                obj[j].disabled = false;
						              }
						              else {
						                obj[j].removeAttribute('required');
						                obj[j].removeAttribute('label');
						                obj[j].removeAttribute('msgR');
						                obj[j].disabled = true;
						              }
						            }
						          }
						        }
						
						        var delivery_fee = 0;
						        var delivery_coupon_na = 0;
						        var delivery_default = 0;       //배송비 최초값을 한번 저장함( dc -= delivery_default;)
						
						        function getAgreement() {
						          jQuery.ajax({
						            url: "/shop/service/private.php",
						            cache: false,
						            dataType: "html",
						            type: "GET",
						            contentType: 'text/html; charset=euc-kr',
						            success: function(data) {
						              jQuery("#agreement_box").html( jQuery(data).find('.hundred'));
						            }
						          });
						        }
						
						        function getDelivery(is_first){
						          var form = document.frmOrder;
						          var obj = form.deliPoli;
						          var coupon = 0;
						          var emoney = 0;
						          var free_delivery = 0; //무료배송 여부
						          var deliPoli = 0;
						          deliPoli = obj.value;
						
						          if( form.coupon ) coupon = form.coupon.value;
						          if( form.emoney ) emoney = form.using_point.value;
						          var zipcode = form['zipcode[]'][0].value + '-' + form['zipcode[]'][1].value;
						          var mode = 'order';
						          var road_address = form.road_address.value;
						          var address = form.address.value;
						          var address_sub = form.address_sub.value;
						
						
						          if( form.free_delivery ) free_delivery = form.free_delivery.value; //무료배송 인풋 추가
						
						          //예약배송일 파라미터 추가
						          var is_reserve = '';
						          var $deli_dates = $('#reserve_frm input[name^="deli_date"]');
						          var deli_date_arr = new Array();
						          var deli_date = "";
						          if(is_reserve=="y" && $deli_dates.length){
						            $deli_dates.each(function(index){
						              deli_date_arr.push($(this).val());
						            });
						            deli_date = deli_date_arr.join('|');
						          }
						          //주문 배송 시간 파라미터
						          gd_ajax({
						            url : '../proc/getdelivery.php',
						            type : 'get',
						            param : "zipcode="+zipcode+"&deliPoli="+deliPoli+"&coupon="+coupon+"&emoney="+emoney+"&mode="+mode+"&road_address="+road_address+"&address="+encodeURIComponent(address)+"&address_sub="+encodeURIComponent(address_sub)+"&deli_date="+deli_date+"&free_delivery="+free_delivery,
						            success : function(data) {
						              eval(data);
						
						              if($('[name=free_delivery]').val() === '1' && $('#paper_delivery').text() === '0'){
						                delivery_fee = $('#paper_delivery2').text();
						              }else{
						                delivery_fee = $('#paper_delivery').text();
						              }
						
						              $(function() {
						                if ($('#paper_delivery').text() != '0') {
						                  delivery_coupon_na = 0;
						                } else {
						                  delivery_coupon_na = 1;
						                }
						
						                if(is_first == 'first') {
						                  var deliveryNum = delivery_fee;
						                  deliveryNum = deliveryNum.replace(/[^0-9]/g,'');
						                  if(deliveryNum != 0){
						                    delivery_default = deliveryNum;
						                    $('#paper_delivery2').text(delivery_fee);
						                    $('#paper_delivery2').show();
						                  }else{
						                    $('#paper_delivery').removeClass('screen_out');
						                    $('#paper_delivery2').hide();
						                  }
						                }
						                if($('[name=free_delivery]').val() !== '1'
						                  && $('#paper_delivery').text() == 0
						                  && "" == true
						                  && "6" != '6'
						                ) {
						                  $('#paper_delivery_msg1').hide();
						                  $('#paper_delivery_msg2').show().text('무료 (컬리패스)');
						                  if($('[name=deliveryType]').val() === 'disable'){
						                    $('#paper_delivery_msg2').text('배송불가지역');
						                  }
						                }
						              });
						            }
						          });
						        }
						
						        function del_coupon(){
						          var apply_coupon = document.getElementById('apply_coupon');
						          apply_coupon.innerHTML = '';
						
						          document.frmOrder.coupon.value = '0';
						          document.frmOrder.coupon_emoney.value = '0';
						
						          //무료배송 취소 추가
						          document.frmOrder.free_delivery.value = '0';
						          document.getElementById('free_delivery_coupon_msg').innerHTML = '미적용';
						
						          chk_emoney(document.frmOrder.using_point);
						          getDelivery();
						          calcu_settle();
						
						          var settlekind = document.getElementsByName('settlekind');
						          for(var j=0;j<settlekind.length;j++){
						            settlekind[j].disabled = false;
						          }
						
						          var coupon_typinfo = document.getElementById('coupon_typinfo');
						          coupon_typinfo.style.display = "none";
						        }
						
						        /*** 결제수단 첫번째 객체 자동 선택 ***/
						        window.addEventListener('load', function () {
						          var obj = document.getElementsByName('settlekind');
						          for (var i = 0; i < obj.length; i++){
						            if (obj[i].checked != true) continue;
						            obj[i].click();
						            var idx = i;
						            break;
						          }
						          if (obj[0] && idx == null){ obj[0].checked = true; obj[0].click(); }
						
						
						          $("input[name='order_deli_time']:eq(0)").prop('checked',true); //낮/밤 배송 첫번째 자동선택
						
						          getDelivery('first');
						          getAgreement();
						        }, false);
						
						        function cash_save_use(){
						          var
						            goodsprice = uncomma(document.getElementById('paper_goodsprice')[document.getElementById('paper_goodsprice').innerHTML?"innerHTML":"textContent"]),
						            delivery_price = uncomma(document.getElementById('paper_delivery')[document.getElementById('paper_delivery').innerHTML?"innerHTML":"textContent"]);
						          coupon = document.frmOrder.coupon ? uncomma(document.frmOrder.coupon.value) : 0,
						            emoney = document.frmOrder.using_point ? uncomma(document.frmOrder.using_point.value) : 0,
						            exception_price = uncomma(document.getElementById('exception_price').value),
						            max_ncash_use = (goodsprice + delivery_price) - exception_price - coupon - emoney;
						          var r_save_mode = document.getElementsByName('save_mode');
						          var save_mode = '';
						          for( var i = 0 ; i < r_save_mode.length; i++ ){
						            if(r_save_mode[i].checked){
						              save_mode = r_save_mode[i].value;
						            }
						          }
						          if(check_naverNcashUseAble() === false){
						            return false;
						          }
						          if(save_mode != 'ncash' && save_mode != 'both'){ alert('네이버 마일리지 적립을 선택해주세요.'); return; }
						          var reqTxId = document.getElementById('reqTxId').value;
						          window.open('../proc/naverNcash_use.php?reqTxId='+reqTxId+"&maxUseAmount="+max_ncash_use,'cashPopup','width=496,height=434,status=no,resizeable=no');
						        }
						        function mileage_info() {
						          window.open("http://static.mileage.naver.net/static/20130708/ext/intro.html", "mileageIntroPopup", "width=404, height=412, status=no, resizable=no");
						        }
						        function naver_mileage_initialize(radiobox)
						        {
						          if(document.getElementById('reqTxId').value.trim().length)
						          {
						            if(radiobox.checked && confirm("쇼핑몰 적립금으로 변경하시면 네이버 마일리지의\r\n사용 및 적립이 취소됩니다.\r\n계속하시겠습니까?"))
						            {
						              document.getElementById('reqTxId').value = "";
						              document.getElementById('mileageUseAmount').value = "";
						              document.getElementById('cashUseAmount').value = "";
						              document.getElementById('totalUseAmount').value = "";
						              document.getElementById('baseAccumRate').value = "";
						              document.getElementById('addAccumRate').value = "";
						              document.getElementById('ncash_view').style.display = "none";
						              document.getElementById('save_button').style.display = "block";
						              calcu_settle();
						            }
						            else
						            {
						              var save_mode = document.getElementsByName('save_mode');
						              for(var i=0; i<save_mode.length; i++)
						              {
						                if(/^(ncash|both)$/.test(save_mode[i].value)) save_mode[i].checked = true;
						              }
						            }
						          }
						        }
						
						        function check_naverNcashUseAble()
						        {
						          var settlekindObj = document.getElementsByName('settlekind');
						          var save_modeObj = document.getElementsByName('save_mode');
						          var settlekind = save_mode = mall_save_mode = '';
						
						          for(var i=0; i<settlekindObj.length; i++){
						            if(settlekindObj[i].checked){
						              settlekind = settlekindObj[i].value;
						              break;
						            }
						          }
						          for( var i=0; i<save_modeObj.length; i++){
						            if(save_modeObj[i].checked){
						              save_mode = save_modeObj[i].value;
						            }
						            else {
						              mall_save_mode = save_modeObj[i];
						            }
						          }
						
						          if((save_mode == 'ncash' || save_mode == 'both') && settlekind == 't'){
						            mall_save_mode.checked = true;
						            alert("PAYCO 결제수단은 네이버 마일리지 및 캐쉬 사용이 불가합니다.");
						
						            document.getElementById('reqTxId').value = "";
						            document.getElementById('mileageUseAmount').value = "";
						            document.getElementById('cashUseAmount').value = "";
						            document.getElementById('totalUseAmount').value = "";
						            document.getElementById('baseAccumRate').value = "";
						            document.getElementById('addAccumRate').value = "";
						            document.getElementById('ncash_view').style.display = "none";
						            document.getElementById('save_button').style.display = "block";
						            calcu_settle();
						            return false;
						          }
						        }
						
						//예약배송일 선택
						        function reserve_chg(obj){
						          var is_reserve = obj.value;
						          if(is_reserve == 'y'){
						            $("#reserve_frm input[name^=deli_date]").prop('required',true);
						            $("#reserve_frm").show();
						            $("#order_deli_times").hide();
						            //popupLayer('./deli_calendar.php',890,600);
						          } else {
						            alert("예약배송 불가상품이 있습니다. 즉시배송으로 이용해주세요.");
						          }
						        }
						//상품예약배송일 선택
						        function chk_item_delidate(idx,type){
						          popup('./deli_calendar.php?mode=order_deli_time&idx='+idx+'&isDirect=&type='+type,890,600);
						        }
						        /*** 레이어 팝업창 띄우기 ***/
						        function popupLayer(s,w,h)
						        {
						          if (!w) w = 600;
						          if (!h) h = 400;
						
						          var pixelBorder = 3;
						          var titleHeight = 12;
						          w += pixelBorder * 2;
						          h += pixelBorder * 2 + titleHeight;
						
						          var bodyW = document.body.clientWidth;
						          var bodyH = document.body.clientHeight;
						
						          var posX = (bodyW - w) / 2;
						          var posY = (bodyH - h) / 2;
						
						          /*** 백그라운드 레이어 ***/
						          var obj = document.createElement("div");
						          with (obj.style){
						            position = "absolute";
						            left = 0;
						            top = 0;
						            width = "100%";
						            height = document.body.scrollHeight+'px';
						            backgroundColor = "#000000";
						            filter = "Alpha(Opacity=80)";
						            opacity = "0.5";
						          }
						          obj.id = "objPopupLayerBg";
						          document.body.appendChild(obj);
						
						          /*** 내용프레임 레이어 ***/
						          var obj = document.createElement("div");
						          with (obj.style){
						            position = "absolute";
						            left = posX + document.body.scrollLeft+'px';
						            top = posY + document.body.scrollTop+'px';
						            width = w+'px';
						            height = h+'px';
						            backgroundColor = "#fff";
						            border = "3px solid #000";
						          }
						          obj.id = "objPopupLayer";
						          document.body.appendChild(obj);
						
						          /*** 타이틀바 레이어 ***/
						          var bottom = document.createElement("div");
						          with (bottom.style){
						            position = "absolute";
						            width = (w - pixelBorder * 2)+'px';
						            height = titleHeight+'px';
						            left = 0;
						            top = (h - titleHeight - pixelBorder * 3)+'px';
						            padding = "4px 0 0 0";
						            textAlign = "center";
						            backgroundColor = "#000000";
						            color = "#ffffff";
						            font = "bold 8pt tahoma; letter-spacing:0px";
						
						          }
						
						          // 필수 선택위해 해당 부분 버튼 끄기 부분 주석처리함
						          /*
						          bottom.innerHTML = "<a href='javascript:closeLayer()' class='white'>X close</a>";
						          obj.appendChild(bottom);
						          */
						          bottom.innerHTML = "<b>날짜를 선택하시면 팝업창이 닫힙니다.!</b>";
						          obj.appendChild(bottom);
						          /*** 아이프레임 ***/
						          var ifrm = document.createElement("iframe");
						          with (ifrm.style){
						            width = (w - 6)+'px';
						            height = (h - pixelBorder * 2 - titleHeight - 3)+'px';
						            //border = "3 solid #000000";
						          }
						          ifrm.frameBorder = 0;
						          obj.appendChild(ifrm);
						          ifrm.src = s;
						        }
						        function closeLayer()
						        {
						          _ID('objPopupLayer').parentNode.removeChild( _ID('objPopupLayer') );
						          _ID('objPopupLayerBg').parentNode.removeChild( _ID('objPopupLayerBg') );
						        }
						
						        function handleRadioButton(){
						          if($(this).find('input').attr('name') === 'settlekind'){
						            $(this).parents('table').find(".label_radio").removeClass('checked');
						            $(this).find('[name=settlekind]').prop('checked','checked');
						          }else{
						            $(this).parent().find(".label_radio").removeClass('checked');
						          }
						          $(this).addClass('checked');
						
						          // KM-725 주문서 1차 개편
						          if($('#settlekindCard [name=settlekind]').is(':checked')){
						            $('.card_detail').show();
						          }else{
						            $('.card_detail').hide();
						          }
						        }
						        // 체크박스 이미지처리
						        $(".label_radio").on("click", handleRadioButton);
						
						        // 해피톡
						        $('#happyTalk').on('click',function(e){
						          e.preventDefault();
						          $.ajax({
						            type: "GET",
						            url: apiDomain+'/v1/mypage/asks/confirm/kakao',
						            dataType: 'json',
						            success: function(data) {
						              if(data.data.ok_button_action_url.indexOf('https://api.happytalk.io/') > -1){
						                if(confirm('['+data.data.title+'] '+data.data.message)) window.open(data.data.ok_button_action_url,'_blank');
						              }else{
						                alert(data.data.title+'\n'+data.data.message);
						              }
						            }
						          })
						        });
						
						
						        /**
						         * 2018-07-19 장차석 : PD-617 샛별 only 상품 주문시 주문서 에러메세지 노출 수정
						         * 최초 페이지 유입시 한번실행. 새 배송지 추가 및 기존 배송지 변경시 마다 한번 실행
						         */
						        var starGoods = $.trim($('[name=starGoods]').val()) !== "" ? true : false;
						        var isFirstAlertCheck = false;
						        function star_only(type){
						          var chkDeliPoli = Number($('[name=deliPoli]').val());
						          var chkDeliPoliCount = Number($('[name=starGoodsCount]').val());
						          if(starGoods && chkDeliPoli === 1){
						            starGoods = $('[name=starGoods]').val().split(',');
						            if(chkDeliPoliCount <= 1){
						              starGoods = starGoods[0] +' 상품은 샛별배송 Only 상품으로, 택배배송이 불가능합니다.';
						            }else{
						              starGoods = starGoods[0] +' 외 '+ (chkDeliPoliCount - 1) + '건의 상품은 샛별배송 Only 상품으로, 택배배송이 불가능합니다.';
						            }
						            alert(starGoods);
						            isFirstAlertCheck = true;
						            if(type === 'submit') return false;
						          }else{
						            if(type === 'submit') return true;
						          }
						          updateFrozenProductPackingOption('delivery', chkDeliPoli);
						
						          // KM-2118 : cs
						          if(!isFirstAlertCheck){
						            preventSpecialChars($('input[name=orderer_name]'), 'ready');
						            isFirstAlertCheck = true;
						          }
						        }
						
						        function updateFrozenProductPackingOption(key, value)
						        {
						          var orderingProducts = {"products":[]};
						          var couponDiscount = 0, deliveryPolicy = 0, couponNum = 0;
						          if (orderingProducts.products.length < 1) {
						            return;
						          }
						
						          if (key === 'delivery') {
						            deliveryPolicy = value;
						          }
						
						          if (key === 'coupon') {
						            var regExp = /[^\d]+/g;
						            if(regExp.test(value)){
						              couponNum = value.replace(regExp, "");
						            }
						            couponDiscount = couponNum;
						          }
						
						          // 냉동상품관련임시 비노출 처리
						          kurlyApi({
						            method : 'post',
						            url : '/v3/checkout/gift-and-frozen-product-packing-option?coupon_discount=' + couponDiscount + '&delivery_policy=' + deliveryPolicy + '&using_point=0&delivery_fee=0',
						            data : orderingProducts
						          }).then(function(response){
						            if (response.data.data.required_frozen_product_packing_option === true && deliveryPolicy === 0) {
						              // $('#divFrozen').show(); 임시 비노출
						              $('[name=isFrozenPack]').val('1');
						            } else {
						              // $('#divFrozen').hide(); 임시 비노출
						              $('[name=isFrozenPack]').val('0');
						            }
						          }.bind(this)).catch(function(e){
						            console.log(e)
						          });
						        }
						
						        //냉동상품 포장옵션 유저 저장된 값 로드 (초기 한 번만 함)
						        function getFrozenPackingPreference()
						        {
						          kurlyApi({
						            method: 'get',
						            url: '/v3/members/for-checkout'
						          }).then(function(response){
						            if (response.data.data.frozen_packing_option === 1) {
						              $('input[name=frozen_product_packing_option][value="1"]:first').click();
						            }
						          });
						        }
						        getFrozenPackingPreference();
						</script>
										<script>
						  $(document).ready(function() {
						    $(".emoney_chkbox").on('click', function(e) {
						      e.preventDefault();
						      if($(this).hasClass('disabled')) return false;
						      if($(this).hasClass('checked')){
						        $(this).removeClass('checked');
						        document.frmOrder.using_point.value = 0;
						        chk_emoney(document.frmOrder.using_point);
						        calcu_settle();
						      }else{
						        $(this).addClass('checked');
						        var all_emoney =  uncomma('0');
						        document.frmOrder.using_point.value = all_emoney;
						        chk_emoney(document.frmOrder.using_point);
						        calcu_settle();
						      }
						    });
						
						    var $obj_sticky = $('#sticky');
						    var $stickyLimit = parseInt($('.data_method').height()+$('.data_payment').height() - $obj_sticky.height());
						    $(window).on('load scroll', function(){
						      var $scrollTop = parseInt($(this).scrollTop());
						      var $checkTop = parseInt($('.data_payment').offset().top);
						      if($checkTop < $scrollTop){
						        $obj_sticky.css({top:$scrollTop - $checkTop});
						        if($stickyLimit < parseInt($obj_sticky.css('top'))){
						          $obj_sticky.css({top:$stickyLimit});
						        }
						      }else if($scrollTop < $checkTop){
						        $obj_sticky.css({top:0});
						      }
						    });
						  });
						</script>
									</div>
									<div class="bg_loading" id="bgLoading" style="display: none;">
										<div class="loading_show"></div>
									</div>
						
									<script>
									  var _action_data = {
									    'transaction_id' : '0', //현재 주문번호가 생성된 상태가 아니라서 다른 값으로 대치해야함
									    'is_direct_purchase' : false,
									    'is_gift_purchase': false,
									  }
									  KurlyTracker.setScreenName('order_sheet').setAction('order_creation_success', _action_data).sendData();
									  
									</script>
									
										<script src="/appProxy/appData.php?ver=1.39.15"></script>
										<script src="/asset/js/order/indexPC.bundle.js?ver=1.39.15"></script>
										<script src="/common_js/order/address.js?ver=1.39.15"></script>
										<script src="/asset/js/service.bundle.js?ver=1.39.15"></script>
										<script src="/asset/js/order/PackageMethod.bundle.js?ver=1.39.15"></script>
		</div>
	</div>


	<!-- main 끝 -->

	<!-- layerDSR -->
	<%@ include file="/WEB-INF/views/layout/layerDSR.jsp"%>


	<!-- footer -->
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>







