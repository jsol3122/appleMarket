package interestList.bean;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class InterestListDTO {
	 private int interestList_seq;
	 private String member_id;
	 private int sale_seq ;
	 private String sale_status;
	 private String sale_subject;
	 private int sale_price;
	 private Date sale_logtime;
	 private Date sale_update_logtime;
	 private int sale_heart_count;
	 private int sale_chat_count;
	 private String sale_image1;
}
