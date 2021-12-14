package buyerboard.service;

import java.util.List;
import java.util.Map;

import buyerboard.bean.BuyerboardDTO;
import net.sf.json.JSONObject;

public interface BuyerboardService {

	public JSONObject buyerboardGetList(int page, String buyerboard_category);

	public void buyerboardWrite(BuyerboardDTO buyerboardDTO);

	public void buyerboardModify(BuyerboardDTO buyerboardDTO);

	public void buyerboardDelete(int buyerboard_seq);

	public List<BuyerboardDTO> buyerboardGetView(int buyerboard_seq);


	public void buyerboardHit(int buyerboard_seq);

	public List<BuyerboardDTO> buyerboardGetListId(String member_id, int buyerboard_seq);

	public List<BuyerboardDTO> boardcategoryFilter(String buyerboard_category);

	public void buyerboardPick(Map<String, String> map);


}
