package communityboardComment.bean;

import java.util.Date;

import lombok.Data;

@Data
public class CommunityboardCommentDTO {
	private int communityboard_seq;
	private int communityboard_comment_seq;
	private String communityboard_comment_content;
	private int communityboard_comment_ref;
	private int communityboard_comment_lev;
	private int communityboard_comment_step;
	private int communityboard_comment_pseq;
	private String communityboard_comment_user_id;
	private Date communityboard_comment_logtime;
}
