package org.yht.domain.test01;

import java.io.Serializable;

/*
--join table  

DROP TABLE TEST01_JOIN
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_JOIN;

CREATE TABLE TEST01_JOIN(
JOIN_SEQ NUMBER(8) PRIMARY KEY,
ID VARCHAR2(50) NOT NULL,
FOOD_SEQ NUMBER(8) NOT NULL
);

CREATE SEQUENCE SEQ_JOIN
START WITH 1
INCREMENT BY 1;

ALTER TABLE TEST01_JOIN
ADD CONSTRAINT FK_JOIN_ID FOREIGN KEY(ID)
REFERENCES TEST01_MEMBER(ID);

ALTER TABLE TEST01_JOIN
ADD CONSTRAINT FK_JOIN_FSEQ FOREIGN KEY(FOOD_SEQ)
REFERENCES TEST01_FOOD(FOOD_SEQ);*/

public class JoinVo implements Serializable {
	
	private int join_seq;
	private String id;
	private int food_seq;
	
	public JoinVo() {
		
	}
	
	

	public JoinVo(String id, int food_seq) {
		super();
		this.id = id;
		this.food_seq = food_seq;
	}



	public JoinVo(int join_seq, String id, int food_seq) {
		super();
		this.join_seq = join_seq;
		this.id = id;
		this.food_seq = food_seq;
	}

	public int getJoin_seq() {
		return join_seq;
	}

	public void setJoin_seq(int join_seq) {
		this.join_seq = join_seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getFood_seq() {
		return food_seq;
	}

	public void setFood_seq(int food_seq) {
		this.food_seq = food_seq;
	}

	@Override
	public String toString() {
		return "JoinVo [join_seq=" + join_seq + ", id=" + id + ", food_seq=" + food_seq + "]";
	}

	
	
}
