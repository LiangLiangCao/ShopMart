package edu.zju.cst.bean;

import java.math.BigDecimal;

public class Product {
    private Long productId;

    private Long categoryId;

    private Long promotionId;

    private Long supplierId;

    private String productName;

    private BigDecimal price;

    private String picture;

    private Integer quantity;

    private String description;

    private Integer isDelete;

    public Product(Long productId, Long categoryId, Long promotionId, Long supplierId, String productName, BigDecimal price, String picture, Integer quantity, String description, Integer isDelete) {
        this.productId = productId;
        this.categoryId = categoryId;
        this.promotionId = promotionId;
        this.supplierId = supplierId;
        this.productName = productName;
        this.price = price;
        this.picture = picture;
        this.quantity = quantity;
        this.description = description;
        this.isDelete = isDelete;
    }

    public Product() {
        super();
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public Long getPromotionId() {
        return promotionId;
    }

    public void setPromotionId(Long promotionId) {
        this.promotionId = promotionId;
    }

    public Long getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Long supplierId) {
        this.supplierId = supplierId;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }
}