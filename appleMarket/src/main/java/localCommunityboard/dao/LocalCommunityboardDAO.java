package localCommunityboard.dao;

import java.util.List;
import java.util.Map;

import localCommunityboard.bean.LocalCommunityboardDTO;

public interface LocalCommunityboardDAO {

	public List<LocalCommunityboardDTO> localCommunityboardGetList(Map<String, Object> map);

	public int getTotalA();


	public void localCommunityboardWrite(LocalCommunityboardDTO localCommunityboardDTO);

	public void localCommunityboardModify(LocalCommunityboardDTO localCommunityboardDTO);

	public void localCommunityboardDelete(String localcommunity_seq);

	public LocalCommunityboardDTO localCommunityboardGetView(String localcommunity_seq);

	public List<LocalCommunityboardDTO> localCommunityboardSearch(LocalCommunityboardDTO localCommunityboardDTO);

	public void localCommunityboardHit(String localcommunity_seq);

}
