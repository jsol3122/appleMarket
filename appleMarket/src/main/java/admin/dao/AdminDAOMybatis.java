package admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;
import warningBoard.bean.WarningBoardDTO;

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
	public List<WarningBoardDTO> getAdminWarningList() {
		return sqlSession.selectList("adminSQL.getAdminWarningList");
	}

	@Override
	public WarningBoardDTO getAdminWarningView(int warning_seq) {
		return sqlSession.selectOne("adminSQL.getAdminWarningView",warning_seq);
	}

}
