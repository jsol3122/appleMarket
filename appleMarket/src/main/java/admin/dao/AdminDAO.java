package admin.dao;

import java.util.List;

import member.bean.MemberDTO;

public interface AdminDAO {

	public List<MemberDTO> getAdminMemberList();
	
	public void adminMemberDelete(MemberDTO memberDTO);

}
