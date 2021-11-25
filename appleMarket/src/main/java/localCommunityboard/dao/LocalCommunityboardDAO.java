package localCommunityboard.dao;

import java.util.List;
import java.util.Map;

import localCommunityboard.bean.LocalCommunityboardDTO;

public interface LocalCommunityboardDAO {

	List<LocalCommunityboardDTO> localCommunityboardGetList(Map<String, Integer> map);

}
