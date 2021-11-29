package localCommunityboardComment.bean;

import java.util.Date;

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
	private Date localcommunity_comment_logtime;
}
