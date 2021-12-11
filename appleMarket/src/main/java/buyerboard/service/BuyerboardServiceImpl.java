package buyerboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boardPaging.BoardPaging;
import buyerboard.bean.BuyerboardDTO;
import buyerboard.dao.BuyerboardDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import saleboard.bean.SaleboardDTO;

@Service
public class BuyerboardServiceImpl implements BuyerboardService {
	@Autowired
	private BuyerboardDAO buyerboardDAO;
	
	@Autowired
	private BoardPaging boardPaging;
	

	@Override
	public JSONObject buyerboardGetList(int page, String buyerboard_category) {
		// DB 
		//1페이지당 n개씩
		int endNum = page * 12;
		int startNum = endNum - 11;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("buyerboard_category", buyerboard_category);
		
		List<BuyerboardDTO> list = buyerboardDAO.buyerboardGetList(map);
		
		
		int totalA=buyerboardDAO.getTotalA(buyerboard_category);
		boardPaging.setCurrentPage(page);	
		boardPaging.setPageSize(12);
		boardPaging.setTotalA(totalA);

		
		JSONObject json = new JSONObject();
		if(list != null) {
			JSONArray array = new JSONArray();
			
			for(BuyerboardDTO buyerboardDTO : list) {
				JSONObject temp = new JSONObject();
				
				temp.put("buyerboard_seq", buyerboardDTO.getBuyerboard_seq());
				temp.put("member_id", buyerboardDTO.getMember_id());
				temp.put("buyer_status", buyerboardDTO.getBuyer_status());

				temp.put("location_dong", buyerboardDTO.getLocation_dong());
				temp.put("buyerboard_category", buyerboardDTO.getBuyerboard_category());
				temp.put("buyerboard_price", buyerboardDTO.getBuyerboard_price());
				temp.put("buyerboard_subject", buyerboardDTO.getBuyerboard_subject());
				temp.put("buyerboard_content", buyerboardDTO.getBuyerboard_content());
				temp.put("buyerboard_image1", buyerboardDTO.getBuyerboard_image1());
				temp.put("buyerboard_image2", buyerboardDTO.getBuyerboard_image2());
				temp.put("buyerboard_image3", buyerboardDTO.getBuyerboard_image3());
				temp.put("buyerboard_logtime", buyerboardDTO.getBuyerboard_logtime());
				temp.put("buyerboard_chat_count", buyerboardDTO.getBuyerboard_chat_count());
				
				array.add(temp);
			}//for
			
			json.put("list", array);
			
		}
		
		return json;
	}


	@Override
	public void buyerboardWrite(BuyerboardDTO buyerboardDTO) {
		
		buyerboardDAO.buyerboardWrite(buyerboardDTO);
	}


	@Override
	public void buyerboardModify(BuyerboardDTO buyerboardDTO) {
		
		buyerboardDAO.buyerboardModify(buyerboardDTO);
	}


	@Override
	public void buyerboardDelete(int buyerboard_seq) {
		buyerboardDAO.buyerboardDelete(buyerboard_seq);
		
	}


	@Override
	public List<BuyerboardDTO> buyerboardGetView(int buyerboard_seq) {
		return buyerboardDAO.buyerboardGetView(buyerboard_seq);
	}

	@Override
	public void buyerboardHit(int buyerboard_seq) {
		
		buyerboardDAO.buyerboardHit(buyerboard_seq);
	}


	@Override
	public List<BuyerboardDTO> buyerboardGetListId(String member_id, int buyerboard_seq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", 1);
		map.put("endNum", 12);
		map.put("member_id", member_id);
		map.put("buyerboard_seq", buyerboard_seq);
		return buyerboardDAO.buyerboardGetListId(map);
	}

	//카테고리 조회
	@Override
	public List<BuyerboardDTO> boardcategoryFilter(String buyerboard_category) {		
		return buyerboardDAO.boardcategoryFilter(buyerboard_category);
	}
	
}
