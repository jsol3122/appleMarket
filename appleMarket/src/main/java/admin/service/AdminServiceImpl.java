package admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.bean.BlackListDTO;
import admin.dao.AdminDAO;
import buyerboard.bean.BuyerboardDTO;
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

}
