package org.hdcd.mapper;

import org.hdcd.common.domain.AccessLog;

import java.util.List;

public interface AccessLogMapper {
    public void create(AccessLog accessLog) throws Exception;

    public List<AccessLog> list() throws Exception;
}
