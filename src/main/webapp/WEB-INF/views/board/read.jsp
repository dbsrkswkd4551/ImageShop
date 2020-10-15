<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<h2><spring:message code="board.header.read" /></h2>

<form:form modelAttribute="board">
    <form:hidden path="boardNo" />

    <input type="hidden" name="page" value="${pgrq.page}">
    <input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}">
    <input type="hidden" name="searchType" value="${pgrq.searchType}">
    <input type="hidden" name="keyword" value="${pgrq.keyword}">

    <table>
        <tr>
            <td><spring:message code="board.title" /></td>
            <td><form:input path="title" readonly="true" /></td>
            <td><font color="red"><form:errors path="title" /></font></td>
        </tr>
        <tr>
            <td><spring:message code="board.writer" /></td>
            <td><form:input path="writer" readonly="true" /></td>
            <td><font color="red"><form:errors path="writer" /></font></td>
        </tr>
        <tr>
            <td><spring:message code="board.content" /></td>
            <td><form:textarea path="content" readonly="true" /></td>
            <td><font color="red"><form:errors path="content" /></font></td>
        </tr>
        <tr>
            <td>평점</td>
            <td align="left">
                <c:choose>
                    <c:when test="${board.rating eq 1}">★☆☆☆☆</c:when>
                    <c:when test="${board.rating eq 2}">★★☆☆☆</c:when>
                    <c:when test="${board.rating eq 3}">★★★☆☆</c:when>
                    <c:when test="${board.rating eq 4}">★★★★☆</c:when>
                    <c:when test="${board.rating eq 5}">★★★★★</c:when>
                </c:choose>
            </td>
        </tr>
    </table>

</form:form>

<div>
    <sec:authentication property="principal" var="pinfo"/>

    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <button type="submit" id="btnEdit"><spring:message code="action.edit" /></button>
        <button type="submit" id="btnRemove"><spring:message code="action.remove" /></button>
    </sec:authorize>

    <sec:authorize access="hasRole('ROLE_MEMBER')">
        <c:if test="${pinfo.username eq board.writer}">
            <button type="submit" id="btnEdit"><spring:message code="action.edit" /></button>
            <button type="submit" id="btnRemove"><spring:message code="action.remove" /></button>
        </c:if>
    </sec:authorize>

    <button type="submit" id="btnList"><spring:message code="action.list" /></button>
</div>
<br/><br/>

    <!-- 댓글 작성 form-->
    <div>
        <sec:authentication property="principal" var="pinfo"/>

        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <button type="submit" id="btnEditRep"><spring:message code="action.edit" /></button>
            <button type="submit" id="btnRemoveRep"><spring:message code="action.remove" /></button>
            <button type="submit" id="btnRegisterRep"><spring:message code="action.remove" /></button>
        </sec:authorize>

        <sec:authorize access="hasRole('ROLE_MEMBER')">
            <button type="submit" id="btnRegisterRep" class="btn-primary">등록</button>
            <c:if test="${pinfo.username eq board.writer}">
                <button type="submit" id="btnEditRep" class="btn-primary"><spring:message code="action.edit" /></button>
                <button type="submit" id="btnRemoveRep" class="btn-primary"><spring:message code="action.remove" /></button>
            </c:if>
        </sec:authorize>

    </div>


    <!-- 댓글 출력 form -->
    <table border="1">
        <tr>
            <th align="center" width="320">내용</th>
            <th align="center" width="100"><spring:message code="board.writer" /></th>
            <th align="center" width="180"><spring:message code="board.regdate" /></th>
        </tr>
    <c:choose>
    <c:when test="${empty list}">
        <tr>
            <td colspan="3">
                <spring:message code="common.listEmpty" />
            </td>
        </tr>
    </c:when>
    <c:otherwise>
        <c:forEach items="${list}" var="comment">
            <tr>
                <td>${comment.content}</td>
                <td>${comment.writer}</td>
                <td>${comment.regDate}</td>
            </tr>
        </c:forEach>
    </c:otherwise>
    </c:choose>

    </table>



<script type="text/javascript"

        src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script type="text/javascript">
    $(document).ready(function() {
        var formObj = $("#board");
        //1~10
        var pageObj = $("#page");
        var sizePerPageObj = $("#sizePerPage");
        var pageVal = pageObj.val();
        var sizePerPageVal = sizePerPageObj.val();
        $("#btnEdit").on("click", function() {
            var boardNo = $("#boardNo");
            var boardNoVal = boardNo.val();
            self.location = "/board/modify${pgrq.toUriString()}" + "&boardNo=" + boardNoVal;
        });
        $("#btnRemove").on("click", function() {
            formObj.attr("action", "/board/remove");
            formObj.submit();
        });
        $("#btnList").on("click", function() {
            self.location = "/board/list${pgrq.toUriString()}";
        });

        var formObj2 = $("#comment");
        $("#btnEditRep").on("click", function() {
            var boardNo = $("#boardNo");
            var boardNoVal = boardNo.val();
            self.location = "/board/repRegister${pgrq.toUriString()}" + "&boardNo=" + boardNoVal;
        });
        $("#btnRemoveRep").on("click", function() {
            formObj.attr("action", "/board/remove");
            formObj.submit();
        });
        $("#btnRegisterRep").on("click", function() {
            self.location = "/board/list${pgrq.toUriString()}";
        });

    });
</script>