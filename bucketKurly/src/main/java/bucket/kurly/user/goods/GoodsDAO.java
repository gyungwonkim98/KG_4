package bucket.kurly.user.goods;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GoodsDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	// 상품 DB 리스트
	public List<GoodsVO> selectGoods_list() {
		System.out.println("GoosDAO - selectGoods_list() 실행");
		return sqlSessionTemplate.selectList("GoodsDAO.selectGoods_list");
	}

	// 상품 DB 카운트
	public String getGoods_cnt() {
		System.out.println("게시글 DB수");
		return sqlSessionTemplate.selectOne("GoodsDAO.getGoods_cnt");
	}

	// 상품 상세페이지(상품정보)
	public List<GoodsVO> getGoods_list_detail() {
		 System.out.println("getGoods_list_detail<> 실행");
		return sqlSessionTemplate.selectList("GoodsDAO.getGoods_list_detail");
	}
	
	// 상품 판매 정보
	public Goods_SellVO getGoods_sell(Goods_SellVO gsvo) {
		System.out.println("판매 정보");
		return sqlSessionTemplate.selectOne("GoodsDAO.getGoods_sell", gsvo);
	}
	
	// 장바구니에 담기
	public void insertGoods_cart(Goods_CartVO gcvo) {
		System.out.println("insertGoods_cart() 실행");
		sqlSessionTemplate.insert("GoodsDAO.insertGoods_cart");
	}
	
	// 장바구니 불러오기
	public List<Goods_CartVO> getGoodslist_cart(int goods_cart_member_no){
		System.out.println("getGoodslist_cart() 실행");
		return sqlSessionTemplate.selectList("GoodsDAO.getGoodslist_cart",goods_cart_member_no);
	}


	/*
	 * //공지사항 페이징 public int getnotice_cnt() { System.out.println("게시글 DB수"); return
	 * sqlSessionTemplate.selectOne("board-mapping.getnotice_cnt"); }
	 */
}
