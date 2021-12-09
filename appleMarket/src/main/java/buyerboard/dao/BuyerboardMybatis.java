package buyerboard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import buyerboard.bean.BuyerboardDTO;

@Repository
@Transactional
public class BuyerboardMybatis implements BuyerboardDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BuyerboardDTO> buyerboardGetList(Map<String, Integer> map) {
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

}
