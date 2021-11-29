package saleboard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import saleboard.bean.SaleboardDTO;

@Repository
@Transactional // commit, close 해주는 것 
public class SaleboardMybatis implements SaleboardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void saleboardWrite(SaleboardDTO saleboardDTO) {
		sqlSession.insert("saleboardSQL.saleboardWrite", saleboardDTO);
	}
	
	@Override
	public List<SaleboardDTO> saleboardGetList(Map<String, Integer> map) {
		return sqlSession.selectList("saleboardSQL.saleboardGetList",map);
	}
	
	@Override
	public int getTotalA() {
		return sqlSession.selectOne("saleboardSQL.getTotalA");
	}
	
	@Override
	public void saleboardModify(SaleboardDTO saleboardDTO) {
		sqlSession.update("saleboardSQL.saleboardModify", saleboardDTO);
	}

	@Override
	public void saleboardDelete(int sale_seq) {
		sqlSession.delete("saleboardSQL.saleboardDelete", sale_seq);		
	}
	
	@Override
	public List<SaleboardDTO> saleboardGetView(int sale_seq) {
		System.out.println("mybatis");
		return sqlSession.selectList("saleboardSQL.saleboardGetView", sale_seq);
	}

	@Override
	public void saleboardPick(Map<String, String> map) {
		String sale_seq = map.get("sale_seq");
		
		SaleboardDTO saleboardDTO = member_idLoad(sale_seq);		
		
		map.put("member_id", saleboardDTO.getMember_id());
		map.put("sale_seq", saleboardDTO.getSale_seq()+""); // map.get 으로 받아왔는데 또 해줘야 하나?
		
		// 게시글의 하트수 +1 증가 (update) saleboard : sale_heart_count 
		sqlSession.update("saleboardSQL.saleboardPick1", saleboardDTO);
		
		// 찜테이블에 상품 새로 추가 (insert) interestList : member_id, sale_seq
		sqlSession.insert("saleboardSQL.saleboardPick2",map);		
	}
	
	public SaleboardDTO member_idLoad(String sale_seq) {
		SaleboardDTO saleboardDTO = sqlSession.selectOne("saleboardSQL.member_idLoad", sale_seq);
		return saleboardDTO;
	}

	@Override
	public void saleboardPickCancel(Map<String, String> map) {
		String sale_seq = map.get("sale_seq");
		
		SaleboardDTO saleboardDTO = member_idLoad(sale_seq);		
		
		map.put("member_id", saleboardDTO.getMember_id());
		map.put("sale_seq", saleboardDTO.getSale_seq()+""); // map.get 으로 받아왔는데 또 해줘야 하나?
		
		// 게시글의 하트수 -1 감소 (update) saleboard : sale_heart_count 
		sqlSession.update("saleboardSQL.saleboardPickCancel1", saleboardDTO);
		
		// 찜테이블에 추가됐던 상품 삭제 (delete) interestList : member_id, sale_seq
		sqlSession.delete("saleboardSQL.saleboardPickCancel2",map);		
	}

	@Override
	public void saleboardHit(int sale_seq) {
		sqlSession.update("saleboardSQL.saleboardHit", sale_seq);		
	}

	@Override
	public List<SaleboardDTO> saleboardSearch(SaleboardDTO saleboardDTO) {
		return sqlSession.selectList("saleboardSQL.saleboardSearch", saleboardDTO);
	}
	

	/*
	@Override
	public List<SaleboardDTO> saleboardGetList() {
		return sqlSession.selectList("saleboardSQL.SaleboardGetList");
	}
	/*
	@Override
	public void searchSale_id(String sale_id) {
		sqlSession.selectOne("saleboardSQL.searchSale_id", sale_id);	}

	
	
	@Override
	public void searchSale_subject(String sale_subject) {
		sqlSession.selectOne("saleboardSQL.searchSale_subject", sale_subject);				
	}

	@Override
	public void searchSale_content(String sale_content) {
		sqlSession.selectOne("saleboardSQL.searchSale_content", sale_content);
	}

	@Override
	public List<SaleboardDTO> getSale_idList() {
		return sqlSession.selectList("saleboardSQL.getSale_idList");	}

	}

	@Override
	public void saleboardPick(SaleboardDTO saleboardDTO) {
		sqlSession.insert("saleboardSQL.saleboardPick", saleboardDTO);		
	}

	
	  @Override public void saleboardChat(String sale_id) {
	  sqlSession.insert("saleboardSQL.saleboardChat", sale_id);
	  
	  }
	 */




}
