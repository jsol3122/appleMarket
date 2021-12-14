package communityboard.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;



@Data
public class CommunityboardDTO {
	private int communityboard_seq;
	private String communityboard_subject;
	private String communityboard_content;
	private String communityboard_image;
	private int communityboard_hit;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy.MM.dd")
	private Date communityboard_logtime;
	private String communityboard_user_id;

//db랑 안맞아서 주석	
//	private String searchType;
//	private String keyword;
	
	
}
