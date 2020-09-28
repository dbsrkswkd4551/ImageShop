package org.hdcd.service;

import org.hdcd.domain.Notice;
import org.hdcd.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class noticeServiceImpl implements NoticeService{

    @Autowired
    private NoticeMapper mapper;

    @Override
    public void register(Notice notice) throws Exception{
        mapper.create(notice);
    }
}
