<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<form:form modelAttribute="scc_info">
    <form:hidden path="SCCNUM" />

    <input type="hidden" name="page" value="${pgn.page}">
    <input type="hidden" name="sizePerPage" value="${pgn.sizePerPage}">

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
    </table>
</form:form>


<script type="text/javascript"

        src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script type="text/javascript">
    $(document).ready(function() {

        var formObj = $("#scc_info");

        var pageObj = $('#page');
        var sizePerPageObj = $('#sizePerPage');
        var pageVal = pageObj.val();
        var sizePerPageVal = sizePerPageObj.val();


    });
</script>
