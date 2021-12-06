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

		//1페이지당 n개씩
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

		boardPaging.setPageSize(12);
		boardPaging.setTotalA(totalA);

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

				temp.put("location1_addr2", saleboardDTO.getLocation_dong());
				
				temp.put("sale_heart_count", saleboardDTO.getSale_heart_count());
				temp.put("sale_hit", saleboardDTO.getSale_hit());
				temp.put("sale_free_YN", saleboardDTO.getSale_free_YN());
				
				temp.put("sale_logtime", saleboardDTO.getSale_logtime());
				temp.put("sale_update_logtime", saleboardDTO.getSale_update_logtime());
				
				temp.put("sale_category", saleboardDTO.getSale_category());
				
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
	public void saleboardDelete(int sale_seq) {
		saleboardDAO.saleboardDelete(sale_seq);	
	}
	
	@Override
	public List<SaleboardDTO> saleboardGetView(int sale_seq) {
		System.out.println("serviceImpl");
		return saleboardDAO.saleboardGetView(sale_seq);
	}
	
	@Override
	public List<SaleboardDTO> saleboardGetListId(String member_id, int sale_seq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", 1);
		map.put("endNum", 12);
		map.put("member_id", member_id);
		map.put("sale_seq", sale_seq);
		return saleboardDAO.saleboardGetListId(map);
	}
	
	@Override
	public void saleboardPick(Map<String, String> map) {
		saleboardDAO.saleboardPick(map);		
	}

	@Override
	public void saleboardPickCancel(Map<String, String> map) {
		saleboardDAO.saleboardPickCancel(map);
	}

	@Override
	public void saleboardHit(int sale_seq) {
		saleboardDAO.saleboardHit(sale_seq);		
	}

	@Override
	public List<SaleboardDTO> saleboardSearch(SaleboardDTO saleboardDTO) {
		return saleboardDAO.saleboardSearch(saleboardDTO);

	}

	@Override
	public void saleboardFollow(Map<String, String> map) {
		saleboardDAO.saleboardFollow(map);
	}



	
//	@Override
//	public void saleboardChat(String sale_id) {
//		saleboardDAO.saleboardChat(sale_id);
//		
//	}


}

