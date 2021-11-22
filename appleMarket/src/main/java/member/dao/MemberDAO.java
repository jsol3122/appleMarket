package member.dao;

import member.bean.MemberDTO;

public interface MemberDAO {

	public void write(MemberDTO memberDTO);
	
	public MemberDTO checkId(String member_id);

	public int login(MemberDTO memberDTO);
}
