package localCommunityboardComment.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class LocalCommunityboardCommentDTO {
	private int localcommunity_seq;
	private int localcommunity_comment_seq;
	private String localcommunity_comment_content;
	private int localcommunity_comment_ref;
	private int localcommunity_comment_lev;
	private int localcommunity_comment_step;
	private int localcommunity_comment_pseq;
	private String localcommunity_comment_user_id;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd HH:mm")
	private Date localcommunity_comment_logtime;
}
