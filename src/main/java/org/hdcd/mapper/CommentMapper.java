package org.hdcd.mapper;

import org.hdcd.common.domain.PageRequest;
import org.hdcd.domain.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("org.hdcd.mapper.CommentMapper")
public interface CommentMapper {


    public List<Comment> list(Comment comment) throws Exception;

    public int insert(Comment comment) throws Exception;

    public int update(Comment comment) throws Exception;

    public int delete(int commentId) throws Exception;
}
