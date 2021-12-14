package saleboard.dao;

import java.util.List;
import java.util.Map;

import saleboard.bean.InterestDTO;
import saleboard.bean.SaleboardDTO;


public interface SaleboardDAO {

	public List<SaleboardDTO> saleboardGetList(Map<String, Object> map);

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

	//public void saleboardChat(Map<String, String> map);

	public List<SaleboardDTO> saleboardGetListId(Map<String, Object> map);

	public SaleboardDTO member_idLoad(String sale_seq);
<<<<<<< HEAD

	public List<InterestDTO> getinterestList(String member_id);

	public void interestDelete(int interestList_seq);

	public InterestDTO doubleCheck(SaleboardDTO saleboardDTO);

=======

	public List<InterestDTO> getinterestList(String member_id);

	public void interestDelete(int interestList_seq);

	public InterestDTO doubleCheck(SaleboardDTO saleboardDTO);

>>>>>>> 60b89c37e39fc581e479de386db82fe7ad050209
	public void intereUpdate(int sale_seq); 

//	public void saleboardChat(String sale_id);

}


