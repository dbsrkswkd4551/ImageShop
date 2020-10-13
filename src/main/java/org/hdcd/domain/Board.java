package org.hdcd.domain;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Board {

    private int boardNo;
    private String title;
    private String content;
    private String writer;
    private Date regDate;
    private int boardType;
    private int rating;
}
