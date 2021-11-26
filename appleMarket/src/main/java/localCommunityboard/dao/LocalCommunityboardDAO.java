package localCommunityboard.dao;

import java.util.List;
import java.util.Map;

import localCommunityboard.bean.LocalCommunityboardDTO;

public interface LocalCommunityboardDAO {

	public List<LocalCommunityboardDTO> localCommunityboardGetList(Map<String, Integer> map);

	public int getTotalA();

<<<<<<< HEAD
=======
	public void localCommunityboardWrite(LocalCommunityboardDTO localCommunityboardDTO);

>>>>>>> 18cf0739a7304a5f4635592b382de765e5f44e83
}
