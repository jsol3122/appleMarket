package myPage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import buyerboard.bean.BuyerboardDTO;
import communityboard.bean.CommunityboardDTO;
import communityboardComment.bean.CommunityboardCommentDTO;
import localCommunityboard.bean.LocalCommunityboardDTO;
import localCommunityboardComment.bean.LocalCommunityboardCommentDTO;
import net.sf.json.JSONObject;
import saleboard.bean.SaleboardDTO;


@Repository
@Transactional
public class MyPageMybatis implements MyPageDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<CommunityboardDTO> myCommunityGetList(Map<String, String> map) {
	
		return sqlSession.selectList("myPageSQL.myCommunityGetList",map);
	}

	@Override
	public int myTotalA(String communityboard_user_id) {
		
		return sqlSession.selectOne("myPageSQL.myTotalA",communityboard_user_id);
	}

	@Override
	public CommunityboardDTO myCommunityGetView(int communityboard_seq) {
		String community_seq = communityboard_seq+"";
		return sqlSession.selectOne("communityboardSQL.communityboardGetView",community_seq);
	}

	@Override
	public List<CommunityboardCommentDTO> myCommunityCommentGetList(Map<String, String> map) {
		
		return sqlSession.selectList("myPageSQL.myCommunityCommentGetList", map);
	}

	@Override
	public int myCommentTotalA(String communityboard_comment_user_id) {
		
		return sqlSession.selectOne("myPageSQL.myCommentTotalA",communityboard_comment_user_id);
	}

	@Override
	public List<LocalCommunityboardDTO> myLocalGetList(Map<String, String> map) {
		return sqlSession.selectList("myPageSQL.myLocalGetList", map);
	}

	@Override
	public int myLocalTotalA(String localcommunity_user_id) {
		
		return sqlSession.selectOne("myPageSQL.myLocalTotalA",localcommunity_user_id);
	}

	@Override
	public LocalCommunityboardDTO myLocalGetView(int localcommunity_seq) {
		String local_seq = localcommunity_seq+"";
		
		return sqlSession.selectOne("localCommunityboardSQL.localCommunityboardGetView",local_seq);
	}

	@Override
	public List<LocalCommunityboardCommentDTO> myLocalCommentGetList(Map<String, String> map) {
		
		return sqlSession.selectList("myPageSQL.myLocalCommentGetList",map);
	}

	@Override
	public int myLocalCommentTotalA(String localcommunity_comment_user_id) {
		
		return sqlSession.selectOne("myPageSQL.myLocalCommentTotalA",localcommunity_comment_user_id);
	}

	@Override
	public List<SaleboardDTO> mySaleGetList(Map<String, String> map) {
	
		return sqlSession.selectList("myPageSQL.mySaleGetList",map);
	}

	@Override
	public int mySaleTotalA(String member_id) {
		
		return sqlSession.selectOne("myPageSQL.mySaleTotalA", member_id);
	}

	@Override
	public SaleboardDTO mySaleGetView(int sale_seq) {
		
		return sqlSession.selectOne("saleboardSQL.saleboardGetView", sale_seq);
	}

	@Override
	public List<BuyerboardDTO> myBuyerGetList(Map<String, String> map) {
		return sqlSession.selectList("myPageSQL.myBuyerGetList", map);
	}

	@Override
	public int myBuyerTotalA(String member_id) {
		
		return sqlSession.selectOne("myPageSQL.myBuyerTotalA",member_id);
	}

	@Override
	public BuyerboardDTO myBuyerGetView(int buyerboard_seq) {
		
		return sqlSession.selectOne("buyerboardSQL.buyerboardGetView",buyerboard_seq);
	}

	@Override
	public void buyhistoryDelete(int buyerboard_seq) {
		sqlSession.delete("myPageSQL.buyhistoryDelete", buyerboard_seq);
	}

	@Override
	public void salehistoryDelete(int sale_seq) {
		sqlSession.delete("myPageSQL.salehistoryDelete", sale_seq);
	}

	@Override
	public void localCommunityHistoryDelete(int localcommunity_seq) {
		sqlSession.delete("myPageSQL.localCommunityHistoryDelete", localcommunity_seq);
	}

	@Override
	public void communityHistoryDelete(int communityboard_seq) {
		sqlSession.delete("myPageSQL.communityHistoryDelete", communityboard_seq);
	}

	@Override
	public void myLocalCommentDelete(int localcommunity_comment_seq) {
		sqlSession.delete("myPageSQL.myLocalCommentDelete", localcommunity_comment_seq);
	}

	@Override
	public void myCommunityCommentDelete(int communityboard_comment_seq) {
		sqlSession.delete("myPageSQL.myCommunityCommentDelete", communityboard_comment_seq);
	}

	
	
	
	
	

}
