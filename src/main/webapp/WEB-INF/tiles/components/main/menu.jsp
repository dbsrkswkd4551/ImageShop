<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div align="center">
    <table>
        <tr>
            <td width="80"><a href="/"><spring:message code="header.home" /></a></td>

            <!-- 로그인을 하지 않은 경우 true -->
            <sec:authorize access="!isAuthenticated()">
                <td width="120"><a href="/notice/list"><spring:message code="menu.notice.member"/></a></td>
                <td width="120"><a href="/faq/list">자주하는질문</a></td>
                <td width="120"><a href="/scc/list"><spring:message code="menu.board.scc" /></a></td>
            </sec:authorize>

                <!-- 관리자 권한을 가진 사용자인 경우 true-->
            <sec:authorize access="isAuthenticated()">
                <sec:authorize access="hasRole('ROLE_ADMIN')">

            <td width="120"><a href="/codegroup/list"><spring:message code="menu.codegroup.list" /></a></td>
            <td width="120"><a href="/codedetail/list"><spring:message code="menu.codedetail.list" /></a></td>
            <td width="120"><a href="/user/list"><spring:message code="menu.user.admin" /></a></td>
            <td width="120"><a href="/board/list"><spring:message code="menu.board.member" /></a></td>
            <td width="120"><a href="/notice/list"><spring:message code="menu.notice.member" /></a></td>
            <td width="120"><a href="/faq/list">자주하는질문</a></td>
            <td width="120"><a href="/scc/list"><spring:message code="menu.board.scc" /></a></td>
                </sec:authorize>

                <!-- 회원 권한을 가진 사용자인 경우 true -->
                <sec:authorize access="hasRole('ROLE_MEMBER')">
                    <td width="120"><a href="/board/list"><spring:message code="menu.board.member" /></a></td>
                    <td width="120"><a href="/notice/list"><spring:message code="menu.notice.member" /></a></td>
                    <td width="120"><a href="/faq/list">자주하는질문</a></td>
                    <td width="120"><a href="/scc/list"><spring:message code="menu.board.scc" /></a></td>
                </sec:authorize>

            </sec:authorize>

        </tr>
    </table>
</div>
<hr>
