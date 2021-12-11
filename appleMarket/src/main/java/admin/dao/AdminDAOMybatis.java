package admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import admin.bean.BlackListDTO;
import buyerboard.bean.BuyerboardDTO;
import communityboard.bean.CommunityboardDTO;
import communityboardComment.bean.CommunityboardCommentDTO;
import location.bean.LocationDTO;
import admin.bean.AdminNoticeDTO;
import localCommunityboard.bean.LocalCommunityboardDTO;
import localCommunityboardComment.bean.LocalCommunityboardCommentDTO;
import member.bean.MemberDTO;
import saleboard.bean.SaleboardDTO;
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
	
	public List<AdminNoticeDTO> getAdminNoticeList() {
		
		return sqlSession.selectList("adminSQL.getAdminNoticeList");
	}

	@Override
	public void adminNoticeDelete(AdminNoticeDTO adminNoticeDTO) {
		sqlSession.delete("adminSQL.adminNoticeDelete",adminNoticeDTO);
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

	@Override
	public List<SaleboardDTO> getAdminSaleBoardList() {
		return sqlSession.selectList("adminSQL.getAdminSaleBoardList");
	}

	@Override
	public SaleboardDTO getAdminSaleBoardView(int sale_seq) {
		return sqlSession.selectOne("adminSQL.getAdminSaleBoardView",sale_seq);
	}

	@Override
	public List<BuyerboardDTO> getAdminBuyerBoardList() {
		return sqlSession.selectList("adminSQL.getAdminBuyerBoardList");
	}

	@Override
	public BuyerboardDTO getAdminBuyerBoardView(int buyerboard_seq) {
		return sqlSession.selectOne("adminSQL.getAdminBuyerBoardView",buyerboard_seq);
	}

	@Override
	public void adminSaleBoardDelete(int sale_seq) {
		sqlSession.delete("adminSQL.adminSaleBoardDelete",sale_seq);
		
	}

	@Override
	public void adminBuyerBoardDelete(int buyerboard_seq) {
		sqlSession.delete("adminSQL.adminBuyerBoardDelete",buyerboard_seq);
	}
	
	
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
	public List<SaleboardDTO> getAdminSaleBoardListDong(String location_dong) {
		return sqlSession.selectList("adminSQL.getAdminSaleBoardListDong",location_dong);
	}

	@Override
	public List<CommunityboardDTO> getAdminCommunityBoardList() {
		return sqlSession.selectList("adminSQL.getAdminCommunityBoardList");
	}

	@Override
	public MemberDTO getAdminMemberListId(String member_id) {
		return sqlSession.selectOne("adminSQL.getAdminMemberListId", member_id);
	}

	@Override
	public List<BuyerboardDTO> getAdminBuyerBoardListDong(String location_dong) {
		return sqlSession.selectList("adminSQL.getAdminBuyerBoardListDong",location_dong);
	}

	@Override
	public CommunityboardDTO getadminCommunityBoardView(int communityboard_seq) {
		return sqlSession.selectOne("adminSQL.getadminCommunityBoardView",communityboard_seq);
	}

	@Override
	public void adminCommunityBoardDelete(int communityboard_seq) {
		sqlSession.delete("adminSQL.adminCommunityBoardDelete",communityboard_seq);		
	}

	@Override
	public List<CommunityboardDTO> getAdminCommunityListId(String communityboard_user_id) {
		return sqlSession.selectList("adminSQL.getAdminCommunityListId",communityboard_user_id);
	}

	@Override
	public List<CommunityboardCommentDTO> getAdminCommunityCommentList() {
		return sqlSession.selectList("adminSQL.getAdminCommunityCommentList");
	}

	@Override
	public void adminCommunityCommentDelete(int communityboard_comment_seq) {
		sqlSession.delete("adminSQL.adminCommunityCommentDelete",communityboard_comment_seq);	
	}
	
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
	public void adminlocationDelete(String member_id) {
		sqlSession.delete("adminSQL.adminlocationDelete",member_id);
		
	}

	@Override
	public BlackListDTO adminBlackListCheck(String member_id) {
		return sqlSession.selectOne("adminSQL.adminBlackListCheck", member_id);
	}

	public LocalCommunityboardDTO getAdminLocalCommunityView(String localcommunity_seq) {
		
		return sqlSession.selectOne("adminSQL.getAdminLocalCommunityView",localcommunity_seq);
	}

}

