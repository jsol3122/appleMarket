package admin.service;

import java.util.List;

import member.bean.MemberDTO;
import warningBoard.bean.WarningBoardDTO;

public interface AdminService {

	public List<MemberDTO> getAdminMemberList();

	public void adminMemberDelete(MemberDTO memberDTO);

	public List<WarningBoardDTO> getAdminWarningList();

}
