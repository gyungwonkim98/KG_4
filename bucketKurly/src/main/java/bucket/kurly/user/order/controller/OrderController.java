package bucket.kurly.user.order.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import bucket.kurly.user.goods.Goods_CartShowVO;
import bucket.kurly.user.goods.Goods_CartVO;
import bucket.kurly.user.goods.Goods_SellVO;
import bucket.kurly.user.goods.service.GoodsService;
import bucket.kurly.user.member.MemberVO;
import bucket.kurly.user.order.OrderDetailsVO;
import bucket.kurly.user.order.OrderVO;
import bucket.kurly.user.order.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private GoodsService goodsService;
	
	//주문서 jsp
	@RequestMapping("/order_form.do")
	public String order_form(Model model, HttpSession session, @RequestParam("chkItem") List<String> cart_no, @RequestParam("goodsPrice") String goodsPrice,@RequestParam("discountprice") String discountprice, 
			@RequestParam("deliveryFee") String deliveryFee, @RequestParam("ordersPrice") String ordersPrice, HttpServletRequest request) throws Exception {
		List<Goods_CartShowVO> goods_cartShowVO = new ArrayList<Goods_CartShowVO>();
		
		session.setAttribute("cart_no", cart_no);
		System.out.println("카트번호" + cart_no);
		System.out.println("카운트  : " + cart_no.size());
		for(int i=0; i<cart_no.size(); i++) {
			goods_cartShowVO.addAll(goodsService.chooseGoods_cart(Integer.parseInt(cart_no.get(i))));
			model.addAttribute("goods_cartShowVO", goods_cartShowVO);
		}
		
		System.out.println(session.getAttribute("member_no"));
		
		String name = (String) session.getAttribute("id");
		MemberVO result = orderService.order_form(name);
		String member_address1 = request.getParameter("member_address1");
		String member_address2 = request.getParameter("member_address2");
		if(member_address1 != "") {
			result.setMember_address1(member_address1);
			result.setMember_address2(member_address2);
		}
		System.out.println(result);
		
		model.addAttribute("count", cart_no.size()-1);
		model.addAttribute("memberVO", result);
		model.addAttribute("goodsPrice", goodsPrice);
		model.addAttribute("discountprice", discountprice);
		model.addAttribute("deliveryFee", deliveryFee);
		model.addAttribute("ordersPrice", ordersPrice);
		model.addAttribute("cart_no", cart_no);
		
		
		return "order/order_form";
	}
	
	//주문서 페이지
	@RequestMapping("/approval.do")
	public String order_form_detail(OrderVO vo, Goods_CartVO goods_cart, Goods_SellVO gsv, OrderDetailsVO order_details, HttpServletRequest request, HttpSession session) throws Exception   {
		int member_no = (int) session.getAttribute("member_no");
		
		
		String order_name = request.getParameter("order_name");
		vo.setOrder_name(order_name);
		System.out.println(order_name);
		
		String order_phone = request.getParameter("order_phone");
		vo.setOrder_phone(order_phone);
		System.out.println(order_phone);
		
		String order_address = request.getParameter("order_address");
		vo.setOrder_address(order_address);
		System.out.println(order_address);
		
		String order_goods_price = request.getParameter("order_goods_price");
		vo.setOrder_goods_price(Integer.parseInt(order_goods_price));
		System.out.println(order_goods_price);
		
		String delivery_fee = request.getParameter("delivery_fee");
		System.out.println(delivery_fee);
		vo.setOrder_delivery_fee(Integer.parseInt(delivery_fee));
//		vo.setOrder_delivery_fee(3000);
		
		String order_merchant_no = request.getParameter("order_merchant_no");
		System.out.println("order_merchant_no"+order_merchant_no);
		vo.setOrder_merchant_no(order_merchant_no);
		
		vo.setOrder_member_no(member_no);
		System.out.println(member_no);
		List<String> cart_no = (List<String>) session.getAttribute("cart_no");
		System.out.println("카트 카운트 : " + cart_no.size());
		
		for(int i=0; i<cart_no.size(); i++) {
			goodsService.updateCart_status(Integer.parseInt(cart_no.get(i)));
			System.err.println(Integer.parseInt(cart_no.get(i)) + "의 상태변경");
		}
		
		
		
		
		vo.setOrder_goods_count(cart_no.size());
		
		System.out.println(vo);
		orderService.insert_order(vo);
		
		
		OrderVO order_no = orderService.orderNo(vo);
		
		order_details.setOrder_details_order_no(order_no.getOrder_no());
		
		
		for(int i=0; i<cart_no.size(); i++) {
			goods_cart = (Goods_CartVO) goodsService.select_goods_cart(Integer.parseInt(cart_no.get(i)));
			order_details.setOrder_details_goods_count(goods_cart.getGoods_cart_count());
			order_details.setOrder_details_goods_sell_no(goods_cart.getGoods_cart_sell_no());
			orderService.insertOrderDetail(order_details);
			
			int stock_ea = goodsService.select_goodsStock(goods_cart.getGoods_cart_sell_no());
			gsv.setGoods_sell_no(goods_cart.getGoods_cart_sell_no());
			gsv.setGoods_sell_stock_ea(stock_ea - goods_cart.getGoods_cart_count());
			goodsService.updateSell_stock(gsv);
		}
		
		return "0";
	}
	
}
