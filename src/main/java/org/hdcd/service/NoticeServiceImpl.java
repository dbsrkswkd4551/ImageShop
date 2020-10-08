package org.hdcd.service;

import org.hdcd.common.domain.PageRequest;
import org.hdcd.domain.Board;
import org.hdcd.domain.Notice;
import org.hdcd.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService{
    @Autowired
    private NoticeMapper mapper;

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
