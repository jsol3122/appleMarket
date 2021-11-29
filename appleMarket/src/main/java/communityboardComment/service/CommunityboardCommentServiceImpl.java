package communityboardComment.service;

import java.util.List;
import java.util.Map;

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

	@Override
	public void communityboardCommentWrite(CommunityboardCommentDTO communityboardCommentDTO) {

		communityboardCommentDAO.communityboardCommentWrite(communityboardCommentDTO);
			
		
	}

	@Override
	public void communityboardCommentModify(CommunityboardCommentDTO communityboardCommentDTO) {
		
		communityboardCommentDAO.communityboardCommentModify(communityboardCommentDTO);
	}

	@Override
	public void communityboardCommentReply(Map<String, String> map) {
		
		communityboardCommentDAO.communityboardCommentReply(map);
	}

	@Override
	public void communityboardCommentDelete(String communityboard_comment_seq) {
		
		communityboardCommentDAO.communityboardCommentDelete(communityboard_comment_seq);
	}

	

	
	
	
}
