package org.hdcd.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.hdcd.common.domain.PageRequest;
import org.hdcd.service.sccService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
    @Autowired
    private sccService service;


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model, @ModelAttribute("pgn") PageRequest pageRequest) throws Exception{
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

        String formattedDate = dateFormat.format(date);

        model.addAttribute("serverTime", formattedDate );

        model.addAttribute("list", service.list(pageRequest));

        return "home";
    }



}
