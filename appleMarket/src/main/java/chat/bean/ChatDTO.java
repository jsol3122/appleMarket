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
	private int no;
	private String memberId;
	private int srNo;
	private String chatContent;
	private Date sendDate;
	private int chatRoom_id;
	private String vaildYN;
	private String board_seq;
}
