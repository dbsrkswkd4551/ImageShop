<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2><spring:message code="useritem.header.read" /></h2>

<form:form modelAttribute="userItem">
    <form:hidden path="userItemNo" />

    <table>
        <tr>
            <td><spring:message code="useritem.itemName" /></td>
            <td><form:input path="itemName" readonly="true" /></td>
            <td><font color="red"><form:errors path="itemName" /></font></td>
        </tr>
        <tr>
            <td><spring:message code="useritem.itemPrice" /></td>
            <td><form:input path="price" readonly="true" /></td>
            <td><font color="red"><form:errors path="price" /></font></td>
        </tr>
        <tr>
            <td><spring:message code="useritem.itemFile" /></td>
            <td><img src="/item/display?itemId=${userItem.itemId}" width="210"></td>
        </tr>
        <tr>
            <td><spring:message code="useritem.itemDescription" /></td>
            <td><form:textarea path="description" readonly="true" /></td>
            <td><font color="red"><form:errors path="description" /></font></td>
        </tr>
    </table>

</form:form>

<div>
    <button type="submit" id="btnList"><spring:message code="action.list" /></button>
</div>


<script type="text/javascript"

        src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script type="text/javascript">
    $(document).ready(function() {

        var formObj = $("#useritem");

        $("#btnList").on("click", function() {
            self.location = "list";
        });

    });
</script>
