<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2>댓글 작성</h2>

<form:form modelAttribute="comment" action="register">

    <table>
        <tr>
            <td>내용</td>
            <td><form:input path="comment" /></td>
            <td><font color="red"><form:errors path="comment" /></font></td>
        </tr>

    </table>

</form:form>

<div>
    <sec:authorize access="isAuthenticated()">
        <button type="submit" id="btnRegister"><spring:message code="action.register"/></button>
    </sec:authorize>

    <button type="submit" id="btnList">취소</button>
</div>

<script type="text/javascript"

        src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script type="text/javascript">
    $(document).ready(function (){
        var formObj = $("#comment");

        $("#btnRegister").on("click", function () {
            formObj.submit();
        });

        $("#btnList").on("click", function () {
            self.location = "list"; //돌아갈 위치
        });

    });

</script>