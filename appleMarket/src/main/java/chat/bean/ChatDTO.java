package chat.bean;

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChatDTO implements Serializable{
	private int chatRoom_id;
	private String sale_seq;
	private String buyerboard_seq;
	private int no;
	private String user_id;
	private String member_id;
	private int srNo;
	private String chatContent;
	private Date sendDate;
	}
