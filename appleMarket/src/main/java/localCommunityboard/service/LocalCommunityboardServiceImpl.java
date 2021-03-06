package localCommunityboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boardPaging.BoardPaging;
import localCommunityboard.bean.LocalCommunityboardDTO;
import localCommunityboard.dao.LocalCommunityboardDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
public class LocalCommunityboardServiceImpl implements LocalCommunityboardService {
	
	@Autowired
	private LocalCommunityboardDAO localCommunityboardDAO;
	
	@Autowired
	private BoardPaging boardPaging;

	@Override
	public JSONObject localCommunityboardGetList(Map<String, Object> map) {
		int pg = Integer.valueOf((String) map.get("pg"));
		int endNum =  pg * 10;
		int startNum = endNum - 9;
		
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List<LocalCommunityboardDTO> list = localCommunityboardDAO.localCommunityboardGetList(map);
		
		int totalA = localCommunityboardDAO.getTotalA(map);
		boardPaging.setCurrentPage(pg);
		//boardPaging.setPageBlock(3);
		boardPaging.setPageSize(10);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		
		
		JSONObject json = new JSONObject();
		if(list != null) {
			JSONArray array = new JSONArray();
			for(LocalCommunityboardDTO localCommunityboardDTO : list) {
				JSONObject temp = new JSONObject();
				
				temp.put("localcommunity_seq", localCommunityboardDTO.getLocalcommunity_seq());
				temp.put("localcommunity_subject", localCommunityboardDTO.getLocalcommunity_subject());
				temp.put("location_dong", localCommunityboardDTO.getLocation_dong());
				temp.put("localcommunity_content", localCommunityboardDTO.getLocalcommunity_content());
				temp.put("localcommunity_image", localCommunityboardDTO.getLocalcommunity_image());
				temp.put("localcommunity_hit", localCommunityboardDTO.getLocalcommunity_hit());
				temp.put("localcommunity_logtime", localCommunityboardDTO.getLocalcommunity_logtime());
				temp.put("localcommunity_user_id", localCommunityboardDTO.getLocalcommunity_user_id());
				
				array.add(temp);
				
			}//for
			
			json.put("list", array);
		}
		
		json.put("boardPaging", boardPaging.getPagingHTML().toString());
		
		return json;
	}

	@Override
	public void localCommunityboardWrite(LocalCommunityboardDTO localCommunityboardDTO) {
		localCommunityboardDAO.localCommunityboardWrite(localCommunityboardDTO);
		
	}

	@Override
	public void localCommunityboardModify(LocalCommunityboardDTO localCommunityboardDTO) {
		localCommunityboardDAO.localCommunityboardModify(localCommunityboardDTO);
	}

	@Override
	public void localCommunityboardDelete(String localcommunity_seq) {
		localCommunityboardDAO.localCommunityboardDelete(localcommunity_seq);
		
	}

	@Override
	public LocalCommunityboardDTO localCommunityboardGetView(String localcommunity_seq) {
		
		return localCommunityboardDAO.localCommunityboardGetView(localcommunity_seq);
	}

	@Override
	public List<LocalCommunityboardDTO> localCommunityboardSearch(LocalCommunityboardDTO localCommunityboardDTO) {
		
		return localCommunityboardDAO.localCommunityboardSearch(localCommunityboardDTO);
	}

	@Override
	public void localCommunityboardHit(String localcommunity_seq) {
		localCommunityboardDAO.localCommunityboardHit(localcommunity_seq);
		
	}
	

	
}
