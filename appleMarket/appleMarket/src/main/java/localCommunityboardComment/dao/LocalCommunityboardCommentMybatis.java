package localCommunityboardComment.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import localCommunityboardComment.bean.LocalCommunityboardCommentDTO;

@Repository
@Transactional
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

	@Override
	public void localCommunityboardCommentReply(Map<String, String> map) {
		String localcommunity_comment_pseq = map.get("localcommunity_comment_pseq");
		LocalCommunityboardCommentDTO localCommentDTO = replyLoad(localcommunity_comment_pseq);
		
		System.out.println(localCommentDTO);
		
		map.put("localcommunity_comment_ref", localCommentDTO.getLocalcommunity_comment_ref()+"");
		map.put("localcommunity_comment_lev",(localCommentDTO.getLocalcommunity_comment_lev()+1)+"" );
		map.put("localcommunity_comment_step",(localCommentDTO.getLocalcommunity_comment_step()+1)+"" );
		
		System.out.println(map);

		sqlSession.update("localCommunityboardCommnentSQL.commentReply1",localCommentDTO);
		
		sqlSession.insert("localCommunityboardCommnentSQL.commentReply2",map);
		
	}

	@Override
	public LocalCommunityboardCommentDTO replyLoad(String localcommunity_comment_pseq) {
		return sqlSession.selectOne("localCommunityboardCommnentSQL.replyLoad",localcommunity_comment_pseq);
		
	}
	
	@Override
	public int commentTotal(String localcommunity_seq) {
		return sqlSession.selectOne("localCommunityboardCommnentSQL.commentTotal", localcommunity_seq);
	}

}