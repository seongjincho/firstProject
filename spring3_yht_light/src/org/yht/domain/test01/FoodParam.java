package org.yht.domain.test01;

import java.io.Serializable;

public class FoodParam implements Serializable {

	// search
	private String f_category; // 제목, 내용, 작성자
	private String f_keyword;  // 검색어 
	
	// paging
	private int recordCountPerPage = 10; // 표현할 한 페이지의 글수 10개씩 표현한다   
	private int pageNumber = 0;  		 // 페이지 번호  현재페이지 넘버 ?
	
	
	// start, end
	private int start = 1;
	private int end = 10;
	
	public FoodParam() {
		
	}

	public FoodParam(String f_category, String f_keyword) {
		super();
		this.f_category = f_category;
		this.f_keyword = f_keyword;
	}

	public String getF_category() {
		return f_category;
	}

	public void setF_category(String f_category) {
		this.f_category = f_category;
	}

	public String getF_keyword() {
		return f_keyword;
	}

	public void setF_keyword(String f_keyword) {
		this.f_keyword = f_keyword;
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
		return "BbsParam [f_category=" + f_category + ", f_keyword=" + f_keyword + ", recordCountPerPage="
				+ recordCountPerPage + ", pageNumber=" + pageNumber + ", start=" + start + ", end=" + end + "]";
	}
	
	
	
	
}
