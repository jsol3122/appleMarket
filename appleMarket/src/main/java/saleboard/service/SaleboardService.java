package saleboard.service;

import java.util.List;

import net.sf.json.JSONObject;
import saleboard.bean.SaleboardDTO;

public interface SaleboardService {
		
	public JSONObject saleboardGetList(int pg); // 글 목록
	
	public void saleboardWrite(SaleboardDTO saleboardDTO); // 글 작성
	
	public void saleboardModify(SaleboardDTO saleboardDTO); // 글 수정

	public void saleboardDelete(int saleboard_seq); // 글 삭제 : 로그인이 되어있어야 삭제 버튼이 보여서 () 안에 데이터 보낼 필요 없다.
	
	public List<SaleboardDTO> saleboardGetView(int saleboard_seq); // 글 상세보기
	
	/*		
	public List<SaleboardDTO> saleboardSearch(SaleboardDTO saleboardDTO);// 글 검색 : 작성자(id), 제목(Subject), 내용(Content)

	public void saleboardPick(Map<String, String> map); // 찜하기
	*/
//	public void saleboardChat(String sale_id); //  판매자 아이디, 매개 변수 수정하기
//	
	
	
}
