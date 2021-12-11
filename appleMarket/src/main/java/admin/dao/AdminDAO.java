package admin.dao;

import java.util.List;

import admin.bean.AdminNoticeDTO;
import localCommunityboard.bean.LocalCommunityboardDTO;
import localCommunityboardComment.bean.LocalCommunityboardCommentDTO;
import member.bean.MemberDTO;

public interface AdminDAO {

	public List<MemberDTO> getAdminMemberList();
	
	public void adminMemberDelete(MemberDTO memberDTO);

	public List<AdminNoticeDTO> getAdminNoticeList();

	public void adminNoticeDelete(AdminNoticeDTO adminNoticeDTO);

	public AdminNoticeDTO getadminNoticeView(int admin_notice_seq);

	public void getadminNoticeModify(AdminNoticeDTO adminNoticeDTO);

	public void getadminNoticeWrite(AdminNoticeDTO adminNoticeDTO);

	public List<LocalCommunityboardDTO> getAdminLocalCommunityList();

	public List<LocalCommunityboardDTO> getAdminLocalCommunityListId(String localcommunity_user_id);

	public void adminLocalCommunityDelete(String localcommunity_seq);

	public List<LocalCommunityboardCommentDTO> getAdminLocalCommunityComment();

	public void adminLocalCommunityCommentList(String localcommunity_comment_seq);

	public LocalCommunityboardDTO getAdminLocalCommunityView(String localcommunity_seq);

}