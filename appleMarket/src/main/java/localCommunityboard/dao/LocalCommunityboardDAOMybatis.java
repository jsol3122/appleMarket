package localCommunityboard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import localCommunityboard.bean.LocalCommunityboardDTO;

@Repository
@Transactional
public class LocalCommunityboardDAOMybatis implements LocalCommunityboardDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<LocalCommunityboardDTO> localCommunityboardGetList(Map<String, String> map) {
		
		return sqlSession.selectList("localCommunityboardSQL.localCommunityboardGetList",map);
	}

	@Override
	public int getTotalA() {
		
		return sqlSession.selectOne("localCommunityboardSQL.getTotalA");
	}

	@Override
	public void localCommunityboardWrite(LocalCommunityboardDTO localCommunityboardDTO) {
		
		String user_id =localCommunityboardDTO.getLocalcommunity_user_id();
		String dong = sqlSession.selectOne("localCommunityboardSQL.searchDong",user_id);

		localCommunityboardDTO.setLocation_dong(dong);
		sqlSession.insert("localCommunityboardSQL.localCommunityboardWrite", localCommunityboardDTO);
		
	}


	@Override
	public void localCommunityboardModify(LocalCommunityboardDTO localCommunityboardDTO) {
		sqlSession.update("localCommunityboardSQL.localCommunityboardModify", localCommunityboardDTO);
		
	}

	@Override
	public void localCommunityboardDelete(String localcommunity_seq) {

		sqlSession.delete("localCommunityboardSQL.localCommunityboardDelete",localcommunity_seq);
		
	}

	@Override
	public LocalCommunityboardDTO localCommunityboardGetView(String localcommunity_seq) {
		
		return sqlSession.selectOne("localCommunityboardSQL.localCommunityboardGetView", localcommunity_seq);
	}

	@Override
	public List<LocalCommunityboardDTO> localCommunityboardSearch(LocalCommunityboardDTO localCommunityboardDTO) {
		
		return sqlSession.selectList("localCommunityboardSQL.localCommunityboardSearch", localCommunityboardDTO);
	}

	@Override
	public void localCommunityboardHit(String localcommunity_seq) {
		sqlSession.update("localCommunityboardSQL.localCommunityboardHit", localcommunity_seq);
		
	}
	

}
