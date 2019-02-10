package org.board.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.board.domain.SearchCriteria;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker{
	
	private int totalCount;	// 게시판 전체 데이터 개수
	private int startPage;	// 현재 화면에서 보이는 startPage 번호
	private int endPage;	// 현재 화면에 보이는 endPage 번호
	private boolean prev;	// 이전 버튼 활성화 여부
	private boolean next;	// 다음 버튼 활성화 여부
	
	private int displayPageNum = 10;	 // 게시판 화면에서 한번에 보여질 페이지 번호의 개수 ( 1,2,3,4,5,6,7,9,10)
	
	private Criteria cri;

	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	private void calcData() {
		// TODO Auto-generated method stub
		
		endPage = (int)(Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum);
		
		startPage = (endPage - displayPageNum) + 1;
		
		// 게시판의 실제 마지막 페이지 번호
		int tempEndPage = (int)(Math.ceil(totalCount / (double)cri.getPerPageNum()));
		
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}
	
	public String makeQuery(int page) {
		
		UriComponents uriCom = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.build();
		return uriCom.toUriString();
	}
	
	   public String makeSearch(int page) {

	        UriComponents uriComponents = UriComponentsBuilder.newInstance()
	                .queryParam("page", page)
	                .queryParam("perPageNum", cri.getPerPageNum())
	                .queryParam("searchType", ((SearchCriteria) cri).getSearchType())
	                .queryParam("keyword", encoding(((SearchCriteria) cri).getKeyword()))
	                .build();

	        return uriComponents.toUriString();
	    }

	    private String encoding(String keyword) {
	        if (keyword == null || keyword.trim().length() == 0) {
	            return "";
	        }

	        try {
	            return URLEncoder.encode(keyword, "UTF-8");
	        } catch (UnsupportedEncodingException e) {
	            return "";
	        }
	    }

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public Criteria getCri() {
		return cri;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
	}
	
	

}
