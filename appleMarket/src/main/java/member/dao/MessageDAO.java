package member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MessageDTO;

@Repository
@Transactional
public class MessageDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public void phoneCheck(MessageDTO messageDTO) {
		sqlSession.insert("phoneSQL.phoneCheck",messageDTO);
	}

	public MessageDTO checkSMS(String checknum) {
		return sqlSession.selectOne("phoneSQL.checkSMS", checknum);		
	}

	public MessageDTO CheckPhone(String phone) {
		return sqlSession.selectOne("phoneSQL.checkPhone",phone);
	}

	public void phoneUpdate(MessageDTO messageDTO) {
		sqlSession.update("phoneSQL.phoneUpdate", messageDTO);
		
	}
	
}
