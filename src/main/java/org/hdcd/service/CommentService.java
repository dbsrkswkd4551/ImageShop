package org.hdcd.service;
import java.util.List;
import org.hdcd.domain.Comment;


public interface CommentService {
    public Comment commentList() throws Exception;

    public int commentInsert(Comment comment) throws Exception;

    public int commentUpdate(Comment comment) throws Exception;

    public int commentDelete(int commentId) throws Exception;



}
