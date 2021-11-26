package saleboard.dao;

import java.util.List;
import java.util.Map;

import saleboard.bean.SaleboardDTO;


public interface SaleboardDAO {
	
	public void saleboardWrite(SaleboardDTO saleboardDTO);

	public List<SaleboardDTO> saleboardGetList(Map<String, Integer> map);
	
	public int getTotalA();

	public void saleboardModify(SaleboardDTO saleboardDTO);

	public void saleboardDelete(int saleboard_seq);
	
	public List<SaleboardDTO> saleboardGetView(int saleboard_seq);	
	/*
	public List<SaleboardDTO> saleboardSearch();

	public void saleboardPick(SaleboardDTO saleboardDTO);
*/
//	public void saleboardChat(String sale_id);



}
