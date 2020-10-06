package org.hdcd.mapper;

import java.util.List;

import org.hdcd.common.domain.LoginLog;

public interface LoginLogMapper {

    public void create(LoginLog loginLog) throws Exception;

    public List<LoginLog> list() throws Exception;

}
