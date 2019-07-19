package org.yht.domain.test01;

import java.io.Serializable;



/*
 멤버 테이블 (TEST01_MEMBER)

ID(아이디), PWD(비번), NAME(이름), EMAIL(이메일), ADDRESS1(주소1), ADDRESS2(주소2) ,
 AUTH(권한 관리자 3 , 일반회원 1 ) , PHONE(핸드폰번호), DEL(탈퇴 유무), AUTHKEY(이메일 체크검증), AUTHSTATUS(이메일 확인 유무)  

DROP TABLE TEST01_MEMBER
CASCADE CONSTRAINTS;

CREATE TABLE TEST01_MEMBER (
ID VARCHAR2(50) PRIMARY KEY,
PWD VARCHAR2(50) NOT NULL,
NAME VARCHAR2(50) NOT NULL,
EMAIL VARCHAR2(50) UNIQUE NOT NULL,
ADDRESS1 VARCHAR2(50) NOT NULL,
ADDRESS2 VARCHAR2(50),
AUTH NUMBER(1) NOT NULL,
PHONE VARCHAR2(50) UNIQUE NOT NULL,
DEL NUMBER(1) NOT NULL,
AUTHKEY VARCHAR2(50),
AUTHSTATUS NUMBER(1) NOT NULL
);

*/



public class MemberVo implements Serializable {
	
	
	private String id;  // 아이디
	private String pwd; // 비번
	private String name; // 이름
	private String email; // 이메일
	private String address1; // 주소1
	private String address2; // 주소2
	private int auth;  		 // 사용자 권한(관리자 3, 일반회원 1)
	private String phone; 	 // 폰번호 
	private int del;		 // 삭제 (0 정상  , 1 삭제) 
	private String authkey;  // 이메일 인증 키 
	private int authstatus; // 이메일 인증 (0 안됨, 1 인증됨)
	
	public MemberVo() {
		
	}

	
	
	public MemberVo(String id, String name, String email, String phone) {   // 참여자 정보 가져오기 foodJoin에서 사용될 
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
	}



	public MemberVo(String id, String pwd, String name, String email, String address1, String address2, int auth,
			String phone, int del, String authkey, int authstatus) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.address1 = address1;
		this.address2 = address2;
		this.auth = auth;
		this.phone = phone;
		this.del = del;
		this.authkey = authkey;
		this.authstatus = authstatus;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public String getAuthkey() {
		return authkey;
	}

	public void setAuthkey(String authkey) {
		this.authkey = authkey;
	}

	public int getAuthstatus() {
		return authstatus;
	}

	public void setAuthstatus(int authstatus) {
		this.authstatus = authstatus;
	}

	@Override
	public String toString() {
		return "MemberVo [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", address1=" + address1
				+ ", address2=" + address2 + ", auth=" + auth + ", phone=" + phone + ", del=" + del + ", authkey="
				+ authkey + ", authstatus=" + authstatus + "]";
	}

	

	
	
	
	
	
}
