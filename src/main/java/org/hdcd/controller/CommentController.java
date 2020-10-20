package org.hdcd.controller;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.hdcd.common.domain.PageRequest;
import org.hdcd.domain.Comment;
import org.hdcd.service.CommentService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/replies")
@Log4j
@AllArgsConstructor
public class CommentController {

    private CommentService service;

    @PostMapping(value = "/new",
            consumes = "application/json",
            produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> create(@RequestBody Comment comment){

        log.info("ReplyVO: " + comment);

        int insertCount = service.register(comment);

        log.info("Reply INSERT COUNT : " + insertCount);

        return insertCount == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        // 삼항 연산자 처리
    }

    @GetMapping(value = "/pages/{boardNo}/{page}",
            produces = {
                    MediaType.APPLICATION_XML_VALUE,
                    MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<List<Comment>> getList(
            @PathVariable("page") int page,
            @PathVariable("boardNo") int boardNo){

        log.info("getList .....................");
        PageRequest pgrq = new PageRequest();
        log.info(pgrq);

        return new ResponseEntity<>(service.getList(pgrq, boardNo), HttpStatus.OK);
    }

    @DeleteMapping(value = "/{commnetId}",
            produces = {
                    MediaType.APPLICATION_XML_VALUE})
    public ResponseEntity<String> remove(
            @PathVariable("commentId") int commentId){

        log.info("remove" + commentId);

        return service.remove(commentId) == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
            value = "/{commentId}",
            consumes = "application/json",
            produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> modify(
            @RequestBody Comment comment,
            @PathVariable("commentId") int commentId){

        comment.setCommentId(commentId);
        log.info("commentId : " + commentId);
        log.info("modify : " + comment);

        return service.modify(comment) == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

}
