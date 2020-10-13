package org.hdcd.controller;

import org.hdcd.common.domain.CodeLabelValue;
import org.hdcd.common.domain.PageRequest;
import org.hdcd.common.domain.Pagination;
import org.hdcd.domain.Board;
import org.hdcd.domain.Notice;
import org.hdcd.service.BoardService;
import org.hdcd.service.CommentService;
import org.hdcd.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private NoticeService service;

    @Autowired
    private CommentService commentService;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public void registerForm(Model model) throws Exception {
        Board board = new Board();

        model.addAttribute(board);
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String register(Board board, RedirectAttributes rttr) throws Exception {
        service.register(board);

        rttr.addFlashAttribute("msg", "SUCCESS");
        return "redirect:/notice/list";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public void list(@ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
        model.addAttribute("list", service.list(pageRequest));

        Pagination pagination = new Pagination();
        pagination.setPageRequest(pageRequest);

        pagination.setTotalCount(service.count(pageRequest));


        model.addAttribute("pagination", pagination);
        model.addAttribute("pageRequest", pageRequest);

        List<CodeLabelValue> searchTypeCodeValueList = new ArrayList<CodeLabelValue>();
        searchTypeCodeValueList.add(new CodeLabelValue("n", "---"));
        searchTypeCodeValueList.add(new CodeLabelValue("t", "Title"));
        searchTypeCodeValueList.add(new CodeLabelValue("c", "Content"));
        searchTypeCodeValueList.add(new CodeLabelValue("tc", "Title OR Content"));

        model.addAttribute("searchTypeCodeValueList", searchTypeCodeValueList);
    }

    @RequestMapping(value = "/read", method = RequestMethod.GET)
    public void read(int boardNo, @ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
        Board board = service.read(boardNo);

        model.addAttribute(board);
    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String remove(int boardNo, PageRequest pageRequest, RedirectAttributes rttr) throws Exception {
        service.remove(boardNo);

        rttr.addAttribute("page", pageRequest.getPage());
        rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());
        rttr.addAttribute("searchType", pageRequest.getSearchType());
        rttr.addAttribute("keyword", pageRequest.getKeyword());

        rttr.addFlashAttribute("msg", "SUCCESS");

        return "redirect:/notice/list";
    }

    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public void modifyForm(int boardNo, @ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
        Board board = service.read(boardNo);

        model.addAttribute(board);
    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String modify(Board board, PageRequest pageRequest, RedirectAttributes rttr) throws Exception {
        service.modify(board);

        rttr.addAttribute("page", pageRequest.getPage());
        rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());
        rttr.addAttribute("searchType", pageRequest.getSearchType());
        rttr.addAttribute("keyword", pageRequest.getKeyword());

        rttr.addFlashAttribute("msg", "SUCCESS");

        return "redirect:/notice/list";
    }




}
