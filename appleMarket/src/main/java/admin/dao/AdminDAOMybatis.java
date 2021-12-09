package admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;

@Repository
@Transactional
public class AdminDAOMybatis implements AdminDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MemberDTO> adminMemberList() {
		return sqlSession.selectList("adminSQL.adminMemberList");
	}

	@Override
	public void adminMemberDelete(MemberDTO memberDTO) {
		sqlSession.delete("adminSQL.adminMemberDelete",memberDTO);
	}

}
