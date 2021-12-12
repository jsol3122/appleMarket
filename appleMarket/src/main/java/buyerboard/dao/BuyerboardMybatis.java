package buyerboard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import buyerboard.bean.BuyerboardDTO;
import saleboard.bean.InterestDTO;
import saleboard.bean.SaleboardDTO;

@Repository
@Transactional
public class BuyerboardMybatis implements BuyerboardDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BuyerboardDTO> buyerboardGetList(Map<String, Object> map) {
		return sqlSession.selectList("buyerboardSQL.buyerboardGetList",map);
	}

	@Override
	public int getTotalA() {
		
		return sqlSession.selectOne("buyerboardSQL.getTotalA");
	}

	@Override
	public void buyerboardWrite(BuyerboardDTO buyerboardDTO) {
		String location_dong = sqlSession.selectOne("buyerboardSQL.searchLocationDong", buyerboardDTO);
		buyerboardDTO.setLocation_dong(location_dong);
		sqlSession.insert("buyerboardSQL.buyerboardWrite",buyerboardDTO);
	}

	@Override
	public void buyerboardModify(BuyerboardDTO buyerboardDTO) {
		String location_dong = sqlSession.selectOne("buyerboardSQL.searchLocationDong", buyerboardDTO);
		buyerboardDTO.setLocation_dong(location_dong);
		sqlSession.update("buyerboardSQL.buyerboardModify",buyerboardDTO);
	}

	@Override
	public void buyerboardDelete(int buyerboard_seq) {
		sqlSession.delete("buyerboardSQL.buyerboardDelete",buyerboard_seq);
		
	}

	@Override
	public List<BuyerboardDTO> buyerboardGetView(int buyerboard_seq) {
		
		return sqlSession.selectList("buyerboardSQL.buyerboardGetView",buyerboard_seq);
	}

	@Override
	public void buyerboardHit(int buyerboard_seq) {
		
		sqlSession.update("buyerboardSQL.buyerboardHit",buyerboard_seq);
	}

	@Override
	public List<BuyerboardDTO> buyerboardGetListId(Map<String, Object> map) {
		return sqlSession.selectList("buyerboardSQL.buyerboardGetListId",map);
	}
	//카테고리 조회
	@Override
	public List<BuyerboardDTO> boardcategoryFilter(String buyerboard_category) {
		return sqlSession.selectList("buyerboardSQL.boardcategoryFilter",buyerboard_category);
		
	}

	@Override
	public void buyerboardPick(Map<String, String> map) {
		String buyerboard_seq = map.get("buyerboard_seq");
		String member_id = map.get("member_id");
		System.out.println("member_id="+member_id);
		
		BuyerboardDTO buyerboardDTO = member_idLoad(buyerboard_seq);		
		buyerboardDTO.setMember_id(member_id);
		
		System.out.println(buyerboardDTO);
		
		InterestDTO interestDTO = buyerdoubleCheck(buyerboardDTO.getBuyerboard_seq());
		
		if(interestDTO==null) {
		// 찜테이블에 상품 새로 추가 (insert) interestList : member_id, sale_seq
			sqlSession.insert("buyerboardSQL.buyerboardPick",buyerboardDTO);	
		}else {
			sqlSession.update("buyerboardSQL.intereUpdate", buyerboardDTO);
		}
		
	}
	
	@Override
	public InterestDTO buyerdoubleCheck(int buyerboard_seq) {

		return sqlSession.selectOne("buyerboardSQL.doubleCheck", buyerboard_seq);
	}

	@Override
	public BuyerboardDTO member_idLoad(String buyerboard_seq) {
		BuyerboardDTO buyerboardDTO = sqlSession.selectOne("buyerboardSQL.member_idLoad", buyerboard_seq);
		return buyerboardDTO;
	}

}
