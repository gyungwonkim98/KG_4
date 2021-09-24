package bucket.kurly.user.goods;

public class Goods_SellVO {

	private int goods_sell_no;
	private String goods_item_code;
	private int goods_sell_price;
	private String goods_sell_in_date;
	private int goods_sell_in_ea;
	private int goods_sell_stock_ea;
	private String goods_sell_rea;
	private String goods_sell_exp;
	private String goods_sell_promotion;
	private String goods_sell_status;
	private int goods_sell_discount;

	public int getGoods_sell_no() {
		return goods_sell_no;
	}

	public void setGoods_sell_no(int goods_sell_no) {
		this.goods_sell_no = goods_sell_no;
	}

	public String getGoods_item_code() {
		return goods_item_code;
	}

	public void setGoods_item_code(String goods_item_code) {
		this.goods_item_code = goods_item_code;
	}

	public int getGoods_sell_price() {
		return goods_sell_price;
	}

	public void setGoods_sell_price(int goods_sell_price) {
		this.goods_sell_price = goods_sell_price;
	}

	public String getGoods_sell_in_date() {
		return goods_sell_in_date;
	}

	public void setGoods_sell_in_date(String goods_sell_in_date) {
		this.goods_sell_in_date = goods_sell_in_date;
	}

	public int getGoods_sell_in_ea() {
		return goods_sell_in_ea;
	}

	public void setGoods_sell_in_ea(int goods_sell_in_ea) {
		this.goods_sell_in_ea = goods_sell_in_ea;
	}

	public int getGoods_sell_stock_ea() {
		return goods_sell_stock_ea;
	}

	public void setGoods_sell_stock_ea(int goods_sell_stock_ea) {
		this.goods_sell_stock_ea = goods_sell_stock_ea;
	}

	public String getGoods_sell_rea() {
		return goods_sell_rea;
	}

	public void setGoods_sell_rea(String goods_sell_rea) {
		this.goods_sell_rea = goods_sell_rea;
	}

	public String getGoods_sell_exp() {
		return goods_sell_exp;
	}

	public void setGoods_sell_exp(String goods_sell_exp) {
		this.goods_sell_exp = goods_sell_exp;
	}

	public String getGoods_sell_promotion() {
		return goods_sell_promotion;
	}

	public void setGoods_sell_promotion(String goods_sell_promotion) {
		this.goods_sell_promotion = goods_sell_promotion;
	}

	public String getGoods_sell_status() {
		return goods_sell_status;
	}

	public void setGoods_sell_status(String goods_sell_status) {
		this.goods_sell_status = goods_sell_status;
	}

	public int getGoods_sell_discount() {
		return goods_sell_discount;
	}

	public void setGoods_sell_discount(int goods_sell_discount) {
		this.goods_sell_discount = goods_sell_discount;
	}

	@Override
	public String toString() {
		return "Goods_SellVO [goods_sell_no=" + goods_sell_no + ", goods_item_code=" + goods_item_code
				+ ", goods_sell_price=" + goods_sell_price + ", goods_sell_in_date=" + goods_sell_in_date
				+ ", goods_sell_in_ea=" + goods_sell_in_ea + ", goods_sell_stock_ea=" + goods_sell_stock_ea
				+ ", goods_sell_rea=" + goods_sell_rea + ", goods_sell_exp=" + goods_sell_exp
				+ ", goods_sell_promotion=" + goods_sell_promotion + ", goods_sell_status=" + goods_sell_status
				+ ", goods_sell_discount=" + goods_sell_discount + "]";
	}

}