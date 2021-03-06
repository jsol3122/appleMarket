package buyerboard.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class BuyerboardDTO {
	private int buyerboard_seq;
	private String member_id;
	private String location_dong;
	private String buyerboard_category;
	private int buyerboard_price;
	private String buyerboard_subject;
	private String buyerboard_content;
	private String buyerboard_image1;
	private String buyerboard_image2;
	private String buyerboard_image3;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy.MM.dd")
	private Date buyerboard_logtime;
	private int buyerboard_chat_count;
	private int buyerboard_hit;
	private String buyer_status;
	
}
