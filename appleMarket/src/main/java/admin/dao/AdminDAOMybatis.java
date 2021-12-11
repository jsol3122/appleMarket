package admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import admin.bean.AdminNoticeDTO;
import localCommunityboard.bean.LocalCommunityboardDTO;
import localCommunityboardComment.bean.LocalCommunityboardCommentDTO;
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

	@Override
	public AdminNoticeDTO getadminNoticeView(int admin_notice_seq) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO"+admin_notice_seq);
		return sqlSession.selectOne("adminSQL.getadminNoticeView", admin_notice_seq);
	}

	@Override
	public void getadminNoticeModify(AdminNoticeDTO adminNoticeDTO) {
		
		sqlSession.update("adminSQL.getadminNoticeModify", adminNoticeDTO);
		
	}

	@Override
	public void getadminNoticeWrite(AdminNoticeDTO adminNoticeDTO) {
		sqlSession.insert("adminSQL.getadminNoticeWrite",adminNoticeDTO);
	}

	@Override
	public List<LocalCommunityboardDTO> getAdminLocalCommunityList() {
		
		return sqlSession.selectList("adminSQL.getAdminLocalCommunityList");
	}

	@Override
	public List<LocalCommunityboardDTO> getAdminLocalCommunityListId(String localcommunity_user_id) {
		return sqlSession.selectList("adminSQL.getAdminLocalCommunityListId", localcommunity_user_id);
	}

	@Override
	public void adminLocalCommunityDelete(String localcommunity_seq) {
		sqlSession.delete("adminSQL.adminLocalCommunityDelete", localcommunity_seq);
		
	}

	@Override
	public List<LocalCommunityboardCommentDTO> getAdminLocalCommunityComment() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminSQL.getAdminLocalCommunityComment");
	}

	@Override
	public void adminLocalCommunityCommentList(String localcommunity_comment_seq) {
		// TODO Auto-generated method stub
		sqlSession.delete("adminSQL.adminLocalCommunityCommentList", localcommunity_comment_seq);
		
	}

	@Override
	public LocalCommunityboardDTO getAdminLocalCommunityView(String localcommunity_seq) {
		
		return sqlSession.selectOne("adminSQL.getAdminLocalCommunityView",localcommunity_seq);
	}

}