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
	public List<LocalCommunityboardDTO> localCommunityboardGetList(Map<String, Integer> map) {
		
		return sqlSession.selectList("localCommunityboardSQL.localCommunityboardGetList",map);
	}
	
}
