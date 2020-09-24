package org.hdcd.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
public class CodeGroup {
    private String groupCode;
    private String groupName;
    private String useYn;
    private Date regDate;
    private Date updDate;
}
