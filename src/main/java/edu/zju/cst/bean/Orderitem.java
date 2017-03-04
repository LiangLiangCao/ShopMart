package edu.zju.cst.bean;

import java.math.BigDecimal;

public class Orderitem {
    private Long itemId;

    private Long orderId;

    private Long productId;

    private Long totalPrice;

    private Integer num;

    private String note;

    private BigDecimal itemPrice;

    private Integer isDelete;

    public Orderitem(Long itemId, Long orderId, Long productId, Long totalPrice, Integer num, String note, BigDecimal itemPrice, Integer isDelete) {
        this.itemId = itemId;
        this.orderId = orderId;
        this.productId = productId;
        this.totalPrice = totalPrice;
        this.num = num;
        this.note = note;
        this.itemPrice = itemPrice;
        this.isDelete = isDelete;
    }

    public Orderitem() {
        super();
    }

    public Long getItemId() {
        return itemId;
    }

    public void setItemId(Long itemId) {
        this.itemId = itemId;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public Long getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Long totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public BigDecimal getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(BigDecimal itemPrice) {
        this.itemPrice = itemPrice;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }
}