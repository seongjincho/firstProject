package org.yht.domain.test01;

import java.io.Serializable;
import java.util.Date;


/*
 -공지사항 OR 후기 게시판 OR QNA 

DROP TABLE TEST01_NOTICE
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_NOTICE;

CREATE TABLE TEST01_NOTICE(
NOTICE_SEQ NUMBER(8) PRIMARY KEY,
ID VARCHAR2(50) NOT NULL,
TITLE VARCHAR2(200) NOT NULL,
CONTENT VARCHAR2(2000) NOT NULL,
READCOUNT NUMBER(8) NOT NULL,
RDATE DATE NOT NULL
);

CREATE SEQUENCE SEQ_NOTICE
START WITH 1
INCREMENT BY 1;

ALTER TABLE TEST01_NOTICE
ADD CONSTRAINT FK_NOTICE_ID FOREIGN KEY(ID)
REFERENCES TEST01_MEMBER(ID);

 */

public class NoticeVo implements Serializable {

	private int notice_seq; // 공지사항 seq넘버 
	private String id;      // id 하지만 운영자만 
	private String title;   // 제목 
	private String content; // 내용
	private int readcount;  // 조회수 
	private Date rdate;     //  등록일 
	
	public NoticeVo() {
		
	}

	public NoticeVo(int notice_seq, String id, String title, String content, int readcount, Date rdate) {
		super();
		this.notice_seq = notice_seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.readcount = readcount;
		this.rdate = rdate;
	}

	public int getNotice_seq() {
		return notice_seq;
	}

	public void setNotice_seq(int notice_seq) {
		this.notice_seq = notice_seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	@Override
	public String toString() {
		return "NoticeVo [notice_seq=" + notice_seq + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", readcount=" + readcount + ", rdate=" + rdate + "]";
	}
	
	
}
