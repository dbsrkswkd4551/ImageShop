package org.hdcd.mapper;

import org.hdcd.domain.Comment;

import java.util.List;

public interface CommentMapper {

    public int commentCount() throws Exception;

    public List<Comment> commentList() throws Exception;

    public int commentInsert(Comment comment) throws Exception;

    public int commentUpdate(Comment comment) throws Exception;

    public int commentDelete(int commentId) throws Exception;
}
