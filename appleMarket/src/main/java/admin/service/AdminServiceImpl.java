package admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.bean.AdminNoticeDTO;
import admin.dao.AdminDAO;
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

}