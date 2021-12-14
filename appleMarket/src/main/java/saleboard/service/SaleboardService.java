package saleboard.service;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;
import saleboard.bean.InterestDTO;
import saleboard.bean.SaleboardDTO;

public interface SaleboardService {
		
	public JSONObject saleboardGetList(int pg,String sale_category); // 글 목록

	public List<SaleboardDTO> saleboardSearch(SaleboardDTO saleboardDTO); // 글 검색
		
	public void saleboardWrite(SaleboardDTO saleboardDTO); // 글 작성
	
	public void saleboardModify(SaleboardDTO saleboardDTO); // 글 수정

	public void saleboardDelete(int sale_seq); // 글 삭제 
	
	public List<SaleboardDTO> saleboardGetView(int sale_seq); // 글 상세보기

	public void saleboardPick(Map<String, String> map); // 찜하기

	public void saleboardPickCancel(Map<String, String> map); // 찜 취소

	public void saleboardHit(int sale_seq);

	public void saleboardFollow(Map<String, String> map);


	//public void saleboardChat(Map<String, String> map); // 채팅으로 거래하기

	public List<SaleboardDTO> saleboardGetListId(String member_id, int sale_seq);
	
	public SaleboardDTO member_idLoad(String sale_seq);

	public List<InterestDTO> getinterestList(String member_id);

	public void interestDelete(int interestList_seq);

	public InterestDTO doubleCheck(SaleboardDTO saleboardDTO);

	public void intereUpdate(int sale_seq);
	
//	public void saleboardChat(String sale_id); //  판매자 아이디, 매개 변수 수정하기
//	
	


}