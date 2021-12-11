package admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.bean.AdminNoticeDTO;
import admin.dao.AdminDAO;
import localCommunityboard.bean.LocalCommunityboardDTO;
import localCommunityboardComment.bean.LocalCommunityboardCommentDTO;
import member.bean.MemberDTO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public List<MemberDTO> getAdminMemberList() {
		
		return adminDAO.getAdminMemberList();
	}

	@Override
	public void adminMemberDelete(MemberDTO memberDTO) {
		adminDAO.adminMemberDelete(memberDTO);
	}

	@Override
	public List<AdminNoticeDTO> getAdminNoticeList() {
		
		return adminDAO.getAdminNoticeList();
	}

	@Override
	public void adminNoticeDelete(AdminNoticeDTO adminNoticeDTO) {
		adminDAO.adminNoticeDelete(adminNoticeDTO);
		
	}

	@Override
	public AdminNoticeDTO getadminNoticeView(int admin_notice_seq ) {
		// TODO Auto-generated method stub
		System.out.println("serviceImpl"+admin_notice_seq);
		return adminDAO.getadminNoticeView(admin_notice_seq);
		
	}

	@Override
	public void getadminNoticeModify(AdminNoticeDTO adminNoticeDTO) {
		adminDAO.getadminNoticeModify(adminNoticeDTO);
		
	}

	@Override
	public void getadminNoticeWrite(AdminNoticeDTO adminNoticeDTO) {
		adminDAO.getadminNoticeWrite(adminNoticeDTO);
	}

	@Override
	public List<LocalCommunityboardDTO> getAdminLocalCommunityList() {
		
		return adminDAO.getAdminLocalCommunityList();
	}

	@Override
	public List<LocalCommunityboardDTO> getAdminLocalCommunityListId(String localcommunity_user_id) {
		// TODO Auto-generated method stub
		return adminDAO.getAdminLocalCommunityListId(localcommunity_user_id);
	}

	@Override
	public void adminLocalCommunityDelete(String localcommunity_seq) {
		adminDAO.adminLocalCommunityDelete(localcommunity_seq);
		
	}

	@Override
	public List<LocalCommunityboardCommentDTO> getAdminLocalCommunityComment() {
		// TODO Auto-generated method stub
		return adminDAO.getAdminLocalCommunityComment();
	}

	@Override
	public void adminLocalCommunityCommentList(String localcommunity_comment_seq) {
		
		adminDAO.adminLocalCommunityCommentList(localcommunity_comment_seq);
	}

	@Override
	public LocalCommunityboardDTO getAdminLocalCommunityView(String localcommunity_seq) {
		// TODO Auto-generated method stub
		return adminDAO.getAdminLocalCommunityView(localcommunity_seq);
	}

}