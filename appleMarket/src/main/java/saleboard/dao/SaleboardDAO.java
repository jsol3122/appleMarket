package saleboard.dao;

import java.util.List;
import java.util.Map;

import saleboard.bean.SaleboardDTO;


public interface SaleboardDAO {

	public List<SaleboardDTO> saleboardGetList(Map<String, Integer> map);

	public List<SaleboardDTO> saleboardSearch(SaleboardDTO saleboardDTO);	
	
	public void saleboardWrite(SaleboardDTO saleboardDTO);
	
	public int getTotalA();

	public void saleboardModify(SaleboardDTO saleboardDTO);

	public void saleboardDelete(int sale_seq);
	
	public List<SaleboardDTO> saleboardGetView(int sale_seq);	
	
	public void saleboardPick(Map<String, String> map);

	public void saleboardPickCancel(Map<String, String> map);

	public void saleboardHit(int sale_seq);

	public void saleboardFollow(Map<String, String> map);



//	public void saleboardChat(String sale_id);





}