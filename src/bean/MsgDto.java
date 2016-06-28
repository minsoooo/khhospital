package bean;

public class MsgDto {
	
	private String cnt ;
	private String id;
	private String msg;
	private String user;
	
	
	public MsgDto(String cnt, String id, String msg, String user){
		this.cnt =cnt;
		this.id =id;
		this.msg =msg;
		this.user = user;
	}

	public String getUser() {
		return user;
	}

	public String getCnt() {
		return cnt;
	}

	public String getId() {
		return id;
	}

	public String getMsg() {
		return msg;
	}
	
	
}
