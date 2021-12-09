package admin.dao;

import java.util.List;

import admin.bean.AdminNoticeDTO;
import member.bean.MemberDTO;

public interface AdminDAO {

	public List<MemberDTO> getAdminMemberList();
	
	public void adminMemberDelete(MemberDTO memberDTO);

	public List<AdminNoticeDTO> getAdminNoticeList();

	public void adminNoticeDelete(AdminNoticeDTO adminNoticeDTO);

}