package admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import admin.bean.BlackListDTO;
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

	@Override
	public void adminWarningChange(WarningBoardDTO warningBoardDTO) {
		sqlSession.update("adminSQL.adminWarningChange", warningBoardDTO);
		
	}

	@Override
	public void adminReputationDown(MemberDTO memberDTO) {
		sqlSession.update("adminSQL.adminReputationDown", memberDTO);
		
	}

	@Override
	public void adminReputationUp(MemberDTO memberDTO) {
		sqlSession.update("adminSQL.adminReputationUp", memberDTO);
		
	}

	@Override
	public void adminBlackListDelete(MemberDTO memberDTO) {
		sqlSession.delete("adminSQL.adminMemberDelete",memberDTO);

		sqlSession.insert("adminSQL.adminBlackInsert", memberDTO);
	}

	@Override
	public List<BlackListDTO> getAdminBlackList() {
		return sqlSession.selectList("adminSQL.getAdminBlackList");
	}

}
