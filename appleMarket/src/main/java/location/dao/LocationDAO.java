package location.dao;

import location.bean.LocationDTO;

public interface LocationDAO {
	
	public void write(LocationDTO locationDTO);

	public LocationDTO checkGPS(String member_id);

	public void gpsUpdate(LocationDTO locationDTO);

	


}
