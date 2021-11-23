package saleboard.service;

import java.util.List;

import saleboard.bean.SaleboardDTO;

public interface SaleboardService {

	public void saleboardWrite(SaleboardDTO saleboardDTO); // 글 작성
	
	public void saleboardModify(SaleboardDTO saleboardDTO); // 글 수정

	public void saleboardDelete(); // 글 삭제 : 로그인이 되어있어야 삭제 버튼이 보여서 () 안에 데이터 보낼 필요 없다.
	
	public List<SaleboardDTO> getSaleboardList(); // 글 목록
	
	// 검색 메소드 : 작성자(id), 제목(Subject), 내용(Content)
	public void searchSale_id(String sale_id); // member_id ?? sale_id ???

	public void searchSale_subject(String sale_subject);
	
	public void searchSale_content(String sale_content);

	
	// 검색 결과 목록을 받아오는 메소드: 작성자(id), 제목(Subject), 내용(Content)
	public List<SaleboardDTO> getSale_idList(); // 작성자 검색 결과 목록

	public List<SaleboardDTO> getSale_subjectList();//제목 검색 결과 목록
	
	public List<SaleboardDTO> getSale_contentList();//내용 검색 결과 목록
	
	// 찜하기 : 구매자 아이디, 팔고게시판 seq, 찜 카운트
	public void saleboardPick(SaleboardDTO saleboardDTO); // 매개 변수 수정하기

	public void saleboardChat(String sale_id); //  판매자 아이디, 매개 변수 수정하기
	
	
	
}
