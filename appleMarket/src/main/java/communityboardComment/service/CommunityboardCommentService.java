package communityboardComment.service;

import java.util.List;

import communityboardComment.bean.CommunityboardCommentDTO;

public interface CommunityboardCommentService {

	List<CommunityboardCommentDTO> communityboardCommentGetList(String communityboard_seq);

}
