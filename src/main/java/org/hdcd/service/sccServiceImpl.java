package org.hdcd.service;

import org.hdcd.common.domain.PageRequest;
import org.hdcd.domain.scc_info;
import org.hdcd.mapper.sccMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class sccServiceImpl implements sccService{

    @Autowired
    private sccMapper mapper;

    @Override
    public List<scc_info> list(PageRequest pageRequest) throws Exception {
        return mapper.list(pageRequest);
    }

    @Override
    public int count(PageRequest pageRequest) throws Exception{
        return mapper.count(pageRequest);
    }
}
