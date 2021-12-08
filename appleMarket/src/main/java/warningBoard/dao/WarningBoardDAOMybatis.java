package warningBoard.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import warningBoard.bean.WarningBoardDTO;

@Repository
@Transactional
public class WarningBoardDAOMybatis implements WarningBoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void warningBoardWrite(WarningBoardDTO warningBoardDTO) {
		sqlSession.insert("warningBoardSQL.warningBoardWrite", warningBoardDTO);
	}

}
