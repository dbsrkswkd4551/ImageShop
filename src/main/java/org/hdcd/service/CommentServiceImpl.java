package org.hdcd.service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.hdcd.common.domain.PageRequest;
import org.hdcd.domain.Comment;
import org.hdcd.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j
public class CommentServiceImpl implements CommentService{

    @Setter(onMethod_=@Autowired)
    private CommentMapper mapper;

    @Override
    public int register(Comment comment) {
        log.info("register..........." + comment);
        return mapper.insert(comment);
    }

    @Override
    public Comment get(int commentId) {
        log.info("get............." + commentId);
        return mapper.read(commentId);
    }

    @Override
    public int modify(Comment comment) {
        log.info("modify............." + comment);
        return mapper.update(comment);
    }

    @Override
    public int remove(int commentId) {
        log.info("remove............." + commentId);
        return mapper.delete(commentId);
    }

    @Override
    public List<Comment> getList(PageRequest pgrq, int boardNo){
        log.info("get Reply List of a Board" + boardNo);
        return mapper.getListWithPaging(pgrq, boardNo);
    }


}
