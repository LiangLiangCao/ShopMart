package edu.zju.cst.bean;

import java.math.BigDecimal;

public class ShopItem {
    private Long shopId;

    private Long uid;

    private Long proId;

    private BigDecimal count;

    private Long price;

    private Integer num;

    public ShopItem(Long shopId, Long uid, Long proId, BigDecimal count, Long price, Integer num) {
        this.shopId = shopId;
        this.uid = uid;
        this.proId = proId;
        this.count = count;
        this.price = price;
        this.num = num;
    }

    public ShopItem() {
        super();
    }

    public Long getShopId() {
        return shopId;
    }

    public void setShopId(Long shopId) {
        this.shopId = shopId;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public Long getProId() {
        return proId;
    }

    public void setProId(Long proId) {
        this.proId = proId;
    }

    public BigDecimal getCount() {
        return count;
    }

    public void setCount(BigDecimal count) {
        this.count = count;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }
}