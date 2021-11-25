package saleboard.bean;

import java.util.Date;

import lombok.Data;

@Data
public class SaleboardDTO {
	private int sale_seq; 
	private String sale_status;
	private String sale_subject;
	private int sale_price;
	private String sale_nego_YN;
	private String sale_category;
	private String sale_content;
	private String member_id;
	private int sale_hit;
	private Date sale_logtime;
	private Date sale_update_logtime;
	private int sale_update_count;
	private String sale_hide;
	private String sale_buyer;
	private String sale_image1;
	private String sale_image2;
	private String sale_image3;
	private String sale_image4;
	private String sale_image5;
	private String sale_topRank_YN;
	private String member_profilePic;
	private String location1_addr2;
	private int sale_chat_count;
	private int sale_heart_count;
	private String sale_free_YN;
	private String sale_ad_YN;
	private double member_reputation;
}
