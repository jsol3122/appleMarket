package saleboard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import saleboard.bean.SaleboardDTO;

@Repository
@Transactional
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
	public void saleboardDelete(int saleboard_seq) {
		sqlSession.delete("saleboardSQL.saleboardDelete");		
	}
	
	@Override
	public List<SaleboardDTO> saleboardGetView(int saleboard_seq) {
		return sqlSession.selectList("saleboardSQL.saleboardGetView", saleboard_seq);
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
