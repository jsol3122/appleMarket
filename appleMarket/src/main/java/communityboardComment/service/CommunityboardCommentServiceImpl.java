package communityboardComment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import communityboardComment.bean.CommunityboardCommentDTO;
import communityboardComment.dao.CommunityboardCommentDAO;

@Service
public class CommunityboardCommentServiceImpl implements CommunityboardCommentService {
	@Autowired
	private CommunityboardCommentDAO communityboardCommentDAO;

	@Override
	public List<CommunityboardCommentDTO> communityboardCommentGetList(String communityboard_seq) {
		
		return communityboardCommentDAO.communityboardCommentGetList(communityboard_seq);
	}
	
	
}
