package myPage.service;

import java.util.List;
import java.util.Map;

import buyerboard.bean.BuyerboardDTO;
import communityboard.bean.CommunityboardDTO;
import communityboardComment.bean.CommunityboardCommentDTO;
import localCommunityboard.bean.LocalCommunityboardDTO;
import net.sf.json.JSONObject;
import saleboard.bean.SaleboardDTO;

public interface MyPageService {

	public JSONObject myCommunityGetList(Map<String, String> map);

	public CommunityboardDTO myCommunityGetView(int communityboard_seq);

	public JSONObject myCommunityCommentGetList(Map<String, String> map);

	public JSONObject myLocalGetList(Map<String, String> map);

	public LocalCommunityboardDTO myLocalGetView(int localcommunity_seq);

	public JSONObject myLocalCommentGetList(Map<String, String> map);

	public JSONObject mySaleGetList(Map<String, String> map);

	public SaleboardDTO mySaleGetView(int sale_seq);

	public JSONObject myBuyerGetList(Map<String, String> map);

	public BuyerboardDTO myBuyerGetView(int buyerboard_seq);

	public void buyhistoryDelete(int buyerboard_seq);

	public void salehistoryDelete(int sale_seq);

	public void localCommunityHistoryDelete(int localcommunity_seq);

	public void communityHistoryDelete(int communityboard_seq);

	public void myLocalCommentDelete(int parseInt);

	public void myCommunityCommentDelete(int parseInt);

	public void saleComplete(SaleboardDTO saleboardDTO);

	public void buyerComplete(BuyerboardDTO buyerboardDTO);

	

	
	

}
