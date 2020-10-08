package org.hdcd.common.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class Pagination {
    //페이지 목록 처리
    private int totalCount;
    private int startPage;
    private int endPage;
    private boolean prev;
    private boolean next;

    private int displayPageNum = 10;

    private PageRequest pageRequest;

    public void setPageRequest(PageRequest pageRequest) {
        this.pageRequest = pageRequest;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;

        calcData();
    }

    private void calcData() {
        endPage = (int) (Math.ceil(pageRequest.getPage() / (double)displayPageNum) * displayPageNum);
        //끝 페이지 번호 = Math.ceil(현재페이지/페이지 번호 갯수) * 페이지 번호 갯수
        //Math.ceil(1/10) => 1 * 10 = 10
        //Math.ceil 자리올림

        startPage = (endPage - displayPageNum) + 1;
        //10 - 10 + 1 = 1
        //게시글 목록, startPage = 1 - endPage = 10, (11,20), (21, 30), ... 순으로 증가
        
        int tempEndPage = (int) (Math.ceil(totalCount / (double)pageRequest.getSizePerPage()));
        //Math.ceil(503/10) = 51
        //totalCount = 전체 데이터 갯수

        if(endPage > tempEndPage) {
            endPage = tempEndPage;
        }
        //최종 페이지 51

        prev = startPage == 1 ? false : true;

        next = endPage * pageRequest.getSizePerPage() >= totalCount ? false : true;
        //endPage 10 * 10=100 >= totalCount=503, 게시글의 숫자 보다 endPage*10의 숫자가 적을 경우 true반환
    }
    public int getTotalCount(){
        return totalCount;
    }

    public int getStartPage() {
        return startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public boolean isPrev() {
        return prev;
    }

    public boolean isNext() {
        return next;
    }

    public int getDisplayPageNum() {
        return displayPageNum;
    }

    public PageRequest getPageRequest() {
        return pageRequest;
    }

    public String makeQuery(int page) {
        UriComponents uriComponents = UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("perPageNum", pageRequest.getSizePerPage())
                .build();

        return uriComponents.toUriString();
    }



}

