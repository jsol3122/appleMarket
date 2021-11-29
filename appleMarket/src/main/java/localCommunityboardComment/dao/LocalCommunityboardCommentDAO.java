package localCommunityboardComment.dao;

import java.util.List;

import localCommunityboardComment.bean.LocalCommunityboardCommentDTO;

public interface LocalCommunityboardCommentDAO {

	public List<LocalCommunityboardCommentDTO> localCommunityboardCommentGetList(String localcommunity_seq);

	public void localCommunityboardCommentWrite(LocalCommunityboardCommentDTO localCommunityboardCommentDTO);

	public void localCommunityboardCommentModify(LocalCommunityboardCommentDTO localCommunityboardCommentDTO);

	public void localCommunityboardCommentDelete(String localcommunity_comment_seq);

}
