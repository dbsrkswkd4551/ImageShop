package org.hdcd.service;

import java.util.List;

import org.hdcd.common.domain.PageRequest;
import org.hdcd.domain.Board;
import org.hdcd.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardMapper mapper;

    @Override
    public void register(Board board) throws Exception {
        mapper.create(board);
    }

    @Override
    public void registerN(Board board) throws Exception {
        mapper.createN(board);
    }

    @Override
    public Board read(Integer boardNo) throws Exception {
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

    @Override
    public List<Board> listN(PageRequest pageRequest) throws Exception {
        return mapper.listN(pageRequest);
    }

    @Override
    public int countN(PageRequest pageRequest) throws Exception{
        return mapper.countN(pageRequest);
    }

}
