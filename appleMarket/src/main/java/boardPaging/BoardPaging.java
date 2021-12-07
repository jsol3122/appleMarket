package boardPaging;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class BoardPaging {
	private int currentPage; //현재페이지
	private int pageBlock;//[이전][1][2][3][다음]
	private int pageSize;//1페이지당 ?개씩
	private int totalA;//총글수
	private StringBuffer pagingHTML;
	
	
	public void makePagingHTML() {

		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+(pageSize-1))/pageSize; //총페이지 수
//		
//		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
//		int endPage = startPage+pageBlock -1;
//		if(endPage>totalP) {
//			endPage = totalP;
//		}
		
		pagingHTML.append("<a class='direction prev' ><i class='fa fa-angle-left'></i> Prev</a>");
		
		for(int i=1; i<=totalP; i++) {
			if(i==currentPage) {
				pagingHTML.append("<a class='paging' >"+i+"</a>");
			}else {
				pagingHTML.append("<a class='paging' >"+i+"</a>");
			}
		}//for
		
		pagingHTML.append("<a class='direction next' >Next <i class='fa fa-angle-right'></i></a>");
		
		
		
		
	}

}
