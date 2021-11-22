package communityboard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import communityboard.bean.CommunityboardDTO;

@Repository
@Transactional
public class CommunityboardDAOMybatis implements CommunityboardDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<CommunityboardDTO> communityboardGetList(Map<String, Integer> map) {
		
		return sqlSession.selectList("communityboardSQL.communityboardGetList",map);
	}

	@Override
	public int getTotalA() {
		
		return sqlSession.selectOne("communityboardSQL.getTotalA");
	}

	@Override
	public void communityboardWrite(CommunityboardDTO communityboardDTO) {
		
		sqlSession.insert("communityboardSQL.communityboardWrite",communityboardDTO);
	}

	@Override
	public void communityboardModify(CommunityboardDTO communityboardDTO) {
		
		sqlSession.update("communityboardSQL.communityboardModify",communityboardDTO);
		
	}

	@Override
	public void communityboardDelete(int communityboard_seq) {
		
		sqlSession.delete("communityboardSQL.communityboardDelete",communityboard_seq);
		
	}

	@Override
	public List<CommunityboardDTO> communityboardGetView(int communityboard_seq) {
		
		return sqlSession.selectList("communityboardSQL.communityboardGetView",communityboard_seq);
	}
	
	
}
