package org.hdcd.service;

import org.hdcd.common.domain.PageRequest;
import org.hdcd.domain.scc_info;

import java.util.List;

public interface sccService {
    public List<scc_info> list(PageRequest pageRequest) throws Exception;

    public int count() throws  Exception;
}
