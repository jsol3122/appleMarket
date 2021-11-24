package member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;
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

}