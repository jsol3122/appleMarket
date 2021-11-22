package member.bean;

import java.sql.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

import lombok.Data;

@Data
public class MemberDTO {
	
	private int member_seq; 
	
	@NotBlank
	@Length(min=5)
	private String member_id;
	
	@NotBlank
	@Pattern(regexp="^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$")//원래 / 하나인데 이클립스에서 두개 써야지 오류가 안난다.
	private String member_pwd; 
	
	@NotBlank
	@Email
	private String member_email; 
	
	private int member_tel1;
	private int member_tel2;
	private int member_tel3;
	private String member_sido; 
	private String member_sigungu; 
	private String member_address; 
	private String member_detailAddr;
	private int member_gender; 
	private int member_reputation; 
	private int member_warning; 
	private String member_profilePic;
	private Date member_entryLogtime;
	private String member_gps;
}
