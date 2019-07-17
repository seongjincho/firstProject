package org.yht.domain.test01;

import java.io.Serializable;

/*
 - like 테이블 (TEST01_LIKE)

LIKE_SEQ(SEQ, 기본키) , FOOD_SEQ(글번호,외래키) , ID(아이디,외래키)
좋아요 수의 TOTAL COUNT는 DB에서 COUNT로 갯수 파악 

DROP TABLE TEST01_LIKE
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_LIKE;


CREATE TABLE TEST01_LIKE(
LIKE_SEQ NUMBER(8) PRIMARY KEY,
FOOD_SEQ NUMBER(8) NOT NULL,
ID VARCHAR2(50) NOT NULL
);

CREATE SEQUENCE SEQ_LIKE
START WITH 1
INCREMENT BY 1;

ALTER TABLE TEST01_LIKE
ADD CONSTRAINT FK_LIKE_FSEQ FOREIGN KEY(FOOD_SEQ)
REFERENCES TEST01_FOOD(FOOD_SEQ);

ALTER TABLE TEST01_LIKE
ADD CONSTRAINT FK_LIKE_ID FOREIGN KEY(ID)
REFERENCES TEST01_MEMBER(ID);
 */

public class LikeVo implements Serializable {

	private int like_seq; // 좋아요 seq넘버 기본키
	private int food_seq; // 원게시판 = food 게시판 seq넘버
	private String id;    // 좋아요를 누른 id 
	
	public LikeVo() {
		
	}
	
	
	public LikeVo(int food_seq, String id) {
		super();
		this.food_seq = food_seq;
		this.id = id;
	}


	public LikeVo(int like_seq, int food_seq, String id) {
		super();
		this.like_seq = like_seq;
		this.food_seq = food_seq;
		this.id = id;
	}

	public int getLike_seq() {
		return like_seq;
	}

	public void setLike_seq(int like_seq) {
		this.like_seq = like_seq;
	}

	public int getFood_seq() {
		return food_seq;
	}

	public void setFood_seq(int food_seq) {
		this.food_seq = food_seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "LikeVo [like_seq=" + like_seq + ", food_seq=" + food_seq + ", id=" + id + "]";
	}
	
	
}
