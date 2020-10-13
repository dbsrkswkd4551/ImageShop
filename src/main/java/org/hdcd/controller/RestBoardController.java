package org.hdcd.controller;


import org.hdcd.domain.Comment;
import org.hdcd.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/restBoard")
public class RestBoardController {
    /*
    @Autowired
    private BoardService service;

    @RequestMapping(value = "/commentList", method = RequestMethod.POST)
    public List<Comment> commentList(@RequestParam("boardNo") int boardNo) throws Exception{
        return service.commentList(boardNo);
    }

     */


}

