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
		
		if(zipcodeDTO.getSido() != null && zipcodeDTO.getRoadname() !=null) {
			list = memberDAO.getZipcodeList(zipcodeDTO.getSido(), zipcodeDTO.getSigungu(), zipcodeDTO.getRoadname());
			System.out.println(list);
		}
		if(zipcodeDTO.getSigungu() == null) {
			list = memberDAO.getZipcodeList(zipcodeDTO.getSido(), "", zipcodeDTO.getRoadname());
			System.out.println(list);
		}
	
		
		return list;
	}

	@Override
	public void delete(MemberDTO memberDTO) {
		memberDAO.delete(memberDTO);
		
	}

	@Override
	public void modify(MemberDTO memberDTO) {
		memberDAO.modify(memberDTO);
		
	}

	
	
	
}
