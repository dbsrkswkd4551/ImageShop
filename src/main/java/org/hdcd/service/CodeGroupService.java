package org.hdcd.service;

import org.hdcd.domain.CodeGroup;
import org.hdcd.mapper.CodeGroupMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface CodeGroupService {

    public void register(CodeGroup codeGroup) throws Exception;

    public CodeGroup read(String groupCode) throws Exception;

    public void modify(CodeGroup codeGroup) throws Exception;

    public void remove(String groupCode) throws Exception;

    public List<CodeGroup> list() throws Exception;


}
