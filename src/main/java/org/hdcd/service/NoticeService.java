package org.hdcd.service;

import org.hdcd.common.domain.PageRequest;
import org.hdcd.domain.Board;
import org.hdcd.domain.Notice;

import java.util.List;

public interface NoticeService {
    public void register(Board board) throws Exception;

    public List<Board> list(PageRequest pageRequest) throws Exception;

    public Board read(Integer boardNo) throws Exception;

    public void modify(Board board) throws Exception;

    public void remove(Integer boardNo) throws Exception;

    public int count(PageRequest pageRequest) throws  Exception;

}
