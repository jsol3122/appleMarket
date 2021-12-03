package localCommunityboard.service;

import java.util.List;
import java.util.Map;

import localCommunityboard.bean.LocalCommunityboardDTO;
import net.sf.json.JSONObject;

public interface LocalCommunityboardService {

	public JSONObject localCommunityboardGetList(Map<String, String> map);


	public void localCommunityboardWrite(LocalCommunityboardDTO localCommunityboardDTO);

	public void localCommunityboardModify(LocalCommunityboardDTO localCommunityboardDTO);

	public void localCommunityboardDelete(String localcommunity_seq);

	public LocalCommunityboardDTO localCommunityboardGetView(String localcommunity_seq);

	public List<LocalCommunityboardDTO> localCommunityboardSearch(LocalCommunityboardDTO localCommunityboardDTO);

	public void localCommunityboardHit(String localcommunity_seq);

}
