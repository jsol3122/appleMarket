package location.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import location.bean.LocationDTO;

@Repository
@Transactional
public class LocationDAOMybatis implements LocationDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void write(LocationDTO locationDTO) {
		sqlSession.insert("locationSQL.write",locationDTO);
		
	}

	@Override
	public LocationDTO checkGPS(String member_id) {
		return sqlSession.selectOne("locationSQL.checkGPS", member_id);
		
	}

	@Override
	public void gpsUpdate(LocationDTO locationDTO) {
		sqlSession.update("locationSQL.gpsUpdate", locationDTO);
	}

}
