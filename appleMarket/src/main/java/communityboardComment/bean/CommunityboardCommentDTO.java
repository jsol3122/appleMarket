package communityboardComment.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy.MM.dd")
	private Date communityboard_comment_logtime;
}
