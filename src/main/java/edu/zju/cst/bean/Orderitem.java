package edu.zju.cst.bean;

import java.math.BigDecimal;

public class Orderitem {
    private Long itemId;

    private Long orderId;

    private Long proId;

    private Long price;

    private Integer num;

    private String note;

    private BigDecimal count;

    public Orderitem(Long itemId, Long orderId, Long proId, Long price, Integer num, String note, BigDecimal count) {
        this.itemId = itemId;
        this.orderId = orderId;
        this.proId = proId;
        this.price = price;
        this.num = num;
        this.note = note;
        this.count = count;
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

    public Long getProId() {
        return proId;
    }

    public void setProId(Long proId) {
        this.proId = proId;
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

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public BigDecimal getCount() {
        return count;
    }

    public void setCount(BigDecimal count) {
        this.count = count;
    }
}