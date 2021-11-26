package communityboard.service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boardPaging.BoardPaging;
import communityboard.bean.CommunityboardDTO;
import communityboard.dao.CommunityboardDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
public class CommunityboardServiceImpl implements CommunityboardService {

	@Autowired
	private CommunityboardDAO communityboardDAO;
	
	@Autowired
	private BoardPaging boardPaging;
	
	@Override
	public JSONObject communityboardGetList(int pg) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		
		// DB 
		//1페이지당 n개씩
		int endNum = pg * 5;
		int startNum = endNum - 4;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List<CommunityboardDTO> list= communityboardDAO.communityboardGetList(map);
		
		int totalA = communityboardDAO.getTotalA();
		
		
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		
		JSONObject json = new JSONObject();
		if(list != null) {
			JSONArray array = new JSONArray();
			
			for(CommunityboardDTO communityboardDTO : list) {
				JSONObject temp = new JSONObject();
				
				temp.put("communityboard_seq", communityboardDTO.getCommunityboard_seq());
				temp.put("communityboard_subject", communityboardDTO.getCommunityboard_subject());
				temp.put("communityboard_content", communityboardDTO.getCommunityboard_content());
				temp.put("communityboard_image", communityboardDTO.getCommunityboard_image());
				temp.put("communityboard_user_id", communityboardDTO.getCommunityboard_user_id());
				temp.put("communityboard_hit", communityboardDTO.getCommunityboard_hit());
				temp.put("communityboard_logtime", sdf.format(communityboardDTO.getCommunityboard_logtime()));
				
				array.add(temp);
			}//for
			
			json.put("list", array);
			
		}
		
		
		json.put("boardPaging", boardPaging.getPagingHTML().toString());
		
		
		
		return json;
	}

	@Override
	public void communityboardWrite(CommunityboardDTO communityboardDTO) {
		
		communityboardDAO.communityboardWrite(communityboardDTO);
		
	}

	@Override
	public void communityboardModify(CommunityboardDTO communityboardDTO) {
		
		communityboardDAO.communityboardModify(communityboardDTO);
		
	}

	@Override
	public void communityboardDelete(int communityboard_seq) {
		communityboardDAO.communityboardDelete(communityboard_seq);
		
	}

	@Override
	public List<CommunityboardDTO> communityboardGetView(int communityboard_seq) {
		
		return communityboardDAO.communityboardGetView(communityboard_seq);
	}

	@Override
	public List<CommunityboardDTO> communityboardSearch(CommunityboardDTO communityboardDTO) {
		
		return communityboardDAO.communityboardSearch(communityboardDTO);
	}

	@Override
	public void communityboardHit(String communityboard_seq) {
		
		communityboardDAO.communityboardHit(communityboard_seq);
	}

	

	
	
	
}
