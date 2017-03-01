package edu.zju.cst.bean;

import java.math.BigDecimal;

public class Product {
    private Long proId;

    private Long categoryId;

    private Long promoId;

    private Long suplrId;

    private String productName;

    private BigDecimal price;

    private String picture;

    private Integer quantity;

    private String describe;

    public Product(Long proId, Long categoryId, Long promoId, Long suplrId, String productName, BigDecimal price, String picture, Integer quantity, String describe) {
        this.proId = proId;
        this.categoryId = categoryId;
        this.promoId = promoId;
        this.suplrId = suplrId;
        this.productName = productName;
        this.price = price;
        this.picture = picture;
        this.quantity = quantity;
        this.describe = describe;
    }

    public Product() {
        super();
    }

    public Long getProId() {
        return proId;
    }

    public void setProId(Long proId) {
        this.proId = proId;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public Long getPromoId() {
        return promoId;
    }

    public void setPromoId(Long promoId) {
        this.promoId = promoId;
    }

    public Long getSuplrId() {
        return suplrId;
    }

    public void setSuplrId(Long suplrId) {
        this.suplrId = suplrId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName == null ? null : productName.trim();
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture == null ? null : picture.trim();
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe == null ? null : describe.trim();
    }
}