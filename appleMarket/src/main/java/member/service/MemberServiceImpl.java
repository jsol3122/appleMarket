package member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;
import member.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public void write(MemberDTO memberDTO) {
		memberDAO.write(memberDTO);	
	}

	@Override
	public String checkId(String member_id) {
		MemberDTO memberDTO = memberDAO.checkId(member_id);
		
		if(memberDTO == null) {
			return "non_exist"; 
		}else {
			return "exist";
		}
	}

	@Override
	public int login(MemberDTO memberDTO) {
		
		return memberDAO.login(memberDTO);
	}

	@Override
	public List<ZipcodeDTO> checkPostSearch(ZipcodeDTO zipcodeDTO) {
		List<ZipcodeDTO> list = null; 
		list = memberDAO.getZipcodeList(zipcodeDTO.getSido(), zipcodeDTO.getSigungu(), zipcodeDTO.getRoadname());
		
		return list;
		
	}

	
	
	
}
