package communityboardComment.dao;

import java.util.List;

import communityboardComment.bean.CommunityboardCommentDTO;

public interface CommunityboardCommentDAO {

	List<CommunityboardCommentDTO> communityboardCommentGetList(String communityboard_seq);

}
