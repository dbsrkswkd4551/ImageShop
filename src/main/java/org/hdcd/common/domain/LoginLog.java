package org.hdcd.common.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
public class LoginLog {
    private int userNo;
    private String userId;
    private String remoteAddr;
    private Date regDate;
}
