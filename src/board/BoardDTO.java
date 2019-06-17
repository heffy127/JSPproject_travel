package board;

/*num int(6) primary key,
-> writer varchar(20) not null,
-> preface varchar(20) not null,
-> subject varchar(50) not null,
-> content text not null,
-> reg_date varchar(10) not null,
-> readcount int(7) default 0,*/

public class BoardDTO {
	private int num;
	private String writer;
	private String preface;
	private String subject;
	private String content;
	private String reg_date;
	private int readcount;
	private int good;
	
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPreface() {
		return preface;
	}
	public void setPreface(String preface) {
		this.preface = preface;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
}
