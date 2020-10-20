package org.hdcd.mapper;

import org.apache.ibatis.annotations.Param;
import org.hdcd.common.domain.PageRequest;
import org.hdcd.domain.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("org.hdcd.mapper.CommentMapper")
public interface CommentMapper {

    // 댓글 작성
    public int insert(Comment comment);

    public Comment read(int boardNo);

    // 댓글 수정
    public int update(Comment comment);

    // 댓글 삭제
    public int delete(int commentId);

    public List<Comment> getListWithPaging(@Param("pgrq") PageRequest pageRequest, @Param("boardNo") int boardNo);


}
