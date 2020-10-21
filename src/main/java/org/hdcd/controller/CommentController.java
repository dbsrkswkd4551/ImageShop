package org.hdcd.controller;

import org.hdcd.domain.Comment;
import org.hdcd.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/comment")//
public class CommentController {

    @Autowired
    CommentService service;


    @RequestMapping("/insert")
    @ResponseBody
    private int insert(@RequestParam int boardNo, @RequestParam String content) throws Exception{
        Comment comment = new Comment();
        comment.setBoardNo(boardNo);
        comment.setContent(content);
        comment.setWriter("user");

        return service.commentInsert(comment);
    }

    @RequestMapping("/update")
    @ResponseBody
    private int update(@RequestParam int commentId, @RequestParam String content) throws Exception{
        Comment comment = new Comment();
        comment.setCommentId(commentId);
        comment.setContent(content);

        return service.commentUpdate(comment);
    }

    @RequestMapping("/delete/{comment_id}")
    @ResponseBody
    private int delete(@PathVariable int commentId) throws Exception{
        return service.commentDelete(commentId);
    }


}
