package org.board.domain;


import java.util.Date;

public class BoardVO {
	
	private Integer b_no;
	
	private String title;
	
	private String content;
	
	private String writer;
	
	private Date regDate;
	
	private int viewcnt;
	
	private int replycnt;
	
	private String[] files;
	private int filecnt;

	public Integer getB_no() {
		return b_no;
	}

	public void setB_no(Integer b_no) {
		this.b_no = b_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	
	
	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public int getReplycnt() {
		return replycnt;
	}

	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}

	
	
	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
		
		
		// 스스로 첨부파일 개수의 상태를 가질 수 있게 해줌
		// 외부에서 setFiles() 호출하여 게시글의 첨부파일 개수를 넣어주지 않아도 된다.
		setFilecnt(files.length);
	}

	public int getFilecnt() {
		return filecnt;
	}

	public void setFilecnt(int filecnt) {
		this.filecnt = filecnt;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "BoardVO [bno=\" + bno + \", title=\" + title + \", content=\"\r\n" + 
				"				+ content + \", writer=\" + writer + \", regdate=\" + regdate\r\n" + 
				"				+ \", viewcnt=\" + viewcnt + \", replycnt=\" + replycnt\r\n" + 
				"				+ \", files=\" + Arrays.toString(files) + \"]";
	}
	
	

}
