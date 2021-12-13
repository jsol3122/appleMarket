package saleboard.bean;

import java.util.Date;

import lombok.Data;

@Data
public class InterestDTO {
	private int interestList_seq;
	private String member_id; 
	private int sale_seq;
	private String sale_status;
	private int sale_price;
	private String sale_subject;
	private Date sale_logtime; 
	private Date sale_update_logtime;
	private int heart_count; 
	private String sale_heart_yn;
	private int sale_chat_count;
	private String sale_image1;
	
}
