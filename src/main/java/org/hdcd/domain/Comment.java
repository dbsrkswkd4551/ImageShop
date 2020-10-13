package org.hdcd.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
public class Comment {
    private int commentId;
    private int boardNo;
    private String content;
    private String writer;
    private Date regDate;
}
