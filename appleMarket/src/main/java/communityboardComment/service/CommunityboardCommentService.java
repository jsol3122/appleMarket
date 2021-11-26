package communityboardComment.service;

import java.util.List;
import java.util.Map;

import communityboardComment.bean.CommunityboardCommentDTO;

public interface CommunityboardCommentService {

	public List<CommunityboardCommentDTO> communityboardCommentGetList(String communityboard_seq);

	public void communityboardCommentWrite(CommunityboardCommentDTO communityboardCommentDTO);

	public void communityboardCommentModify(CommunityboardCommentDTO communityboardCommentDTO);

	public void communityboardCommentReply(Map<String, String> map);

	
	

	

}
