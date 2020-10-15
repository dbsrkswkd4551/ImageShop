package org.hdcd.service;

import org.hdcd.common.domain.PageRequest;
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
    public List<Comment> list(Comment comment) throws Exception{
        return mapper.list(comment);
    }

    @Override
    public int insert(Comment comment) throws Exception{
        return mapper.insert(comment);
    }

    @Override
    public int update(Comment comment) throws Exception{
        return mapper.update(comment);
    }

    @Override
    public int delete(int commentId) throws Exception{
        return mapper.delete(commentId);
    }


}
