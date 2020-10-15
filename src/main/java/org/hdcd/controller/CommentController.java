package org.hdcd.controller;

import org.hdcd.domain.Comment;
import org.hdcd.service.CommentService;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.logging.Logger;

@Controller
@RequestMapping("/comment")//
public class CommentController {
    /*

    @Autowired
    private CommentService service;

    @RequestMapping(value = "", method = RequestMethod.POST)
    public ResponseEntity<String> register(@RequestBody Comment comment){


        try{
            service.commentInsert(comment);
            return new ResponseEntity<>("ReplyRegisterOK", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @RequestMapping(value = "/{commentId}", method = {RequestMethod.PUT, RequestMethod.PATCH})
    public ResponseEntity<String> update(@PathVariable("commentId") Integer commentId,
                                         @RequestBody Comment comment){

        try{
            comment.setCommentId(commentId);
            service.commentUpdate(comment);
            return new ResponseEntity<>("ReplyUpdateOK", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @RequestMapping(value = "/{commentId}", method = RequestMethod.DELETE)
    public ResponseEntity<String> delete(@PathVariable("commentId") Integer commentId){

        try{
            service.commentDelete(commentId);
            return new ResponseEntity<>("ReplyDeleteOK", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @RequestMapping("/list")
    @ResponseBody
    private List<Comment> list(Model model) throws Exception{
        return service.commentList();
    }

    @RequestMapping("/insert")
    @ResponseBody
    private void insert(@RequestBody Comment comment, @RequestParam int boardNo, @RequestParam String content, @RequestParam String writer) throws Exception{

        service.commentInsert(comment);
    }


    @RequestMapping("/delete/{comment_id}")
    @ResponseBody
    private int delete(@PathVariable int commentId) throws Exception{
        return service.commentDelete(commentId);
    }

     */





}
