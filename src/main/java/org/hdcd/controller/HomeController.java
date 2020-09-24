package org.hdcd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

@Controller
public class HomeController {
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model){
        Date date = new Date();
        //시간을 나타내는 클래스, SimpleDateFormat 으로 출력 포맷을 정하는 방식으로 많이 사용
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

        String formattedDate = dateFormat.format(date);

        //serverTime 'key' 값에 현재 날짜, 시간을 'value' 로 담아 view로 보낸다
        model.addAttribute("serverTime", formattedDate);

        return "home";
    }
}
