package edu.zju.cst.bean;

import java.math.BigDecimal;

public class ShopItem {
    private Long shopId;

    private Long userId;

    private Long productId;

    private BigDecimal count;

    private Long price;

    private Integer num;

    private Integer isDelete = 0;

    public ShopItem(Long shopId, Long userId, Long productId, BigDecimal count, Long price, Integer num, Integer isDelete) {
        this.shopId = shopId;
        this.userId = userId;
        this.productId = productId;
        this.count = count;
        this.price = price;
        this.num = num;
        this.isDelete = isDelete;
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

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
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

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }
}