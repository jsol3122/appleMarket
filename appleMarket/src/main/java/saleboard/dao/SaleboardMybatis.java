package saleboard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;
import saleboard.bean.InterestDTO;
import saleboard.bean.SaleboardDTO;

@Repository
@Transactional // commit, close 해주는 것 
public class SaleboardMybatis implements SaleboardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void saleboardWrite(SaleboardDTO saleboardDTO) {
		String location_dong = sqlSession.selectOne("saleboardSQL.searchLocationDong", saleboardDTO);
		double member_reputation = sqlSession.selectOne("saleboardSQL.searchReputation", saleboardDTO);
		saleboardDTO.setLocation_dong(location_dong);
		saleboardDTO.setMember_reputation(member_reputation);
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
		String location_dong = sqlSession.selectOne("saleboardSQL.searchLocationDong", saleboardDTO);
		double member_reputation = sqlSession.selectOne("saleboardSQL.searchReputation", saleboardDTO);
		saleboardDTO.setLocation_dong(location_dong);
		saleboardDTO.setMember_reputation(member_reputation);
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
		String member_id = map.get("member_id");
		System.out.println("member_id="+member_id);
		
		SaleboardDTO saleboardDTO = member_idLoad(sale_seq);		
		saleboardDTO.setMember_id(member_id);
		
		System.out.println(saleboardDTO);
		// 게시글의 하트수 +1 증가 (update) saleboard : sale_heart_count 
		sqlSession.update("saleboardSQL.saleboardPick1", saleboardDTO);
		
		InterestDTO interestDTO = doubleCheck(saleboardDTO.getSale_seq());
		
		if(interestDTO==null) {
		// 찜테이블에 상품 새로 추가 (insert) interestList : member_id, sale_seq
			sqlSession.insert("saleboardSQL.saleboardPick2",saleboardDTO);	
		}else {
			sqlSession.update("saleboardSQL.intereUpdate", saleboardDTO);
		}
	}
	
	@Override
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

	@Override
	public void saleboardFollow(Map<String, String> map) {
		String member_id = map.get("member_id");
		String following_id = map.get("following_id"); // 로그인 세션 값 받아오기
		
		map.put("member_id", member_id);
		map.put("following_id", following_id);
		
		sqlSession.insert("saleboardSQL.saleboardFollow", map);
		
	}

	@Override
	public List<SaleboardDTO> saleboardGetListId(Map<String, Object> map) {
		return sqlSession.selectList("saleboardSQL.saleboardGetListId",map);
	}

	@Override
	public List<InterestDTO> getinterestList(String member_id) {
		return sqlSession.selectList("saleboardSQL.getinterestList", member_id);
		

	}

	@Override
	public void interestDelete(int interestList_seq) {
		sqlSession.delete("saleboardSQL.interestDelete",interestList_seq);
		
	}

	@Override
	public InterestDTO doubleCheck(int sale_seq) {
		return sqlSession.selectOne("saleboardSQL.doubleCheck", sale_seq);
	}

	
	@Override
	public void intereUpdate(int sale_seq) {

		sqlSession.update("saleboardSQL.intereUpdate", sale_seq);
		
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