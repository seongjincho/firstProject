package org.yht.domain.test01;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;

/*
 - 푸드 게시판 테이블 (TEST01_FOOD)
FOOD_SEQ(FOOD게시판 글번호, 기본키), ID(작성자 아이디,외래키),TITLE(글제목), 
TOTAL_CNT(총 인원수), JOIN_CNT(참여인원 수 AJAX 필요), MEETINGDAY(모임날짜 DATE PICKER),
CONTENT(내용), WDATE(글쓴날짜), READ_CNT(조회수), LIKE_CNT(좋아요 수, 좋아요 수의 TOTAL COUNT는 DB에서 COUNT로 갯수 파악 AJAX로 처리할 예정 )  , files[] (

토탈 참여인원을 놓고   참여버튼을 눌러야만 댓글을 쓸 수 있게 

조회수
DROP TABLE TEST01_FOOD
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_FOOD

CREATE TABLE TEST01_FOOD (

FOOD_SEQ NUMBER(8) PRIMARY KEY,
ID VARCHAR2(50) NOT NULL,
TITLE VARCHAR2(200) NOT NULL,
TOTAL_CNT NUMBER(8) NOT NULL,
JOIN_CNT NUMBER(8) NOT NULL,
MEETINGDAY DATE NOT NULL,
CONTENT VARCHAR2(4000) NOT NULL,
WDATE DATE NOT NULL,
READ_CNT NUMBER(8) NOT NULL,
LIKE_CNT NUMBER(8) NOT NULL,
LOCAL VARCHAR2(50) NOT NULL 

);

ALTER TABLE TEST01_FOOD
ADD CONSTRAINT FK_FOOD_ID FOREIGN KEY(ID)
REFERENCES TEST01_MEMBER(ID);

CREATE SEQUENCE SEQ_FOOD
START WITH 1
INCREMENT BY 1;


 */
public class FoodVo implements Serializable {

	private int food_seq; // food게시판 글 번호 
	private String id;    // 아이디
	private String title; // 글 제목
	private int total_cnt; // 총인원
	private int join_cnt;  // 참여인원
	private Date meetingDay; //  모임날짜 
	private String content;  // 내용
	private Date wdate;     // 작성일
	private int read_cnt;  // 조회수
	private int like_cnt;  // 좋아요 수
	private String local;  // 지역 지도검색용
	private String[] files;
	private String fullname;
	
	
	public FoodVo() {
		
	}


	public FoodVo(int food_seq, String id, String title, int total_cnt, int join_cnt, Date meetingDay, String content,
			Date wdate, int read_cnt, int like_cnt, String local, String[] files) {
		super();
		this.food_seq = food_seq;
		this.id = id;
		this.title = title;
		this.total_cnt = total_cnt;
		this.join_cnt = join_cnt;
		this.meetingDay = meetingDay;
		this.content = content;
		this.wdate = wdate;
		this.read_cnt = read_cnt;
		this.like_cnt = like_cnt;
		this.local = local;
		this.files = files;
	}

	
	// join해서 detail에 뿌려줄 용도 
	public FoodVo(int food_seq, String id, String title, int total_cnt, int join_cnt, Date meetingDay, String content,
				Date wdate, int read_cnt, int like_cnt, String local, String[] files, String fullname) {
			super();
			this.food_seq = food_seq;
			this.id = id;
			this.title = title;
			this.total_cnt = total_cnt;
			this.join_cnt = join_cnt;
			this.meetingDay = meetingDay;
			this.content = content;
			this.wdate = wdate;
			this.read_cnt = read_cnt;
			this.like_cnt = like_cnt;
			this.local = local;
			this.files = files;
			this.fullname = fullname;
		}


	public FoodVo(int food_seq, String id, String title, int total_cnt, int join_cnt, Date meetingDay, String content,
			Date wdate, int read_cnt, int like_cnt, String local) {
		super();
		this.food_seq = food_seq;
		this.id = id;
		this.title = title;
		this.total_cnt = total_cnt;
		this.join_cnt = join_cnt;
		this.meetingDay = meetingDay;
		this.content = content;
		this.wdate = wdate;
		this.read_cnt = read_cnt;
		this.like_cnt = like_cnt;
		this.local = local;
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


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public int getTotal_cnt() {
		return total_cnt;
	}


	public void setTotal_cnt(int total_cnt) {
		this.total_cnt = total_cnt;
	}


	public int getJoin_cnt() {
		return join_cnt;
	}


	public void setJoin_cnt(int join_cnt) {
		this.join_cnt = join_cnt;
	}


	public Date getMeetingDay() {
		return meetingDay;
	}


	public void setMeetingDay(Date meetingDay) {
		this.meetingDay = meetingDay;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Date getWdate() {
		return wdate;
	}


	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}


	public int getRead_cnt() {
		return read_cnt;
	}


	public void setRead_cnt(int read_cnt) {
		this.read_cnt = read_cnt;
	}


	public int getLike_cnt() {
		return like_cnt;
	}


	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}


	public String getLocal() {
		return local;
	}


	public void setLocal(String local) {
		this.local = local;
	}


	public String[] getFiles() {
		return files;
	}


	public void setFiles(String[] files) {
		this.files = files;
	}
	
	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}


	@Override
	public String toString() {
		return "FoodVo [food_seq=" + food_seq + ", id=" + id + ", title=" + title + ", total_cnt=" + total_cnt
				+ ", join_cnt=" + join_cnt + ", meetingDay=" + meetingDay + ", content=" + content + ", wdate=" + wdate
				+ ", read_cnt=" + read_cnt + ", like_cnt=" + like_cnt + ", local=" + local + ", files="
				+ Arrays.toString(files) + ", fullname=" + fullname + "]";
	}

	
	

	
	
}
