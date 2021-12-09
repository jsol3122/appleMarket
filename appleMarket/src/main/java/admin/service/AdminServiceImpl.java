package admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.AdminDAO;
import member.bean.MemberDTO;
import warningBoard.bean.WarningBoardDTO;

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
	public List<WarningBoardDTO> getAdminWarningList() {
		return adminDAO.getAdminWarningList();
	}

	@Override
	public WarningBoardDTO getAdminWarningView(int warning_seq) {
		return adminDAO.getAdminWarningView(warning_seq);
	}

}
