package org.hdcd.mapper;

import org.hdcd.domain.ChargeCoin;
import org.hdcd.domain.PayCoin;

import java.util.List;

public interface CoinMapper {
    public void create(ChargeCoin chargeCoin) throws Exception;

    public void charge(ChargeCoin chargeCoin) throws Exception;

    public List<ChargeCoin> list(int userNo) throws Exception;

    public void pay(PayCoin payCoin) throws Exception;

    public void createPayHistory(PayCoin payCoin) throws Exception;

    public List<PayCoin> listPayHistory(int userNo) throws Exception;
}
