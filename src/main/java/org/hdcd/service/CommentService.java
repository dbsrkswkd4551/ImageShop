package org.hdcd.service;
import java.util.List;

import org.hdcd.common.domain.PageRequest;
import org.hdcd.domain.Comment;


public interface CommentService {
    public List<Comment> list(Comment comment) throws Exception;

    public int insert(Comment comment) throws Exception;

    public int update(Comment comment) throws Exception;

    public int delete(int commentId) throws Exception;

}
