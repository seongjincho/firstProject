package org.yht.domain.test01;

import java.io.Serializable;
import java.util.Date;

/*
 - TEST01_REPLY)  
JSP include로 처리 
REPLY_SEQ(댓글번호,PRIMARY KEY) , ID(아이디, 외래키 MEMBER?), CONTENT(내용),
REF(),STEP() ,DEPTH(),WDATE(글 작성 날짜),DEL(삭제), FOOD_SEQ(원래게시판 번호 , 외래키 FOOD)


DROP TABLE TEST01_REPLY
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_REPLY;


CREATE TABLE TEST01_REPLY(
REPLY_SEQ NUMBER(8) PRIMARY KEY,
ID VARCHAR2(50) NOT NULL,
CONTENT VARCHAR2(2000) NOT NULL,
REF NUMBER(8) NOT NULL,
STEP NUMBER(8) NOT NULL,
DEPTH NUMBER(8) NOT NULL,
WDATE DATE NOT NULL,
DEL NUMBER(1) NOT NULL,
FOOD_SEQ NUMBER(8) NOT NULL
);

CREATE SEQUENCE SEQ_REPLY
START WITH 1
INCREMENT BY 1;


ALTER TABLE TEST01_REPLY
ADD CONSTRAINT FK_REPLY_FSEQ FOREIGN KEY(FOOD_SEQ)
REFERENCES TEST01_FOOD(FOOD_SEQ);

ALTER TABLE TEST01_REPLY
ADD CONSTRAINT FK_REPLY_ID FOREIGN KEY(ID)
REFERENCES TEST01_MEMBER (ID);
 */

public class ReplyVo implements Serializable {

	private int reply_seq; // 댓글 번호 기본키 
	private String id;     // 댓글 작성 아이디 
	private String content; // 내용 
	private int ref;        //  ex) 1-0-0
	private int step;       // 글  아래위 이동 
	private int depth;      // 옆으로 밀기 
	private Date wdate;     // 작성일 
	private int del;        // 삭제 유무 0 ,1
	private int food_seq;   // food 게시판 seq넘버
	
	public ReplyVo() {
		
	}

	public ReplyVo(int reply_seq, String id, String content, int ref, int step, int depth, Date wdate, int del,
			int food_seq) {
		super();
		this.reply_seq = reply_seq;
		this.id = id;
		this.content = content;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
		this.wdate = wdate;
		this.del = del;
		this.food_seq = food_seq;
	}

	public int getReply_seq() {
		return reply_seq;
	}

	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public int getFood_seq() {
		return food_seq;
	}

	public void setFood_seq(int food_seq) {
		this.food_seq = food_seq;
	}

	@Override
	public String toString() {
		return "ReplyVo [reply_seq=" + reply_seq + ", id=" + id + ", content=" + content + ", ref=" + ref + ", step="
				+ step + ", depth=" + depth + ", wdate=" + wdate + ", del=" + del + ", food_seq=" + food_seq + "]";
	}
	
	
	
	
	
}
