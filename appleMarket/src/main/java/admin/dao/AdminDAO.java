package admin.dao;

import java.util.List;

import admin.bean.BlackListDTO;
import member.bean.MemberDTO;
import warningBoard.bean.WarningBoardDTO;

public interface AdminDAO {

	public List<MemberDTO> getAdminMemberList();
	
	public void adminMemberDelete(MemberDTO memberDTO);

	public List<WarningBoardDTO> getAdminWarningList();

	public WarningBoardDTO getAdminWarningView(int warning_seq);

	public void adminWarningChange(WarningBoardDTO warningBoardDTO);

	public void adminReputationDown(MemberDTO memberDTO);

	public void adminReputationUp(MemberDTO memberDTO);

	public void adminBlackListDelete(MemberDTO memberDTO);

	public List<BlackListDTO> getAdminBlackList();

}
