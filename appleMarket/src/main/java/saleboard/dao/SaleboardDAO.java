package saleboard.dao;

import java.util.List;

import saleboard.bean.SaleboardDTO;

public interface SaleboardDAO {

	public void saleboardWrite(SaleboardDTO saleboardDTO);

	public void saleboardModify(SaleboardDTO saleboardDTO);

	public void saleboardDelete();

	public List<SaleboardDTO> getSaleboardList();

	public void searchSale_id(String sale_id);

	public void searchSale_subject(String sale_subject);

	public void searchSale_content(String sale_content);

	public List<SaleboardDTO> getSale_idList();

	public List<SaleboardDTO> getSale_subjectList();

	public List<SaleboardDTO> getSale_contentList();

	public void saleboardPick(SaleboardDTO saleboardDTO);

	public void saleboardChat(String sale_id);

}
