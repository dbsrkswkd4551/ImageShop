<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2>요양원 리스트</h2>

<form>
    <select name="search" onchange="Change(this)">
        <option value="none">=== 선택 ===</option>
        <option value="gangnam">강남구</option>
        <option value="gangseo">강서구</option>
    </select>
</form>

<table>
    <tr>
        <td id="select">선택</td>
    </tr>
    <tr>
        <td id="gangnam">강남구</td>
    </tr>
    <tr>
        <td id="gangseo">강서구</td>
    </tr>

</table>

<form:form modelAttribute="pgn" method="get" action="list${pgn.toUriStringByPage(1)}">
    <form:select path="searchType" items="${searchTypeCodeValueList}" itemValue="value" itemLabel="label"/>
    <form:input path="keyword"/>
    <button id="searchBtn"><spring:message code="action.search"/> </button>
</form:form>

<table border="1">
    <tr>
        <th align="center" width="40" scope="col">번호</th>
        <th align="center" width="300">타입</th>
        <th align="center" width="500">시설명</th>
        <th align="center" width="80">지역구</th>
    </tr>
    <c:forEach items="${list}" var="scc_info" varStatus="status">
        <tr>
            <td align="center">${pagination.totalCount- ((pageRequest.page - 1) * pagination.displayPageNum + status.index)}</td>
            <td align="center">${scc_info.SCCTYPE}</td>
            <td align="center"><a href="read?SCC_NUM=${scc_info.SCCNUM}">${scc_info.SCCNAME}</a></td>
            <td align="center">${scc_info.SCCDISTRICT}</td>
        </tr>
    </c:forEach>
</table>

<div>
        <c:if test="${pagination.prev}">
            <a href="/scc/list${pageRequest.toUriString(pagination.startPage-1)}&perPageNum=10">&laquo;</a>
        </c:if>

        <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
            <a href="/scc/list${pageRequest.toUriString(idx)}">${idx}</a>
        </c:forEach>

        <c:if test="${pagination.next && pagination.endPage > 0}">
            <a href="/scc/list${pageRequest.toUriString(pagination.endPage+1)}&perPageNum=10">&raquo;</a>
        </c:if>
</div>

<script type="text/javascript"

        src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script type="text/javascript">
    var result = "${msg}";

    if (result === "SUCCESS") {
        alert("<spring:message code='common.processSuccess' />");
    }

    $(document).ready(function() {

        $("#gangnam").on("click", function() { self.location = "/scc/list?searchType=d&keyword=강남구"});
        $("#gangseo").on("click", function() { self.location = "/scc/list?searchType=d&keyword=강서구"});

    });

    function Change(e) {
        if(e.value == "gangnam"){ self.location = "/scc/list?searchType=d&keyword=강남구"}
        if(e.value == "gangseo"){ self.location = "/scc/list?searchType=d&keyword=강서구"}
    }
</script>
