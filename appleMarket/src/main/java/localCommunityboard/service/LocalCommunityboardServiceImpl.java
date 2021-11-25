package localCommunityboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import localCommunityboard.bean.LocalCommunityboardDTO;
import localCommunityboard.dao.LocalCommunityboardDAO;
import net.sf.json.JSONObject;

@Service
public class LocalCommunityboardServiceImpl implements LocalCommunityboardService {
	
	@Autowired
	private LocalCommunityboardDAO localCommunityboardDAO;

	@Override
	public JSONObject localCommunityboardGetList(int page) {
		
		int endNum = page * 5;
		int startNum = endNum - 4;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List<LocalCommunityboardDTO> list = localCommunityboardDAO.localCommunityboardGetList(map);
		
		
		return ;
	}
	
	
}
