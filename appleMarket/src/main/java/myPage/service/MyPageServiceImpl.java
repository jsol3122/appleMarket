package myPage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boardPaging.BoardPaging;
import buyerboard.bean.BuyerboardDTO;
import communityboard.bean.CommunityboardDTO;
import communityboardComment.bean.CommunityboardCommentDTO;
import localCommunityboard.bean.LocalCommunityboardDTO;
import localCommunityboardComment.bean.LocalCommunityboardCommentDTO;
import myPage.dao.MyPageDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import saleboard.bean.SaleboardDTO;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDAO myPageDAO;

	@Autowired
	private BoardPaging boardPaging;

	@Override
	public JSONObject myCommunityGetList(Map<String, String> map) {

		// 1페이지당 n개씩
		int pg = Integer.parseInt(map.get("pg"));
		int endNum = pg * 5;
		int startNum = endNum - 4;

		map.put("endNum", endNum + "");
		map.put("startNum", startNum + "");

		List<CommunityboardDTO> list = myPageDAO.myCommunityGetList(map);

		int myTotalA = myPageDAO.myTotalA(map.get("communityboard_user_id"));

		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(myTotalA);
		boardPaging.makePagingHTML();

		JSONObject json = new JSONObject();

		if (list != null) {
			JSONArray array = new JSONArray();

			for (CommunityboardDTO communityboardDTO : list) {
				JSONObject temp = new JSONObject();

				temp.put("communityboard_seq", communityboardDTO.getCommunityboard_seq());
				temp.put("communityboard_subject", communityboardDTO.getCommunityboard_subject());
				temp.put("communityboard_content", communityboardDTO.getCommunityboard_content());
				temp.put("communityboard_image", communityboardDTO.getCommunityboard_image());
				temp.put("communityboard_user_id", communityboardDTO.getCommunityboard_user_id());
				temp.put("communityboard_hit", communityboardDTO.getCommunityboard_hit());
				temp.put("communityboard_logtime", communityboardDTO.getCommunityboard_logtime());

				array.add(temp);
			} // for
			json.put("list", array);
		}

		json.put("boardPaging", boardPaging.getPagingHTML().toString());

		return json;
	}

	@Override
	public CommunityboardDTO myCommunityGetView(int communityboard_seq) {

		return myPageDAO.myCommunityGetView(communityboard_seq);
	}

	@Override
	public JSONObject myCommunityCommentGetList(Map<String, String> map) {
		// 1페이지당 n개씩
		int pg = Integer.parseInt(map.get("pg"));
		int endNum = pg * 5;
		int startNum = endNum - 4;

		map.put("endNum", endNum + "");
		map.put("startNum", startNum + "");

		List<CommunityboardCommentDTO> list = myPageDAO.myCommunityCommentGetList(map);

		int myCommentTotalA = myPageDAO.myCommentTotalA(map.get("communityboard_comment_user_id"));

		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(myCommentTotalA);
		boardPaging.makePagingHTML();

		JSONObject json = new JSONObject();

		if (list != null) {
			JSONArray array = new JSONArray();

			for (CommunityboardCommentDTO communityboardCommentDTO : list) {
				JSONObject temp = new JSONObject();

				temp.put("communityboard_seq", communityboardCommentDTO.getCommunityboard_seq());
				temp.put("communityboard_comment_seq", communityboardCommentDTO.getCommunityboard_comment_seq());
				temp.put("communityboard_comment_content",
						communityboardCommentDTO.getCommunityboard_comment_content());
				temp.put("communityboard_comment_user_id",
						communityboardCommentDTO.getCommunityboard_comment_user_id());
				temp.put("communityboard_comment_logtime",
						communityboardCommentDTO.getCommunityboard_comment_logtime());

				array.add(temp);
			} // for
			json.put("list", array);
		}

		json.put("boardPaging", boardPaging.getPagingHTML().toString());

		return json;

	}

	@Override
	public JSONObject myLocalGetList(Map<String, String> map) {
		int pg = Integer.parseInt(map.get("pg"));
		int endNum = pg * 5;
		int startNum = endNum - 4;

		map.put("endNum", endNum + "");
		map.put("startNum", startNum + "");

		List<LocalCommunityboardDTO> list = myPageDAO.myLocalGetList(map);

		int myLocalTotalA = myPageDAO.myLocalTotalA(map.get("localcommunity_user_id"));
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(myLocalTotalA);
		boardPaging.makePagingHTML();

		JSONObject json = new JSONObject();
		if (list != null) {
			JSONArray array = new JSONArray();

			for (LocalCommunityboardDTO localCommunityboardDTO : list) {
				JSONObject temp = new JSONObject();

				temp.put("localcommunity_seq", localCommunityboardDTO.getLocalcommunity_seq());
				temp.put("localcommunity_subject", localCommunityboardDTO.getLocalcommunity_subject());
				temp.put("location_dong", localCommunityboardDTO.getLocation_dong());
				temp.put("localcommunity_content", localCommunityboardDTO.getLocalcommunity_content());
				temp.put("localcommunity_image", localCommunityboardDTO.getLocalcommunity_image());
				temp.put("localcommunity_hit", localCommunityboardDTO.getLocalcommunity_hit());
				temp.put("localcommunity_logtime", localCommunityboardDTO.getLocalcommunity_logtime());
				temp.put("localcommunity_user_id", localCommunityboardDTO.getLocalcommunity_user_id());

				array.add(temp);
			} // for
			json.put("list", array);
		}

		json.put("boardPaging", boardPaging.getPagingHTML().toString());

		return json;
	}

	@Override
	public LocalCommunityboardDTO myLocalGetView(int localcommunity_seq) {

		return myPageDAO.myLocalGetView(localcommunity_seq);
	}

	@Override
	public JSONObject myLocalCommentGetList(Map<String, String> map) {
		// 1페이지당 n개씩
		int pg = Integer.parseInt(map.get("pg"));
		int endNum = pg * 5;
		int startNum = endNum - 4;

		map.put("endNum", endNum + "");
		map.put("startNum", startNum + "");

		List<LocalCommunityboardCommentDTO> list = myPageDAO.myLocalCommentGetList(map);

		int myLocalCommentTotalA = myPageDAO.myLocalCommentTotalA(map.get("localcommunity_comment_user_id"));

		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(myLocalCommentTotalA);
		boardPaging.makePagingHTML();

		JSONObject json = new JSONObject();

		if (list != null) {
			JSONArray array = new JSONArray();

			for (LocalCommunityboardCommentDTO localCommunityboardCommentDTO : list) {
				JSONObject temp = new JSONObject();

				temp.put("localcommunity_seq", localCommunityboardCommentDTO.getLocalcommunity_seq());
				temp.put("localcommunity_comment_seq", localCommunityboardCommentDTO.getLocalcommunity_comment_seq());
				temp.put("localcommunity_comment_content",
						localCommunityboardCommentDTO.getLocalcommunity_comment_content());
				temp.put("localcommunity_comment_user_id",
						localCommunityboardCommentDTO.getLocalcommunity_comment_user_id());
				temp.put("localcommunity_comment_logtime",
						localCommunityboardCommentDTO.getLocalcommunity_comment_logtime());

				array.add(temp);
			} // for
			json.put("list", array);
		}

		json.put("boardPaging", boardPaging.getPagingHTML().toString());

		return json;

	}

	@Override
	public JSONObject mySaleGetList(Map<String, String> map) {

		int pg = Integer.parseInt(map.get("pg"));
		int endNum = pg * 5;
		int startNum = endNum - 4;

		map.put("endNum", endNum + "");
		map.put("startNum", startNum + "");

		List<SaleboardDTO> list = myPageDAO.mySaleGetList(map);

		int mySaleTotalA = myPageDAO.mySaleTotalA(map.get("member_id"));

		boardPaging.setCurrentPage(pg);

		boardPaging.setPageSize(12);
		boardPaging.setTotalA(mySaleTotalA);

		JSONObject json = new JSONObject();
		if (list != null) {
			JSONArray array = new JSONArray();

			for (SaleboardDTO saleboardDTO : list) {
				JSONObject temp = new JSONObject();

				temp.put("sale_seq", saleboardDTO.getSale_seq());

				temp.put("sale_image1", saleboardDTO.getSale_image1());

				temp.put("sale_subject", saleboardDTO.getSale_subject());
				temp.put("sale_price", saleboardDTO.getSale_price());
				temp.put("sale_status", saleboardDTO.getSale_status());

				temp.put("member_profilePic", saleboardDTO.getMember_profilePic());
				temp.put("member_id", saleboardDTO.getMember_id());
				temp.put("location_dong", saleboardDTO.getLocation_dong());

				temp.put("sale_heart_count", saleboardDTO.getSale_heart_count());
				temp.put("sale_hit", saleboardDTO.getSale_hit());
				temp.put("sale_free_YN", saleboardDTO.getSale_free_YN());

				temp.put("sale_logtime", saleboardDTO.getSale_logtime());
				temp.put("sale_update_logtime", saleboardDTO.getSale_update_logtime());

				temp.put("sale_category", saleboardDTO.getSale_category());

				array.add(temp);
			} // for

			json.put("list", array);

			
		}
		return json;
	}

	@Override
	public SaleboardDTO mySaleGetView(int sale_seq) {
		
		return myPageDAO.mySaleGetView(sale_seq);
	}

	@Override
	public JSONObject myBuyerGetList(Map<String, String> map) {
		
		int pg = Integer.parseInt(map.get("pg"));
		int endNum = pg * 5;
		int startNum = endNum - 4;

		map.put("endNum", endNum + "");
		map.put("startNum", startNum + "");
		
		List<BuyerboardDTO> list = myPageDAO.myBuyerGetList(map);
		
		int myBuyerTotalA = myPageDAO.myBuyerTotalA(map.get("member_id"));

		boardPaging.setCurrentPage(pg);

		boardPaging.setPageSize(12);
		boardPaging.setTotalA(myBuyerTotalA);
		
		JSONObject json = new JSONObject();
		if(list != null) {
			JSONArray array = new JSONArray();
			
			for(BuyerboardDTO buyerboardDTO : list) {
				JSONObject temp = new JSONObject();
				
				temp.put("buyerboard_seq", buyerboardDTO.getBuyerboard_seq());
				temp.put("member_id", buyerboardDTO.getMember_id());

				temp.put("location_dong", buyerboardDTO.getLocation_dong());
				temp.put("buyerboard_category", buyerboardDTO.getBuyerboard_category());
				temp.put("buyerboard_price", buyerboardDTO.getBuyerboard_price());
				temp.put("buyerboard_subject", buyerboardDTO.getBuyerboard_subject());
				temp.put("buyerboard_content", buyerboardDTO.getBuyerboard_content());
				temp.put("buyerboard_image1", buyerboardDTO.getBuyerboard_image1());
				temp.put("buyerboard_image2", buyerboardDTO.getBuyerboard_image2());
				temp.put("buyerboard_image3", buyerboardDTO.getBuyerboard_image3());
				temp.put("buyerboard_logtime", buyerboardDTO.getBuyerboard_logtime());
				temp.put("buyerboard_chat_count", buyerboardDTO.getBuyerboard_chat_count());
				
				array.add(temp);
			}//for
			
			json.put("list", array);
			
		}
		json.put("boardPaging", boardPaging);
		return json;

		
	}

	@Override
	public BuyerboardDTO myBuyerGetView(int buyerboard_seq) {
		return myPageDAO.myBuyerGetView(buyerboard_seq);
	}

	
	
	
	
}
