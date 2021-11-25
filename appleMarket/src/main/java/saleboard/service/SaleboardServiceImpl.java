package saleboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import saleboard.bean.SaleboardDTO;
import saleboard.dao.SaleboardDAO;

@Service
public class SaleboardServiceImpl implements SaleboardService {
	@Autowired
	private SaleboardDAO saleboardDAO;
	
//	@Autowired
//	private saleboardPaging saleboardPaging;
	
	@Override
	public void saleboardWrite(SaleboardDTO saleboardDTO) {
		saleboardDAO.saleboardWrite(saleboardDTO);		
	}
	/*
	@Override
	public void saleboardModify(SaleboardDTO saleboardDTO) {
		saleboardDAO.saleboardModify(saleboardDTO);
		
	}

	@Override
	public void saleboardDelete() {
		saleboardDAO.saleboardDelete();
		
	}
/*
	@Override
	public JSONObject saleboardGetList(int pg) {
		
		// DB 
		//1페이지당 n개씩
		int endNum = pg * 5;
		int startNum = endNum - 4;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List<SaleboardDTO> list= saleboardDAO.saleboardGetList(map);
		
		int totalA = saleboardDAO.getTotalA();
		
		
		saleboardPaging.setCurrentPage(pg);
		saleboardPaging.setPageBlock(3);
		saleboardPaging.setPageSize(5);
		saleboardPaging.setTotalA(totalA);
		saleboardPaging.makePagingHTML();
		
		JSONObject json = new JSONObject();
		if(list != null) {
			JSONArray array = new JSONArray();
			
			for(SaleboardDTO saleboardDTO : list) {
				JSONObject temp = new JSONObject();
				
				temp.put("saleboard_seq", saleboardDTO.getSaleboard_seq());
				temp.put("saleboard_subject", saleboardDTO.getSaleboard_subject());
				temp.put("communityboard_image", communityboardDTO.getCommunityboard_image());
				temp.put("communityboard_user_id", communityboardDTO.getCommunityboard_user_id());
				temp.put("communityboard_hit", communityboardDTO.getCommunityboard_hit());
				temp.put("communityboard_logtime", communityboardDTO.getCommunityboard_logtime());
				
				array.add(temp);
			}//for
			
			json.put("list", array);
			
		}
		
		
		json.put("boardPaging", boardPaging.getPagingHTML().toString());
		
		
		
		return json;
	}
	
	

	@Override
	public List<SaleboardDTO> saleboardSearch(SaleboardDTO saleboardDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saleboardPick(Map<String, String> map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<SaleboardDTO> saleboardGetList() {
		// TODO Auto-generated method stub
		return null;
	}
	


*/
//	@Override
//	public void saleboardChat(String sale_id) {
//		saleboardDAO.saleboardChat(sale_id);
//		
//	}



}
