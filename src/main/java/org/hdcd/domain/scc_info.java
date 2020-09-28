package org.hdcd.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class scc_info {
    private int SCCNUM;
    private String SCCTYPE;
    private String SCCGRADE;
    private String SCCNAME;
    private int TOTALNUM;
    private int STATENUM;
    private int REMAINEDNUM;
    private int WAITINGNUM;
    private String SCCPHONE;
    private String SCCDISTRICT;
    private String SCCADDRESS;
    private String DETAILINFO;
}
