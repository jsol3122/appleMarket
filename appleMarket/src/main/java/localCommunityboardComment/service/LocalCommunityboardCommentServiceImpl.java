package localCommunityboardComment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import localCommunityboardComment.bean.LocalCommunityboardCommentDTO;
import localCommunityboardComment.dao.LocalCommunityboardCommentDAO;

@Service
public class LocalCommunityboardCommentServiceImpl implements LocalCommunityboardCommentService {
	@Autowired
	private LocalCommunityboardCommentDAO localCommunityboardCommentDAO;
	
	@Override
	public List<LocalCommunityboardCommentDTO> localCommunityboardCommentGetList(String localcommunity_seq) {
		
		return localCommunityboardCommentDAO.localCommunityboardCommentGetList(localcommunity_seq);
	}

	@Override
	public void localCommunityboardCommentWrite(LocalCommunityboardCommentDTO localCommunityboardCommentDTO) {

		localCommunityboardCommentDAO.localCommunityboardCommentWrite(localCommunityboardCommentDTO);
		
	}

	@Override
	public void localCommunityboardCommentModify(LocalCommunityboardCommentDTO localCommunityboardCommentDTO) {
	
		localCommunityboardCommentDAO.localCommunityboardCommentModify(localCommunityboardCommentDTO);
		
	}

	@Override
	public void localCommunityboardCommentDelete(String localcommunity_comment_seq) {
		
		localCommunityboardCommentDAO.localCommunityboardCommentDelete(localcommunity_comment_seq);
	}

}
