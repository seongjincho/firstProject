package org.yht.domain.test01;

import java.io.Serializable;
import java.util.Date;



/*
 - attach 테이블 (TEST01_attach)


FULLNAME(첨부파일 이름 , 기본키) , FOOD_SEQ(원 게시물 번호 , 외래키), RDATE(등록날짜) 

DROP TABLE TEST01_ATTACH
CASCADE CONSTRAINTS;

CREATE TABLE TEST01_ATTACH(

FULLNAME VARCHAR2(150) PRIMARY KEY,
FOOD_SEQ NUMBER(8) NOT NULL,
RDATE DATE NOT NULL
);

ALTER TABLE TEST01_ATTACH
ADD CONSTRAINT FK_ATTACH_FSEQ FOREIGN KEY(FOOD_SEQ)
REFERENCES TEST01_FOOD(FOOD_SEQ);
 */
public class AttachVo implements Serializable {

	private String fullname;  // 파일명
	private int food_seq;     // food게시판 seq넘버 
	private Date rdate;       // 파일 등록일
	
	
	public AttachVo() {
		
	}


	public AttachVo(String fullname, int food_seq, Date rdate) {
		super();
		this.fullname = fullname;
		this.food_seq = food_seq;
		this.rdate = rdate;
	}


	public String getFullname() {
		return fullname;
	}


	public void setFullname(String fullname) {
		this.fullname = fullname;
	}


	public int getFood_seq() {
		return food_seq;
	}


	public void setFood_seq(int food_seq) {
		this.food_seq = food_seq;
	}


	public Date getRdate() {
		return rdate;
	}


	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}


	@Override
	public String toString() {
		return "AttachVo [fullname=" + fullname + ", food_seq=" + food_seq + ", rdate=" + rdate + "]";
	}
	
	
	
}
