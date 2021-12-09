package admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import admin.bean.AdminNoticeDTO;
import member.bean.MemberDTO;

@Repository
@Transactional
public class AdminDAOMybatis implements AdminDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MemberDTO> getAdminMemberList() {
		return sqlSession.selectList("adminSQL.getAdminMemberList");
	}

	@Override
	public void adminMemberDelete(MemberDTO memberDTO) {
		sqlSession.delete("adminSQL.adminMemberDelete",memberDTO);
	}

	@Override
	public List<AdminNoticeDTO> getAdminNoticeList() {
		
		return sqlSession.selectList("adminSQL.getAdminNoticeList");
	}

	@Override
	public void adminNoticeDelete(AdminNoticeDTO adminNoticeDTO) {
		sqlSession.delete("adminSQL.adminNoticeDelete",adminNoticeDTO);
		
	}

}