<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2><spring:message code="board.header.list" /></h2>

<form:form modelAttribute="pgrq" method="get" action="list${pgrq.toUriStringByPage(1)}">
    <form:select path="searchType" items="${searchTypeCodeValueList}" itemValue="value" itemLabel="label" />

    <form:input path="keyword" />
    <button id='searchBtn'><spring:message code="action.search" /></button>
</form:form>

<sec:authorize access="hasRole('ROLE_MEMBER')">
    <a href="register"><spring:message code="action.new" /></a>
</sec:authorize>

<table border="1">
    <tr>
        <th align="center" width="80"><spring:message code="board.no" /></th>
        <th align="center" width="320"><spring:message code="board.title" /></th>
        <th align="center" width="100"><spring:message code="board.writer" /></th>
        <th align="center" width="180"><spring:message code="board.regdate" /></th>
    </tr>
    <c:choose>
        <c:when test="${empty list}">
            <tr>
                <td colspan="4">
                    <spring:message code="common.listEmpty" />
                </td>
            </tr>
        </c:when>
        <c:otherwise>

            <c:forEach items="${list}" var="board" varStatus="status">
                <tr>
                    <td align="center">${pagination.totalCount - ((pgrq.page - 1) * pagination.displayPageNum + status.index)}</td>
                    <td align="left"><a href="/board/read${pgrq.toUriString(pgrq.page)}&boardNo=${board.boardNo}"><c:out value="${board.title}" /></a></td>
                    <td align="right">${board.writer}</td>
                    <td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${board.regDate}" /></td>
                </tr>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</table>

<div>
    <!-- startPage가 1일 경우 false 이므로 이전 페이지로 돌아가는 << 기호 출력안함 -->
    <!-- startPage가 11, 21,.... 일 경우 << 기호를 누르면 n-1 페이지로 돌아간다 -->
    <c:if test="${pagination.prev}">
        <a href="${pageRequest.toUriString(pagination.startPage-1)}">&laquo;</a>
    </c:if>

    <!-- 1~10페이지 까지 출력 c:forEach var=n begin=a end= b => a~b까지 n을 증가 시킨다(like for문)-->
    <c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="idx">
        <a href="/board/list${pageRequest.toUriString(idx)}">${idx}</a>
    </c:forEach>

    <!-- endPage가 0이상, 게시글의 총 숫자가 endPage * 10보다 클 경우 >> 기호 클릭 시 다음 페이지로 넘어간다 -->
    <c:if test="${pagination.next && pagination.endPage > 0}">
        <a href="${pageRequest.toUriString(pagination.endPage+1)}">&raquo;</a>
    </c:if>
</div>

<script>
    var result = "${msg}";

    if (result === "SUCCESS") {
        alert("<spring:message code='common.processSuccess' />");
    }
</script>
