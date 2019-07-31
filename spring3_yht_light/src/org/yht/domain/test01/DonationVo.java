package org.yht.domain.test01;

import java.io.Serializable;


/*
 --DONATION table  

DROP TABLE TEST01_DONATION
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_DONATION;

CREATE TABLE TEST01_DONATION(
DONATION_SEQ NUMBER(8) PRIMARY KEY,
ID VARCHAR2(50) NOT NULL,
NAME VARCHAR2(50) NOT NULL, 
PHONE VARCHAR2(50) NOT NULL,
DONATION NUMBER(10) NOT NULL
);

CREATE SEQUENCE SEQ_DONATION
START WITH 1
INCREMENT BY 1;

ALTER TABLE TEST01_DONATION
ADD CONSTRAINT FK_DONATION_ID FOREIGN KEY(ID)
REFERENCES TEST01_MEMBER(ID);
 */


public class DonationVo implements Serializable {
	
	private int donation_seq;
	private String id;
	private String name;
	private String phone;
	private int donation;
	
	public DonationVo() {
		
	}

	public DonationVo(int donation_seq, String id, String name, String phone, int donation) {
		super();
		this.donation_seq = donation_seq;
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.donation = donation;
	}

	public int getDonation_seq() {
		return donation_seq;
	}

	public void setDonation_seq(int donation_seq) {
		this.donation_seq = donation_seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getDonation() {
		return donation;
	}

	public void setDonation(int donation) {
		this.donation = donation;
	}

	@Override
	public String toString() {
		return "DonationVo [donation_seq=" + donation_seq + ", id=" + id + ", name=" + name + ", phone=" + phone
				+ ", donation=" + donation + "]";
	}
	
	
	
	
}
