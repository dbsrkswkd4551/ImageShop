package org.hdcd.service;

import org.hdcd.domain.Comment;
import org.hdcd.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService{

    @Autowired
    private CommentMapper mapper;

    @Override
    public Comment commentList() throws Exception{
        return mapper.commentList();
    }

    @Override
    public int commentInsert(Comment comment) throws Exception{
        return mapper.commentInsert(comment);
    }

    @Override
    public int commentUpdate(Comment comment) throws Exception{
        return mapper.commentUpdate(comment);
    }

    @Override
    public int commentDelete(int commentId) throws Exception{
        return mapper.commentDelete(commentId);
    }
}
