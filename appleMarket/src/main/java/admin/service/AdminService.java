package admin.service;

import java.util.List;

import admin.bean.BlackListDTO;
import buyerboard.bean.BuyerboardDTO;
import communityboard.bean.CommunityboardDTO;
import communityboardComment.bean.CommunityboardCommentDTO;
import location.bean.LocationDTO;
import member.bean.MemberDTO;
import saleboard.bean.SaleboardDTO;
import warningBoard.bean.WarningBoardDTO;

public interface AdminService {

	public List<MemberDTO> getAdminMemberList();

	public void adminMemberDelete(MemberDTO memberDTO);

	public List<WarningBoardDTO> getAdminWarningList();

	public WarningBoardDTO getAdminWarningView(int warning_seq);

	public void adminWarningChange(WarningBoardDTO warningBoardDTO);

	public void adminReputationDown(MemberDTO memberDTO);

	public void adminReputationUp(MemberDTO memberDTO);

	public void adminBlackListDelete(MemberDTO memberDTO);

	public List<BlackListDTO> getAdminBlackList();

	public List<SaleboardDTO> getAdminSaleBoardList();

	public SaleboardDTO getAdminSaleBoardView(int sale_seq);

	public List<BuyerboardDTO> getAdminBuyerBoardList();

	public BuyerboardDTO getAdminBuyerBoardView(int buyerboard_seq);

	public void adminSaleBoardDelete(int sale_seq);

	public void adminBuyerBoardDelete(int buyerboard_seq);

	public List<SaleboardDTO> getAdminSaleBoardListDong(String location_dong);

	public List<CommunityboardDTO> getAdminCommunityBoardList();

	public MemberDTO getAdminMemberListId(String member_id);

	public List<BuyerboardDTO> getAdminBuyerBoardListDong(String location_dong);

	public CommunityboardDTO getadminCommunityBoardView(int communityboard_seq);

	public void adminCommunityBoardDelete(int communityboard_seq);

	public List<CommunityboardDTO> getAdminCommunityListId(String communityboard_user_id);

	public List<CommunityboardCommentDTO> getAdminCommunityCommentList();

	public void adminCommunityCommentDelete(int communityboard_comment_seq);

	public void adminlocationDelete(String member_id);

	public BlackListDTO adminBlackListCheck(String member_id);

}
