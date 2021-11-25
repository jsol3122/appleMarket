package member.service;

import java.util.List;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;

public interface MemberService {
	
	public void write(MemberDTO memberDTO);

	public String checkId(String member_id);

	public int login(MemberDTO memberDTO);

	public List<ZipcodeDTO> checkPostSearch(ZipcodeDTO zipcodeDTO);

	public void delete(MemberDTO memberDTO);
	
}
