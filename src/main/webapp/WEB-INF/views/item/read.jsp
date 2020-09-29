<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2><spring:message code="item.header.read" /></h2>

<form:form modelAttribute="item" action="buy">
    <form:hidden path="itemId" />
    <form:hidden path="pictureUrl" />
    <form:hidden path="previewUrl" />

    <table>
        <tr>
            <td><spring:message code="item.itemName" /></td>
            <td><form:input path="itemName" readonly="true" /></td>
            <td><font color="red"><form:errors path="itemName" /></font></td>
        </tr>
        <tr>
            <td><spring:message code="item.itemPrice" /></td>
            <td><form:input path="price"/>&nbsp;원</td>
            <td><font color="red"><form:errors path="price" /></font></td>
        </tr>
        <tr>
            <td><spring:message code="item.preview" /></td>
            <td><img src="display?itemId=${item.itemId}" width="210"></td>
        </tr>
        <tr>
            <td><spring:message code="item.itemDescription" /></td>
            <td><form:input path="description"/></td>
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

        var formObj = $("#item");

        $("#btnBuy").on("click", function() {
            formObj.submit();
        });

        $("#btnList").on("click", function() {
            self.location = "list";
        });

    });
</script>
