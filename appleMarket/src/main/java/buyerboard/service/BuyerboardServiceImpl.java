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
	public JSONObject buyerboardGetList(int page) {
		// DB 
		//1페이지당 n개씩
		int endNum = page * 12;
		int startNum = endNum - 11;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List<BuyerboardDTO> list = buyerboardDAO.buyerboardGetList(map);
		
		
		int totalA=buyerboardDAO.getTotalA();
		boardPaging.setCurrentPage(page);	
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);

		
		JSONObject json = new JSONObject();
		if(list != null) {
			JSONArray array = new JSONArray();
			
			for(BuyerboardDTO buyerboardDTO : list) {
				JSONObject temp = new JSONObject();
				
				temp.put("buyerboard_seq", buyerboardDTO.getBuyerboard_seq());
				temp.put("member_id", buyerboardDTO.getMember_id());

				temp.put("member_dong", buyerboardDTO.getMember_dong());
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
		// TODO Auto-generated method stub
		return buyerboardDAO.buyerboardGetView(buyerboard_seq);
	}

	@Override
	public void buyerboardHit(int buyerboard_seq) {
		
		buyerboardDAO.buyerboardHit(buyerboard_seq);
	}
	
	
	
	
	
	
	
	
	
	
	
}
