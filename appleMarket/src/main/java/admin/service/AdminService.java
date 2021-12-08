package admin.service;

import java.util.List;

import member.bean.MemberDTO;

public interface AdminService {

	public List<MemberDTO> getAdminMemberList();

	public void adminMemberDelete(MemberDTO memberDTO);

}
