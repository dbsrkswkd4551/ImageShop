package org.hdcd.service;

import org.hdcd.domain.Item;
import org.hdcd.domain.Member;
import org.hdcd.domain.UserItem;

import java.util.List;

public interface UserItemService {
    public void register(Member member, Item item) throws Exception;

    public List<UserItem> list(Integer userNo) throws Exception;

    public UserItem read(Integer userItemNo) throws Exception;

}
