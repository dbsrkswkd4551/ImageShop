<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2>공지사항 등록</h2>

<form:form modelAttribute="board" action="register">
    <table>
        <tr>
            <td><spring:message code="board.title" /></td>
            <td><form:input path="title" cssStyle="width: 500px;height: 30px"/></td>
            <td><font color="red"><form:errors path="title" /></font></td>
        </tr>
        <tr>
            <td><spring:message code="notice.content" /></td>
            <td><form:textarea path="content" cssStyle="width: 500px;height: 500px"/></td>
            <td><font color="red"><form:errors path="content" /></font></td>
        </tr>
    </table>
</form:form>

<div>
    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <button type="submit" id="btnRegister" ><spring:message code="action.register"/></button>
    </sec:authorize>

    <button type="submit" id="btnList"><spring:message code="action.list"/></button>
</div>

<script type="text/javascript"

        src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script type="text/javascript">
    $(document).ready(function (){
        var formObj = $("#board");

        $("#btnRegister").on("click", function () {
            formObj.submit();
        });
        $("#btnList").on("click", function () {
            self.location = "list";
        });
    });
</script>