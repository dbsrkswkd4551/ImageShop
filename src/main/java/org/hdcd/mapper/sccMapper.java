package org.hdcd.mapper;

import org.hdcd.common.domain.PageRequest;
import org.hdcd.domain.scc_info;

import java.util.List;

public interface sccMapper {
    public List<scc_info> list(PageRequest pageRequest) throws Exception;

    public int count(PageRequest pageRequest) throws Exception;
}
