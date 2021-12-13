package communityboard.dao;

import java.util.List;
import java.util.Map;

import communityboard.bean.CommunityboardDTO;

public interface CommunityboardDAO {

	public List<CommunityboardDTO> communityboardGetList(Map<String, Integer> map);

	public int getTotalA();

	public void communityboardWrite(CommunityboardDTO communityboardDTO);

	public void communityboardModify(CommunityboardDTO communityboardDTO);

	public void communityboardDelete(int communityboard_seq);

	public CommunityboardDTO communityboardGetView(int communityboard_seq);

	public List<CommunityboardDTO> communityboardSearch(CommunityboardDTO communityboardDTO);

	public void communityboardHit(String communityboard_seq);

	public int commentTotal(String communityboard_seq);

	
	
}