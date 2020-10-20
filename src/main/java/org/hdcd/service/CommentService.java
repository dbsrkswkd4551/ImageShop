package org.hdcd.service;
import java.util.List;

import org.hdcd.common.domain.PageRequest;
import org.hdcd.domain.Comment;


public interface CommentService {
    public int register(Comment comment);

    public Comment get(int commentId);

    public int modify(Comment comment);

    public int remove(int commentId);

    public List<Comment> getList(PageRequest pgrq, int boardNo);
}
