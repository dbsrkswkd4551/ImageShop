<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2><spring:message code="board.header.register" /></h2>

<form:form modelAttribute="board" action="register">

    <table>
        <tr>
            <td>요양원명</td>
            <td><form:input path="title" /></td>
            <td><font color="red"><form:errors path="title" /></font></td>
        </tr>
        <tr>
            <td><spring:message code="board.writer" /></td>
            <td><form:input path="writer" readonly="true" /></td>
            <td><font color="red"><form:errors path="writer" /></font></td>
        </tr>
        <tr>
            <td><spring:message code="board.content" /></td>
            <td><form:textarea path="content" /></td>
            <td><font color="red"></font><form:errors path="content"/></td>
        </tr>
        <tr>
            <td>별점</td>
            <td><form:select path="rating">
                <form:option value="1" label="★☆☆☆☆"/>
                <form:option value="2" label="★★☆☆☆"/>
                <form:option value="3" label="★★★☆☆"/>
                <form:option value="4" label="★★★★☆"/>
                <form:option value="5" label="★★★★★"/>
                </form:select>
            </td>
        </tr>

    </table>

</form:form>

<div>
    <sec:authorize access="isAuthenticated()">
        <button type="submit" id="btnRegister"><spring:message code="action.register"/></button>
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