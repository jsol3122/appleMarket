package admin.dao;

import java.util.List;

import member.bean.MemberDTO;
import warningBoard.bean.WarningBoardDTO;

public interface AdminDAO {

	public List<MemberDTO> getAdminMemberList();
	
	public void adminMemberDelete(MemberDTO memberDTO);

	public List<WarningBoardDTO> getAdminWarningList();

}
