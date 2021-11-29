package communityboardComment.dao;

import java.util.List;
import java.util.Map;

import communityboardComment.bean.CommunityboardCommentDTO;

public interface CommunityboardCommentDAO {

	public List<CommunityboardCommentDTO> communityboardCommentGetList(String communityboard_seq);

	public void communityboardCommentWrite(CommunityboardCommentDTO communityboardCommentDTO);

	public void communityboardCommentModify(CommunityboardCommentDTO communityboardCommentDTO);

	public void communityboardCommentReply(Map<String, String> map);

	public void communityboardCommentDelete(String communityboard_comment_seq);

	

}
