package org.hdcd.controller;

import org.hdcd.domain.Notice;
import org.hdcd.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/notice")
public class NoticeController {
    @Autowired
    private NoticeService service;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public void registerForm(Model model) throws Exception {
        Notice notice = new Notice();

        model.addAttribute(notice);
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public void register(Notice notice, RedirectAttributes rttr) throws Exception {
        service.register(notice);

        rttr.addFlashAttribute("msg", "SUCCESS");
        return "redirect:/notice/list";
    }
}
