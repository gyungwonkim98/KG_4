package bucket.kurly.user.board.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import bucket.kurly.user.board.Board_fileVO;
import bucket.kurly.user.board.Board_qnaVO;
import bucket.kurly.user.board.service.Board_qnaService;
import bucket.kurly.user.member.MemberVO;
import bucket.kurly.user.order.OrderVO;
import bucket.kurly.user.order.service.OrderService;
import bucket.kurly.util.Pagination;
import bucket.kurly.util.S3Service;

@Controller
public class Board_qnaController {

	@Autowired
	private Board_qnaService board_qnaService;
	private S3Service s3Service = S3Service.getInstance();
	@Autowired
	private OrderService orderService;

	// 글 목록 요청
	@RequestMapping("/board_qna.do")
	public String getBoard_qnaList(Model model,
			@RequestParam(required = false, defaultValue = "1") int page, 
			@RequestParam(required = false, defaultValue = "1") int range,HttpSession session) {
		
		
		System.out.println("[1:1 문의 게시글] 목록페이지 요청");
		
		//현재 회원 번호
		int member_no = (int)session.getAttribute("member_no");
		//전체 게시글 개수
		int listCnt = board_qnaService.selectBoard_qnaListCnt(member_no);
		
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put( "board_qna_member_no", member_no);
		map.put( "listSize", pagination.getListSize());
		map.put( "startList", pagination.getStartList());
		
		List<Board_qnaVO> board_qnaList = board_qnaService.selectBoard_qna(map);
		List<Board_fileVO> board_fileList = board_qnaService.selectBoard_qnaFile(member_no);
		
		model.addAttribute("pagination",pagination);
		model.addAttribute("board_qnaList", board_qnaList);
		model.addAttribute("board_fileList", board_fileList);
		
		return "board/board_qna";
	}

	// 글쓰기 요청
	@RequestMapping("/board_qna_insert.do")
	public String getBoard_qnaInsert(Model model,HttpSession session) {
		System.out.println("[1:1 문의 게시글] 등록페이지 요청");
		
		String member_id = (String)session.getAttribute("id");
		MemberVO vo = board_qnaService.selectBoard_memberinfo(member_id);
		
		model.addAttribute("membervo",vo);
		
		return "board/board_qna_insert";
	}

	// 글쓰기 안의 주문조회 iframe요청
	@RequestMapping("/board_qna_insert_orderNoSearch.do")
	public String getBoard_qna_insert_orderNoSearch(Model model,HttpSession session) throws Exception {
		System.out.println("[1:1 문의 게시글] 등록페이지 - iframe(주문조회) 요청");
		
		List<OrderVO> orderlist = new ArrayList<OrderVO>();
		String order_no = null;
		int member_no = (int) session.getAttribute("member_no");
		
		
		List<OrderVO> cartVO = orderService.select_orderNo(member_no);
		System.out.println(cartVO);
		
		for(int i=0; i<cartVO.size(); i++) {
			String order_no_list = cartVO.get(i).getOrder_no();
			if (order_no_list.equals(order_no)) {

			} else {
				order_no = order_no_list;
				orderlist.addAll(orderService.select_order_one(order_no_list));
				model.addAttribute("orderlist", orderlist);
			}
			
		}
		
		return "board/board_qna_insert_orderNoSearch";
	}

	// 글 DB 등록 기능
	@RequestMapping("/board_qna_insertDB.do")
	public String board_qna_insertDB(Board_qnaVO qnavo, MultipartFile[] file, Model model,HttpSession session)
			throws IOException, PSQLException, IllegalStateException {
		System.out.println("[1:1 문의 게시글] 등록페이지 - DB insert 요청");
		System.out.println("file.length=========>" + file.length);
		
		System.out.println(qnavo.toString());
		qnavo.setBoard_qna_member_no((int)session.getAttribute("member_no"));
		qnavo.setBoard_qna_writer((String) session.getAttribute("name"));
		board_qnaService.insertBoard_qna(qnavo);
		
		int qna_no = board_qnaService.selectBoard_qnaLastNo();
		
		
		for (int i = 0; i < file.length; i++) {
			if (!file[i].getOriginalFilename().equals("")) {
				System.out.println("================== file start ==================");
				System.out.println("파일 이름: " + file[i].getName());
				System.out.println("파일 실제 이름: " + file[i].getOriginalFilename());
				System.out.println("파일 크기: " + file[i].getSize());
				System.out.println("content type: " + file[i].getContentType());
				System.out.println("================== file   END ==================");

				InputStream is = file[i].getInputStream();
				String uploadKey = file[i].getOriginalFilename();
				String contentType = file[i].getContentType();
				long contentLength = file[i].getSize();

				String bucket = "bucketkurly/board_file";
				s3Service.upload(is, uploadKey, contentType, contentLength, bucket);
				String filePath = "https://bucketkurly.s3.ap-northeast-2.amazonaws.com/board_file/" + uploadKey;

				Board_fileVO filevo = new Board_fileVO();
				filevo.setBoard_file_qna_no(qna_no);
				filevo.setBoard_file_member_no(qnavo.getBoard_qna_member_no());
				filevo.setBoard_file_name(file[i].getOriginalFilename());
				filevo.setBoard_file_resource(filePath);

				board_qnaService.insertBoard_qnaFile(filevo);
			}
		}
		
		return "redirect:/board_qna.do";
	}
	
	
	// 글 수정 요청
	@RequestMapping("/board_qna_update.do")
	public String getBoard_qnaList(Model model, @RequestParam("qna_no") int qna_no) {
		System.out.println("[1:1 문의 게시글] 수정페이지 요청");			
		System.out.println(qna_no);
		Board_qnaVO board_qnaVO = board_qnaService.selectBoard_qna_no(qna_no);
		
		model.addAttribute("board_qnaVO", board_qnaVO);
		
		return "board_qna_update";
	}
}
