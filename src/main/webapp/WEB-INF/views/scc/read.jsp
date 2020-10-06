
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<c:forEach var="scc_info">
    <br>
    <p>${scc_info.SCCNAME}( ${scc_info.SCCGRADE} )</p>
    </br>
    <p>${scc_info.SCCADDRESS}</p>
    </br>
    <p>${scc_info.SCCPHONE}</p>
    </br>
    <table border="1">
        <tr>
            <th align="center" width="50">정원</th>
            <th align="center" width="50">현원</th>
            <th align="center" width="50">잔여</th>
            <th align="center" width="50">대기</th>
        </tr>
        <tr>
            <td align="center">${scc_info.TOTALNUM}</td>
            <td align="center">${scc_info.STATENUM}</td>
            <td align="center">${scc_info.REMAINEDNUM}</td>
            <td align="center">${scc_info.WAITINGNUM}</td>
        </tr>
    </table>
    <div>
        <a href="${scc_info.DETAILINFO}" target="_blank"/>상세정보
    </div>
</c:forEach>