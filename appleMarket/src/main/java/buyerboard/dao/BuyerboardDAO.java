package buyerboard.dao;

import java.util.List;
import java.util.Map;

import buyerboard.bean.BuyerboardDTO;

public interface BuyerboardDAO {

	public List<BuyerboardDTO> buyerboardGetList(Map<String, Object> map);

	public int getTotalA(String buyerboard_category);

	public void buyerboardWrite(BuyerboardDTO buyerboardDTO);

	public void buyerboardModify(BuyerboardDTO buyerboardDTO);

	public void buyerboardDelete(int buyerboard_seq);

	public List<BuyerboardDTO> buyerboardGetView(int buyerboard_seq);

	public void buyerboardHit(int buyerboard_seq);

	public List<BuyerboardDTO> buyerboardGetListId(Map<String, Object> map);

	public List<BuyerboardDTO> boardcategoryFilter(String buyerboard_category);

}
