<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<form:form modelAttribute="board" action="register">
    <form:hidden path="boardNo" />

    <input type="hidden" name="page" value="${pgrq.page}">
    <input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}">
    <input type="hidden" name="searchType" value="${pgrq.searchType}">
    <input type="hidden" name="keyword" value="${pgrq.keyword}">

    <table>
        <tr>
            <td><spring:message code="notice.title" /></td>
            <td><form:input path="title" cssStyle="width: 500px;height: 30px" readonly="true"/></td>
            <td><font color="red"><form:errors path="title" /></font></td>
        </tr>
        <tr>
            <td><spring:message code="notice.content" /></td>
            <td><form:textarea path="content" cssStyle="width: 500px;height: 500px" readonly="true"/></td>
            <td><font color="red"><form:errors path="content" /></font></td>
        </tr>
    </table>
</form:form>

<div>
    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <button type="submit" id="btnModify"><spring:message code="action.modify" /></button>
        <button type="submit" id="btnRemove"><spring:message code="action.remove" /></button>
    </sec:authorize>

    <button type="submit" id="btnList"><spring:message code="action.list" /></button>
</div>

<table>
    <tr>
        <td>${comment.content}</td>
        <td>작성자: ${comment.writer}</td>
        <td>등록일: ${comment.regDate}</td>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <button id="commentModify"><a href="" >수정</a></button>
            <button id="commentRemove"><a href="" >삭제</a></button>
        </sec:authorize>
    </tr>
</table>


<script type="text/javascript"

        src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script type="text/javascript">
    $(document).ready(function() {
        var formObj = $("#board");

        var pageObj = $("#page");
        var sizePerPageObj = $("#sizePerPage");

        var pageVal = pageObj.val();
        var sizePerPageVal = sizePerPageObj.val();

        $("#btnModify").on("click", function() {
            var boardNo = $("#boardNo");
            var boardNoVal = boardNo.val();

            self.location = "/notice/modify${pgrq.toUriString()}" + "&boardNo=" + boardNoVal;
        });

        $("#btnRemove").on("click", function() {
            formObj.attr("action", "/notice/remove");
            formObj.submit();
        });

        $("#btnList").on("click", function() {
            self.location = "list";
        });
    });
</script>