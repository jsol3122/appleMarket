package localCommunityboard.bean;

import java.util.Date;

import lombok.Data;

@Data
public class LocalCommunityboardDTO {
	private int localcommunity_seq;
	private String localcommunity_subject;
	private String localcommunity_dong;
	private String localcommunity_content;
	private String localcommunity_image;
	private int localcommunity_hit;
	private Date localcommunity_logtime;
	private String localcommunity_user_id;
}
