package member.bean;

import java.util.Date;

import org.springframework.lang.Nullable;

import lombok.Data;

@Data
public class RecommendDTO {
	public String recommend_id;
	public String recommended_id;
	public Date recommend_logtime;
	public String recommend_YN;
	
}

