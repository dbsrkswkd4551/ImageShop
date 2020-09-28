package org.hdcd.controller;

import org.hdcd.common.domain.PageRequest;
import org.hdcd.common.domain.Pagination;
import org.hdcd.service.sccService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

        pagination.setTotalCount(service.count());

        model.addAttribute("pagination", pagination);
    }




}
