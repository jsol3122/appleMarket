package communityboard.bean;

import java.util.Date;

import lombok.Data;



@Data
public class CommunityboardDTO {
	private int communityboard_seq;
	private String communityboard_subject;
	private String communityboard_content;
	private String communityboard_image;
	private int communityboard_hit;
	private Date communityboard_logtime;
	private String communityboard_user_id;
	private String searchType;
	private String keyword;
	
	
}
