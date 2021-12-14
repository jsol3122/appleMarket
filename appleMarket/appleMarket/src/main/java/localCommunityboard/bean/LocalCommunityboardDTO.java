package localCommunityboard.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class LocalCommunityboardDTO {
	private int localcommunity_seq;
	private String localcommunity_subject;
	private String location_dong;
	private String localcommunity_content;
	private String localcommunity_image;
	private int localcommunity_hit;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd HH:mm")
	private Date localcommunity_logtime;
	private String localcommunity_user_id;
	private String searchType;
	private String keyword;
	
}
