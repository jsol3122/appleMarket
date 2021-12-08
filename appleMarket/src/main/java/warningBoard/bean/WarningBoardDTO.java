package warningBoard.bean;

import java.util.Date;

import lombok.Data;

@Data
public class WarningBoardDTO {
	private int warning_seq;
	private int board_seq; 
	private String board_name; 
	private String comment_YN;
	private String warning_id;
	private String warning_category;
	private String warning_subject;
	private String warning_content;
	private String warning_image;
	private String member_id; 
	private Date warning_logtime;
	private String warning_status_YN;
}
