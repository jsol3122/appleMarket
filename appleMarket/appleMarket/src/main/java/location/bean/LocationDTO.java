package location.bean;

import java.util.Date;

import lombok.Data;
//locationConfirm
@Data
public class LocationDTO {
	private String member_id;
	private String location_addr;
	private String location_dong;
	private String location_latitude;
	private String location_longitude;
	private Date location_logtime;
}
