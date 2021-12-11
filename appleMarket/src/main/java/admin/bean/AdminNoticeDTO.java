package admin.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class AdminNoticeDTO {
	private int admin_notice_seq;
	private String admin_notice_pin_YN;
	private String admin_notice_subject;
	private String admin_notice_content;
	private String admin_notice_image;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd HH:mm")
	private Date admin_notice_logtime;
	
}
