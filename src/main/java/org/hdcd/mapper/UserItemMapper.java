package org.hdcd.mapper;

import org.hdcd.domain.UserItem;

import java.util.List;

public interface UserItemMapper {
    public void create(UserItem userItem) throws Exception;

    public List<UserItem> list(Integer userNo) throws Exception;

    public UserItem read(Integer userItemNo) throws Exception;
}
