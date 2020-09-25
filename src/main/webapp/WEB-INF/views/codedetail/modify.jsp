<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2><spring:message code="codedetail.header.modify" /></h2>

<form:form modelAttribute="codeDetail" action="modify">
    <table>
        <tr>
            <td><spring:message code="codedetail.groupCode" /></td>
            <td><form:select path="groupCode" items="${groupCodeList}" itemValue="value" itemLabel="label" readonly="true" /></td>
            <td><font color="red"><form:errors path="groupCode" /></font></td>
        </tr>
        <tr>
            <td><spring:message code="codedetail.codeValue" /></td>
            <td><form:input path="codeValue" /></td>
            <td><font color="red"><form:errors path="codeValue" /></font></td>
        </tr>
        <tr>
            <td><spring:message code="codedetail.codeName" /></td>
            <td><form:input path="codeName" /></td>
            <td><font color="red"><form:errors path="codeName" /></font></td>
        </tr>
    </table>
</form:form>

<div>
    <button type="submit" id="btnModify"><spring:message code="action.modify" /></button>
    <button type="submit" id="btnList"><spring:message code="action.list" /></button>
</div>

<script type="text/javascript"

        src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>


<script type="text/javascript">
    $(document).ready(function() {

        var formObj = $("#codeDetail");

        $("#btnModify").on("click", function() {
            formObj.submit();
        });

        $("#btnList").on("click", function() {
            self.location = "list";
        });

    });
</script>
