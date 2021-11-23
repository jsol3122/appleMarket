package communityboardComment.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import communityboardComment.bean.CommunityboardCommentDTO;

@Repository
@Transactional
public class CommunityboardCommentDAOMybatis implements CommunityboardCommentDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<CommunityboardCommentDTO> communityboardCommentGetList(String communityboard_seq) {
		
		return sqlSession.selectList("communityboardCommentSQL.communityboardCommentGetList", communityboard_seq);
	}
	
	
}
