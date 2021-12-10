package admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.bean.BlackListDTO;
import admin.dao.AdminDAO;
import buyerboard.bean.BuyerboardDTO;
import communityboard.bean.CommunityboardDTO;
import communityboardComment.bean.CommunityboardCommentDTO;
import member.bean.MemberDTO;
import saleboard.bean.SaleboardDTO;
import warningBoard.bean.WarningBoardDTO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public List<MemberDTO> getAdminMemberList() {
		
		return adminDAO.getAdminMemberList();
	}

	@Override
	public void adminMemberDelete(MemberDTO memberDTO) {
		adminDAO.adminMemberDelete(memberDTO);
	}

	@Override
	public List<WarningBoardDTO> getAdminWarningList() {
		return adminDAO.getAdminWarningList();
	}

	@Override
	public WarningBoardDTO getAdminWarningView(int warning_seq) {
		return adminDAO.getAdminWarningView(warning_seq);
	}

	@Override
	public void adminWarningChange(WarningBoardDTO warningBoardDTO) {
		 adminDAO.adminWarningChange(warningBoardDTO);
		
	}

	@Override
	public void adminReputationDown(MemberDTO memberDTO) {
		adminDAO.adminReputationDown(memberDTO);
		
	}

	@Override
	public void adminReputationUp(MemberDTO memberDTO) {
		adminDAO.adminReputationUp(memberDTO);
		
	}

	@Override
	public void adminBlackListDelete(MemberDTO memberDTO) {
		adminDAO.adminBlackListDelete(memberDTO);
		
	}

	@Override
	public List<BlackListDTO> getAdminBlackList() {
		return adminDAO.getAdminBlackList();
	}

	@Override
	public List<SaleboardDTO> getAdminSaleBoardList() {
		return adminDAO.getAdminSaleBoardList();
	}

	@Override
	public SaleboardDTO getAdminSaleBoardView(int sale_seq) {
		return adminDAO.getAdminSaleBoardView(sale_seq);
	}

	@Override
	public List<BuyerboardDTO> getAdminBuyerBoardList() {
		return adminDAO.getAdminBuyerBoardList();
	}

	@Override
	public BuyerboardDTO getAdminBuyerBoardView(int buyerboard_seq) {
		return adminDAO.getAdminBuyerBoardView(buyerboard_seq);
	}

	@Override
	public void adminSaleBoardDelete(int sale_seq) {
		adminDAO.adminSaleBoardDelete(sale_seq);
	}

	@Override
	public void adminBuyerBoardDelete(int buyerboard_seq) {
		adminDAO.adminBuyerBoardDelete(buyerboard_seq);
		
	}

	@Override
	public List<SaleboardDTO> getAdminSaleBoardListDong(String location_dong) {
		return adminDAO.getAdminSaleBoardListDong(location_dong);
	}

	@Override
	public List<CommunityboardDTO> getAdminCommunityBoardList() {
		return adminDAO.getAdminCommunityBoardList();
	}

	@Override
	public MemberDTO getAdminMemberListId(String member_id) {
		return adminDAO.getAdminMemberListId(member_id);
	}

	@Override
	public List<BuyerboardDTO> getAdminBuyerBoardListDong(String location_dong) {
		return adminDAO.getAdminBuyerBoardListDong(location_dong);
	}

	@Override
	public CommunityboardDTO getadminCommunityBoardView(int communityboard_seq) {
		return adminDAO.getadminCommunityBoardView(communityboard_seq);
	}

	@Override
	public void adminCommunityBoardDelete(int communityboard_seq) {
		adminDAO.adminCommunityBoardDelete(communityboard_seq);
	}

	@Override
	public List<CommunityboardDTO> getAdminCommunityListId(String communityboard_user_id) {
		return adminDAO.getAdminCommunityListId(communityboard_user_id);
	}

	@Override
	public List<CommunityboardCommentDTO> getAdminCommunityCommentList() {
		return adminDAO.getAdminCommunityCommentList();
	}

	@Override
	public void adminCommunityCommentDelete(int communityboard_comment_seq) {
		adminDAO.adminCommunityCommentDelete(communityboard_comment_seq);
		
	}

}
