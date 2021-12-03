package buyerboard.service;

import java.util.List;

import buyerboard.bean.BuyerboardDTO;
import net.sf.json.JSONObject;

public interface BuyerboardService {

	public JSONObject buyerboardGetList(int page);

	public void buyerboardWrite(BuyerboardDTO buyerboardDTO);

	public void buyerboardModify(BuyerboardDTO buyerboardDTO);

	public void buyerboardDelete(int buyerboard_seq);

	public List<BuyerboardDTO> buyerboardGetView(int buyerboard_seq);


	public void buyerboardHit(int buyerboard_seq);

}
