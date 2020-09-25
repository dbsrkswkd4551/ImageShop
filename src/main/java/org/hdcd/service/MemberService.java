package org.hdcd.service;

import ch.qos.logback.core.encoder.EchoEncoder;
import org.hdcd.domain.Member;

import java.util.List;

public interface MemberService {
    public void register(Member member) throws Exception;

    public Member read(int userNo) throws Exception;

    public void modify(Member member) throws Exception;

    public void remove(int userNo) throws Exception;

    public List<Member> list() throws Exception;

    public int countAll() throws Exception;

    public void setupAdmin(Member member) throws Exception;
}
