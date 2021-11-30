package buyerboard.bean;

import java.util.Date;

import lombok.Data;

@Data
public class BuyerboardDTO {
	private int buyerboard_seq;
	private String member_id;
	private String location1_addr2;
	private String buyerboard_category;
	private int buyerboard_price;
	private String buyerboard_subject;
	private String buyerboard_content;
	private String buyerboard_image1;
	private String buyerboard_image2;
	private String buyerboard_image3;
	private Date buyerboard_logtime;
	private int buyerboard_chat_count;
	
}
