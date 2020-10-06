package org.hdcd.service;

import org.hdcd.common.exception.NotEnoughCoinException;
import org.hdcd.domain.Item;
import org.hdcd.domain.Member;
import org.hdcd.domain.PayCoin;
import org.hdcd.domain.UserItem;
import org.hdcd.mapper.CoinMapper;
import org.hdcd.mapper.UserItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserItemServiceImpl implements UserItemService{
    @Autowired
    private UserItemMapper mapper;

    @Autowired
    private CoinMapper coinMapper;

    @Transactional
    @Override
    public void register(Member member, Item item) throws Exception {
        int userNo = member.getUserNo();

        int coin = member.getCoin();

        int itemId = item.getItemId();
        int price = item.getPrice();

        UserItem userItem = new UserItem();
        userItem.setUserNo(userNo);
        userItem.setItemId(itemId);

        if(coin < price) {
            throw new NotEnoughCoinException("There is Not Enough Coin.");
        }

        PayCoin payCoin = new PayCoin();
        payCoin.setUserNo(userNo);
        payCoin.setItemId(itemId);
        payCoin.setAmount(price);

        coinMapper.pay(payCoin);

        coinMapper.createPayHistory(payCoin);

       mapper.create(userItem);
    }

    @Override
    public List<UserItem> list(Integer userNo) throws Exception{
        return mapper.list(userNo);
    }

    @Override
    public UserItem read(Integer userItemNo) throws Exception{
        return mapper.read(userItemNo);
    }

}
