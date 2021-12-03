package localCommunityboard.service;

import localCommunityboard.bean.LocalCommunityboardDTO;
import net.sf.json.JSONObject;

public interface LocalCommunityboardService {

	public JSONObject localCommunityboardGetList(int page);


	public void localCommunityboardWrite(LocalCommunityboardDTO localCommunityboardDTO);

}
