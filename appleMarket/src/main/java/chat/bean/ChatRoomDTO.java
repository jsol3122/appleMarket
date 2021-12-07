package chat.bean;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChatRoomDTO {
	private int chatRoom_id;
	private String user_id;
	private String sale_seq;
	private String buyerboard_seq;
}
