package org.yht.domain.test01;

import java.io.Serializable;

public class NoticeParam implements Serializable {

	// search
	private String n_category; // 제목, 내용, 작성자
	private String n_keyword;  // 검색어 
	
	// paging
	private int recordCountPerPage = 30; // 표현할 한 페이지의 글수 10개씩 표현한다   
	private int pageNumber = 0;  		 // 페이지 번호  현재페이지 넘버 ?
	
	
	// start, end
	private int start = 1;
	private int end = 10;
	
	public NoticeParam() {
		
	}
	
	public NoticeParam(String n_category, String n_keyword) {
		super();
		this.n_category = n_category;
		this.n_keyword = n_keyword;
	}

	public String getN_category() {
		return n_category;
	}

	public void setN_category(String n_category) {
		this.n_category = n_category;
	}

	public String getN_keyword() {
		return n_keyword;
	}

	public void setN_keyword(String n_keyword) {
		this.n_keyword = n_keyword;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	@Override
	public String toString() {
		return "NoticeParam [n_category=" + n_category + ", n_keyword=" + n_keyword + ", recordCountPerPage="
				+ recordCountPerPage + ", pageNumber=" + pageNumber + ", start=" + start + ", end=" + end + "]";
	}

	
	
}
