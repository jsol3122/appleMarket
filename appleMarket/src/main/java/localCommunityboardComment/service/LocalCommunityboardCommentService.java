package localCommunityboardComment.service;

import java.util.List;
import java.util.Map;

import localCommunityboardComment.bean.LocalCommunityboardCommentDTO;

public interface LocalCommunityboardCommentService {

	public List<LocalCommunityboardCommentDTO> localCommunityboardCommentGetList(String localcommunity_seq);

	public void localCommunityboardCommentWrite(LocalCommunityboardCommentDTO localCommunityboardCommentDTO);

	public void localCommunityboardCommentModify(LocalCommunityboardCommentDTO localCommunityboardCommentDTO);

	public void localCommunityboardCommentDelete(String localcommunity_comment_seq);

	public void localCommunityboardCommentReply(Map<String, String> map);

	public int commentTotal(String localcommunity_seq);

}

