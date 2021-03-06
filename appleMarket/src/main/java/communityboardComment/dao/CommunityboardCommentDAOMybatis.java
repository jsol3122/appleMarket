package communityboardComment.dao;

import java.util.List;
import java.util.Map;

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

	@Override
	public void communityboardCommentWrite(CommunityboardCommentDTO communityboardCommentDTO) {
		sqlSession.insert("communityboardCommentSQL.communityboardCommentWrite",communityboardCommentDTO);
		
	}

	@Override
	public void communityboardCommentModify(CommunityboardCommentDTO communityboardCommentDTO) {
		
		sqlSession.update("communityboardCommentSQL.communityboardCommentModify", communityboardCommentDTO);
		
	}

	@Override
	public void communityboardCommentReply(Map<String, String> map) {
		
		String communityboard_comment_pseq = map.get("communityboard_comment_pseq");
		
		CommunityboardCommentDTO commentDTO  = replyLoad(communityboard_comment_pseq);
	
		System.out.println(commentDTO);
		
		map.put("communityboard_comment_ref", commentDTO.getCommunityboard_comment_ref()+"");
		map.put("communityboard_comment_lev", (commentDTO.getCommunityboard_comment_lev()+1)+"");
		map.put("communityboard_comment_step", (commentDTO.getCommunityboard_comment_step()+1)+"");
		
		System.out.println(map);
		
		//step update
		sqlSession.update("communityboardCommentSQL.commentReply1",commentDTO);
		
		
		//insert 문제
		sqlSession.insert("communityboardCommentSQL.commentReply2",map);
		
		
	}
	
	public CommunityboardCommentDTO replyLoad(String communityboard_comment_pseq) {
		
		
		CommunityboardCommentDTO commentDTO = sqlSession.selectOne("communityboardCommentSQL.replyLoad",communityboard_comment_pseq);
		
		 return commentDTO;
	}

	@Override
	public void communityboardCommentDelete(String communityboard_comment_seq) {
		sqlSession.delete("communityboardCommentSQL.communityboardCommentDelete", communityboard_comment_seq);
		
	}

	
	
	
}
