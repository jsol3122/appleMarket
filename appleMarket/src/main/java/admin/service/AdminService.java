package admin.service;

import java.util.List;

import admin.bean.BlackListDTO;
import buyerboard.bean.BuyerboardDTO;
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

}
