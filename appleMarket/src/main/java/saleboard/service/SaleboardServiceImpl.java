package saleboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boardPaging.BoardPaging;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import saleboard.bean.SaleboardDTO;
import saleboard.dao.SaleboardDAO;

@Service
public class SaleboardServiceImpl implements SaleboardService {
	@Autowired
	private SaleboardDAO saleboardDAO;
	
	@Autowired
	private BoardPaging boardPaging;
		
	@Override
	public JSONObject saleboardGetList(int pg) {
		
		// DB 
		//1페이지당 1개씩
		int endNum = pg * 12;
		int startNum = endNum - 11;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List<SaleboardDTO> list= saleboardDAO.saleboardGetList(map);
		
		int totalA = saleboardDAO.getTotalA();
		
		
		boardPaging.setCurrentPage(pg);
		//boardPaging.setPageBlock(3); 
		boardPaging.setPageSize(12); //
		boardPaging.setTotalA(totalA);
		//boardPaging.makePagingHTML();
		
		JSONObject json = new JSONObject();
		if(list != null) {
			JSONArray array = new JSONArray();
			
			for(SaleboardDTO saleboardDTO : list) {
				JSONObject temp = new JSONObject();
				
				temp.put("sale_seq", saleboardDTO.getSale_seq());
				
				temp.put("sale_image1", saleboardDTO.getSale_image1());
				
				temp.put("sale_subject", saleboardDTO.getSale_subject());
				temp.put("sale_price", saleboardDTO.getSale_price());
				temp.put("sale_status", saleboardDTO.getSale_status());
				
				temp.put("member_profilePic", saleboardDTO.getMember_profilePic());
				temp.put("member_id", saleboardDTO.getMember_id());
				temp.put("location1_addr2", saleboardDTO.getLocation1_addr2());
				
				temp.put("sale_heart_count", saleboardDTO.getSale_heart_count());
				temp.put("sale_hit", saleboardDTO.getSale_hit());
				temp.put("sale_free_YN", saleboardDTO.getSale_free_YN());
				
				temp.put("sale_logtime", saleboardDTO.getSale_logtime());
				temp.put("sale_update_logtime", saleboardDTO.getSale_update_logtime());
				
				array.add(temp);
			}//for
			
			json.put("list", array);
			
		}
		
		
		//json.put("boardPaging", boardPaging.getPagingHTML().toString());
		
		return json;
	}

	@Override
	public void saleboardWrite(SaleboardDTO saleboardDTO) {
		saleboardDAO.saleboardWrite(saleboardDTO);
	}
	

	@Override
	public void saleboardModify(SaleboardDTO saleboardDTO) {
		saleboardDAO.saleboardModify(saleboardDTO);
		
	}

	@Override
	public void saleboardDelete(int saleboard_seq) {
		saleboardDAO.saleboardDelete(saleboard_seq);	
	}
	
	@Override
	public List<SaleboardDTO> saleboardGetView(int saleboard_seq) {		
		return saleboardDAO.saleboardGetView(saleboard_seq);
	}
/*
	

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
