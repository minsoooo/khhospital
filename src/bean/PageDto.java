package bean;

public class PageDto {
	int totalRecord = 0;		// 전체 글의 갯수를 저장
	int numPerPage = 10;			// 한 페이지당 보여질 글의 개수, 보통은 10개씩 한다.
	int pagePerBlock = 5;		// 페이지를 묶어서 하나의 블럭으로, 보통은 10개당 1블럭씩 한다. (EX: 다음10개)
	int totalPage = 0; 			// 총 페이지 수
	int totalBlock = 0;			// 총 블럭의 갯수
	int nowPage = 0;			// 현재 페이지 번호(위치)
	int nowBlock = 0;			// 현재 블럭 번호 (다음 10개를 눌렀을때 10,20페이지 넘어가면 블럭번호)
	int beginPerPage = 0;		// 페이지 당 시작번호
	
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public int getPagePerBlock() {
		return pagePerBlock;
	}
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}
	public int getBeginPerPage() {
		return beginPerPage;
	}
	public void setBeginPerPage(int beginPerPage) {
		this.beginPerPage = beginPerPage;
	}
	
	
}
