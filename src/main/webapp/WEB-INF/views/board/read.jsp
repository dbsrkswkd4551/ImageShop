<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<h2><spring:message code="board.header.read" /></h2>

<form:form modelAttribute="board">
    <form:hidden path="boardNo" />

    <input type="hidden" name="page" value="${pgrq.page}">
    <input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}">
    <input type="hidden" name="searchType" value="${pgrq.searchType}">
    <input type="hidden" name="keyword" value="${pgrq.keyword}">

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
        <tr>
            <td>평점</td>
            <td align="left">
                <c:choose>
                    <c:when test="${board.rating eq 1}">★☆☆☆☆</c:when>
                    <c:when test="${board.rating eq 2}">★★☆☆☆</c:when>
                    <c:when test="${board.rating eq 3}">★★★☆☆</c:when>
                    <c:when test="${board.rating eq 4}">★★★★☆</c:when>
                    <c:when test="${board.rating eq 5}">★★★★★</c:when>
                </c:choose>
            </td>
        </tr>
    </table>

</form:form>

<div>
    <sec:authentication property="principal" var="pinfo"/>

    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <button type="submit" id="btnEdit"><spring:message code="action.edit" /></button>
        <button type="submit" id="btnRemove"><spring:message code="action.remove" /></button>
    </sec:authorize>

    <sec:authorize access="hasRole('ROLE_MEMBER')">
        <c:if test="${pinfo.username eq board.writer}">
            <button type="submit" id="btnEdit"><spring:message code="action.edit" /></button>
            <button type="submit" id="btnRemove"><spring:message code="action.remove" /></button>
        </c:if>
    </sec:authorize>

    <button type="submit" id="btnList"><spring:message code="action.list" /></button>
</div>
<br/><br/>

    <!-- 댓글 작성 form-->


    <!-- 댓글 출력 form -->


<div class="container">
    <label for="content">comment</label>
    <form name="commentInsertForm">
        <div class="input-group">
            <input type="hidden" name="boardNo" value="${board.boardNo}"/>
            <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
            <span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
               </span>
        </div>
    </form>
</div>

<div class="container">
    <div class="commentList"></div>
</div>


<script type="text/javascript"

        src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script type="text/javascript">

    var boardNo = '${board.boardNo}'; //게시글 번호

    $('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시
        var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
        commentInsert(insertData); //Insert 함수호출(아래)
    });



    //댓글 등록
    function commentInsert(insertData){
        $.ajax({
            url : '/comment/insert',
            type : 'post',
            data : insertData,
            success : function(data){
                if(data == 1) {
                    commentList(); //댓글 작성 후 댓글 목록 reload
                    $('[name=content]').val('');
                }
            }
        });
    }

    function commentList(){
        $.ajax({
            url : '/comment/list',
            type : 'get',
            data : {'boardNo':boardNo},
            success : function(data){
                var a ='';
                $.each(data, function(key, value){
                    a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                    a += '<div class="commentInfo'+value.commentId+'">'+'댓글번호 : '+value.commentId+' / 작성자 : '+value.writer;
                    a += '<a onclick="commentUpdate('+value.commentId+',\''+value.content+'\');"> 수정 </a>';
                    a += '<a onclick="commentDelete('+value.commentId+');"> 삭제 </a> </div>';
                    a += '<div class="commentContent'+value.commentId+'"> <p> 내용 : '+value.content +'</p>';
                    a += '</div></div>';
                });

                $(".commentList").html(a);
            }
        });
    }

    //댓글 수정 - 댓글 내용 출력을 input 폼으로 변경
    function commentUpdate(commentId, content){
        var a ='';

        a += '<div class="input-group">';
        a += '<input type="text" class="form-control" name="content_'+commentId+'" value="'+content+'"/>';
        a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+commentId+');">수정</button> </span>';
        a += '</div>';

        $('.commentContent'+commentId).html(a);

    }

    //댓글 수정
    function commentUpdateProc(commentId){
        var updateContent = $('[name=content_'+commentId+']').val();

        $.ajax({
            url : '/comment/update',
            type : 'post',
            data : {'content' : updateContent, 'commentId' : commentId},
            success : function(data){
                if(data == 1) commentList(boardNo); //댓글 수정후 목록 출력
            }
        });
    }

    //댓글 삭제
    function commentDelete(commentId){
        $.ajax({
            url : '/comment/delete/'+commentId,
            type : 'post',
            success : function(data){
                if(data == 1) commentList(boardNo); //댓글 삭제후 목록 출력
            }
        });
    }


    $(document).ready(function(){
        commentList(); //페이지 로딩시 댓글 목록 출력
    });


</script>