package bucket.kurly.user.refund.service;

import bucket.kurly.user.refund.RefundVO;

public interface RefundService {
	
	public void insert_refund(RefundVO vo) throws Exception;
	void updateOrder_state(String order_no) throws Exception;
}
