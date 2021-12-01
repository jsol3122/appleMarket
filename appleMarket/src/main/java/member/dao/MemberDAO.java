package member.dao;

import java.util.List;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;

public interface MemberDAO {

	public void write(MemberDTO memberDTO);
	
	public MemberDTO checkId(String member_id);

	public int login(MemberDTO memberDTO);

	public List<ZipcodeDTO> getZipcodeList(String sido, String sigungu, String roadname);

	public void delete(MemberDTO memberDTO);

	public void modify(MemberDTO memberDTO);

	public MemberDTO searchId(String member_email);

	public MemberDTO searchPwd(String member_id, String member_email);

	public void changePwd(MemberDTO memberDTO);
}
