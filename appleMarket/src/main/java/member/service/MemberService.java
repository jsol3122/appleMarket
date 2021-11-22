package member.service;

import javax.validation.Valid;

import member.bean.MemberDTO;

public interface MemberService {
	
	public void write(MemberDTO memberDTO);

	public String checkId(String member_id);

	public int login(MemberDTO memberDTO);

	
}
