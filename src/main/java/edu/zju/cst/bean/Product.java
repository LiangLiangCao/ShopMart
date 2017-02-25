package edu.zju.cst.bean;

import java.math.BigDecimal;

public class Product {
    private Long proId;

    private Long categoryId;

    private Long promoId;

    private Long suplrId;

    private String productname;

    private BigDecimal productprice;

    private String picture;

    private String describetext;

    public Product(Long proId, Long categoryId, Long promoId, Long suplrId, String productname, BigDecimal productprice, String picture, String describetext) {
        this.proId = proId;
        this.categoryId = categoryId;
        this.promoId = promoId;
        this.suplrId = suplrId;
        this.productname = productname;
        this.productprice = productprice;
        this.picture = picture;
        this.describetext = describetext;
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

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname == null ? null : productname.trim();
    }

    public BigDecimal getProductprice() {
        return productprice;
    }

    public void setProductprice(BigDecimal productprice) {
        this.productprice = productprice;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture == null ? null : picture.trim();
    }

    public String getDescribetext() {
        return describetext;
    }

    public void setDescribetext(String describetext) {
        this.describetext = describetext == null ? null : describetext.trim();
    }
}