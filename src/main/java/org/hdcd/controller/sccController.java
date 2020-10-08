package org.hdcd.controller;

import org.hdcd.common.domain.CodeLabelValue;
import org.hdcd.common.domain.PageRequest;
import org.hdcd.common.domain.Pagination;
import org.hdcd.domain.scc_info;
import org.hdcd.service.sccService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/scc")
public class sccController {

    @Autowired
    private sccService service;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public void list(@ModelAttribute("pgn")PageRequest pageRequest, Model model) throws Exception{
        model.addAttribute("list", service.list(pageRequest));

        Pagination pagination = new Pagination();
        pagination.setPageRequest(pageRequest);

        pagination.setTotalCount(service.count(pageRequest));

        model.addAttribute("pagination", pagination);

        model.addAttribute("pageRequest", pageRequest);

        List<CodeLabelValue> searchTypeCodeValueList = new ArrayList<CodeLabelValue>();
        searchTypeCodeValueList.add(new CodeLabelValue("n", "---"));
        searchTypeCodeValueList.add(new CodeLabelValue("t", "시설명"));
        searchTypeCodeValueList.add(new CodeLabelValue("d", "지역구"));

        model.addAttribute("searchTypeCodeValueList", searchTypeCodeValueList);
    }

    @RequestMapping(value = "/read", method = RequestMethod.GET)
    public String read(Integer SCC_NUM, Model model) throws Exception{
        scc_info scc_info = service.read(SCC_NUM);

        model.addAttribute(scc_info);

        return "scc/read";
    }




}
