package member.bean;


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MessageDTO {
	private String phone; 
	private int certificationNumber;
    @DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date transmissionTime;
}
