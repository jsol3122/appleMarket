package communityboard.service;

import java.util.List;

import communityboard.bean.CommunityboardDTO;
import net.sf.json.JSONObject;

public interface CommunityboardService {

	public JSONObject communityboardGetList(int pg);

	public void communityboardWrite(CommunityboardDTO communityboardDTO);

	public void communityboardModify(CommunityboardDTO communityboardDTO);

	public void communityboardDelete(int communityboard_seq);

	public List<CommunityboardDTO> communityboardGetView(int communityboard_seq);

	

}
