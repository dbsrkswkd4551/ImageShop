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

<!-- 댓글 작성 form -->
<div class="container">
    <label for="content">comment</label>
    <form id="commentInsertForm" name="commentInsertForm">
        <div class="input-group">
        <input type="text" class="form-control" id="content" placeholder="댓글 작성">
        <span class="input-group-btn">
            <button class="btn btn-default" type="submit" id="commentInsertBtn">등록</button>
        </span>
        </div>
    </form>
</div>

<!-- 댓글 출력 form -->
<div class="container">
    <div class="commentList"></div>

</div>


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
