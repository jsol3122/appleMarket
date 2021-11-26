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
}
