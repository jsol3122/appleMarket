package saleboard.dao;

import java.util.List;

import saleboard.bean.SaleboardDTO;


public interface SaleboardDAO {
	
	public void saleboardWrite(SaleboardDTO saleboardDTO);
	
	/*
	public void saleboardModify(SaleboardDTO saleboardDTO);

	public void saleboardDelete();

	public List<SaleboardDTO> saleboardGetList();

	public List<SaleboardDTO> saleboardSearch();

	public void saleboardPick(SaleboardDTO saleboardDTO);
*/
//	public void saleboardChat(String sale_id);

}
