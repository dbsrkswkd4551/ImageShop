<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2>요양원 리스트</h2>

<table border="1">
    <tr>
        <th align="center" width="40">번호</th>
        <th align="center" width="200">타입</th>
        <th align="center" width="200">등급</th>
        <th align="center" width="300">시설명</th>
        <th align="center" width="40">총원</th>
        <th align="center" width="40">현재원</th>
        <th align="center" width="50">여유인원</th>
        <th align="center" width="50">대기인원</th>
        <th align="center" width="150">전화</th>
        <th align="center" width="80">지역구</th>
        <th align="center" width="250">주소</th>
        <th align="center" width="50">상세정보</th>
    </tr>
    <c:forEach items="${list}" var="scc_info">
        <tr>
            <td align="center">${scc_info.SCCNUM}</td>
            <td align="left">${scc_info.SCCTYPE}</td>
            <td align="center">${scc_info.SCCGRADE}</td>
            <td align="center">${scc_info.SCCNAME}</td>
            <td align="center">${scc_info.TOTALNUM}</td>
            <td align="center">${scc_info.STATENUM}</td>
            <td align="center">${scc_info.REMAINEDNUM}</td>
            <td align="center">${scc_info.WAITINGNUM}</td>
            <td align="center">${scc_info.SCCPHONE}</td>
            <td align="center">${scc_info.SCCDISTRICT}</td>
            <td align="center">${scc_info.SCCADDRESS}</td>
            <td align="center"><a href="${scc_info.DETAILINFO}" target="_blank"/>Link</td>
        </tr>
    </c:forEach>


</table>

<div>
    <c:if test="${pagination.prev}">
        <a href="/scc/list?page=${pagination.startPage-1}&perPageNum=10">&laquo;</a>
    </c:if>

    <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
        <a href="/scc/list${pagination.makeQuery(idx)}">${idx}</a>
    </c:forEach>

    <c:if test="${pagination.next && pagination.endPage > 0}">
        <a href="/scc/list?page=${pagination.endPage + 1}&perPageNum=10">&raquo;</a>
    </c:if>
</div>

<script type="text/javascript"

        src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script type="text/javascript">
    var result = "${msg}";

    if (result === "SUCCESS") {
        alert("<spring:message code='common.processSuccess' />");
    }
</script>
