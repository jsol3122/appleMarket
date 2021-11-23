package saleboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import saleboard.bean.SaleboardDTO;
import saleboard.dao.SaleboardDAO;

@Service
public class SaleboardServiceImpl implements SaleboardService {
	@Autowired
	private SaleboardDAO saleboardDAO;
	
	@Override
	public void saleboardWrite(SaleboardDTO saleboardDTO) {
		saleboardDAO.saleboardWrite(saleboardDTO);
		
	}

	@Override
	public void saleboardModify(SaleboardDTO saleboardDTO) {
		saleboardDAO.saleboardModify(saleboardDTO);
		
	}

	@Override
	public void saleboardDelete() {
		saleboardDAO.saleboardDelete();
		
	}
	
	@Override
	public List<SaleboardDTO> getSaleboardList() {
		return saleboardDAO.getSaleboardList();
	}

	@Override
	public void searchSale_id(String sale_id) {
		saleboardDAO.searchSale_id(sale_id);
		
	}

	@Override
	public void searchSale_subject(String sale_subject) {
		saleboardDAO.searchSale_subject(sale_subject);
		
	}

	@Override
	public void searchSale_content(String sale_content) {
		saleboardDAO.searchSale_content(sale_content);
		
	}
	


	@Override
	public List<SaleboardDTO> getSale_idList() {
		return saleboardDAO.getSale_idList();
	}

	@Override
	public List<SaleboardDTO> getSale_subjectList() {
		return saleboardDAO.getSale_subjectList();
	}

	@Override
	public List<SaleboardDTO> getSale_contentList() {
		return saleboardDAO.getSale_contentList();
	}

	@Override
	public void saleboardPick(SaleboardDTO saleboardDTO) {
		saleboardDAO.saleboardPick(saleboardDTO);
		
	}

	@Override
	public void saleboardChat(String sale_id) {
		saleboardDAO.saleboardChat(sale_id);
		
	}



}
