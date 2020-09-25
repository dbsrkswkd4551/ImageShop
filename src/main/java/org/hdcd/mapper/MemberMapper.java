package org.hdcd.mapper;

import org.hdcd.domain.Member;
import org.hdcd.domain.MemberAuth;

import java.util.List;

public interface MemberMapper {
    public void create(Member member) throws Exception;

    public Member read(int userNo) throws Exception;

    public void update(Member member) throws Exception;

    public void delete(int userNo) throws Exception;

    public List<Member> list() throws Exception;

    public void createAuth(MemberAuth memberAuth) throws Exception;

    public void deleteAuth(int userNo) throws Exception;
}
