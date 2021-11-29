package localCommunityboardComment.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import localCommunityboardComment.bean.LocalCommunityboardCommentDTO;

public class LocalCommunityboardCommentMybatis implements LocalCommunityboardCommentDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<LocalCommunityboardCommentDTO> localCommunityboardCommentGetList(String localcommunity_seq) {
		
		return sqlSession.selectList("localCommunityboardCommnentSQL.localCommunityboardCommentGetList",localcommunity_seq);
	}

	@Override
	public void localCommunityboardCommentWrite(LocalCommunityboardCommentDTO localCommunityboardCommentDTO) {

		sqlSession.insert("localCommunityboardCommnentSQL.localCommunityboardCommentWrite", localCommunityboardCommentDTO);
		
	}

	@Override
	public void localCommunityboardCommentModify(LocalCommunityboardCommentDTO localCommunityboardCommentDTO) {
		sqlSession.update("localCommunityboardCommnentSQL.localCommunityboardCommentModify", localCommunityboardCommentDTO);
		
	}

	@Override
	public void localCommunityboardCommentDelete(String localcommunity_comment_seq) {
		sqlSession.delete("localCommunityboardCommnentSQL.localCommunityboardCommentDelete", localcommunity_comment_seq);
		
	}

}
