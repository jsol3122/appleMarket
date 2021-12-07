package myPage.dao;

import java.util.List;
import java.util.Map;

import buyerboard.bean.BuyerboardDTO;
import communityboard.bean.CommunityboardDTO;
import communityboardComment.bean.CommunityboardCommentDTO;
import localCommunityboard.bean.LocalCommunityboardDTO;
import localCommunityboardComment.bean.LocalCommunityboardCommentDTO;
import net.sf.json.JSONObject;
import saleboard.bean.SaleboardDTO;

public interface MyPageDAO {

	public List<CommunityboardDTO> myCommunityGetList(Map<String, String> map);

	public int myTotalA(String communityboard_user_id);

	public CommunityboardDTO myCommunityGetView(int communityboard_seq);

	public List<CommunityboardCommentDTO> myCommunityCommentGetList(Map<String, String> map);

	public int myCommentTotalA(String string);

	public List<LocalCommunityboardDTO> myLocalGetList(Map<String, String> map);

	public int myLocalTotalA(String localcommunity_user_id);

	public LocalCommunityboardDTO myLocalGetView(int localcommunity_seq);

	public List<LocalCommunityboardCommentDTO> myLocalCommentGetList(Map<String, String> map);

	public int myLocalCommentTotalA(String localcommunity_comment_user_id);

	public List<SaleboardDTO> mySaleGetList(Map<String, String> map);

	public int mySaleTotalA(String member_id);

	public SaleboardDTO mySaleGetView(int sale_seq);

	public  List<BuyerboardDTO> myBuyerGetList(Map<String, String> map);

	public int myBuyerTotalA(String member_id);

	public BuyerboardDTO myBuyerGetView(int buyerboard_seq);

	public void buyhistoryDelete(int buyerboard_seq);

	public void salehistoryDelete(int sale_seq);

	

	

	
	

}
