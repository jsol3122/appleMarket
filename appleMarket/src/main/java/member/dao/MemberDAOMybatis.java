package member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;
import member.bean.RecommendDTO;
import member.bean.ZipcodeDTO;

@Repository
@Transactional
public class MemberDAOMybatis implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void write(MemberDTO memberDTO) {
		sqlSession.insert("memberSQL.write", memberDTO);
		
	}
	
	@Override
	public MemberDTO checkId(String member_id) {
		return sqlSession.selectOne("memberSQL.checkId", member_id);
	}

	@Override
	public int login(MemberDTO memberDTO) {
		return sqlSession.selectOne("memberSQL.login", memberDTO);
		
	}

	@Override
	public List<ZipcodeDTO> getZipcodeList(String sido, String sigungu, String roadname) {
		
		Map<String,String>map = new HashMap<String, String>();
		map.put("sido", sido);
		map.put("sigungu", sigungu);
		map.put("roadname", roadname);
		
		return sqlSession.selectList("memberSQL.getzipcodeList", map);
	}

	@Override
	public void delete(MemberDTO memberDTO) {
		sqlSession.delete("memberSQL.delete",memberDTO);
		
	}

	@Override
	public void modify(MemberDTO memberDTO) {
		sqlSession.update("memberSQL.update",memberDTO);
		
	}

	@Override
	public MemberDTO searchId(String member_email) {
		return sqlSession.selectOne("memberSQL.idSearch", member_email);
	}

	@Override
	public MemberDTO searchPwd(String member_id, String member_email) {
		
		Map<String,String>map = new HashMap<String, String>();
		map.put("member_id", member_id);
		map.put("member_email", member_email);
		
		return sqlSession.selectOne("memberSQL.pwdSearch", map);		
	}

	@Override
	public void changePwd(MemberDTO memberDTO) {
		sqlSession.update("memberSQL.changePwd",memberDTO);
		
	}

	//이메일 중복체크
	@Override
	public int emailChk(String member_email) {
		
		return sqlSession.selectOne("memberSQL.emailChk", member_email);
	}

	@Override
	public void recommend(Map<String, String> map) {
		sqlSession.insert("memberSQL.recommend", map);
	}

	@Override
	public void recommended(Map<String, String> map) {		
		sqlSession.insert("memberSQL.recommended", map);	
	}
	
	@Override
	public int recommendChk(Map<String, String> map) {
		return sqlSession.selectOne("memberSQL.recommendChk", map);
	}

	@Override
	public List<RecommendDTO> recommendList(String member_id) {
		return sqlSession.selectList("memberSQL.recommendList",member_id);
	}

	@Override
	public void recommendCoupon(String member_id) {
		sqlSession.update("memberSQL.recommendCoupon",member_id);		
	}

}


