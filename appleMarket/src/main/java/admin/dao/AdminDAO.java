package admin.dao;

import java.util.List;

import member.bean.MemberDTO;

public interface AdminDAO {

	public List<MemberDTO> adminMemberList();
	
	public void adminMemberDelete(MemberDTO memberDTO);

}