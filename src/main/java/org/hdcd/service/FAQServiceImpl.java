package org.hdcd.service;

import org.hdcd.common.domain.PageRequest;
import org.hdcd.domain.Board;
import org.hdcd.mapper.FAQMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FAQServiceImpl implements FAQService{
    @Autowired
    private FAQMapper mapper;

    @Override
    public void register(Board board) throws Exception{
        mapper.create(board);
    }

    @Override
    public Board read(Integer boardNo) throws Exception{
        return mapper.read(boardNo);
    }

    @Override
    public void modify(Board board) throws Exception {
        mapper.update(board);
    }

    @Override
    public void remove(Integer boardNo) throws Exception {
        mapper.delete(boardNo);
    }

    @Override
    public List<Board> list(PageRequest pageRequest) throws Exception {
        return mapper.list(pageRequest);
    }

    @Override
    public int count(PageRequest pageRequest) throws Exception{
        return mapper.count(pageRequest);
    }
}
