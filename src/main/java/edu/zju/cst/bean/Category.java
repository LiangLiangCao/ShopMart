package edu.zju.cst.bean;

public class Category {
    private Long categoryId;

    private Long parentCategoryId;

    private Long supplierId;

    private String categoryName;

    private Integer isDelete = 0;

    public Category(Long categoryId, Long parentCategoryId, Long supplierId, String categoryName, Integer isDelete) {
        this.categoryId = categoryId;
        this.parentCategoryId = parentCategoryId;
        this.supplierId = supplierId;
        this.categoryName = categoryName;
        this.isDelete = isDelete;
    }

    public Category() {
        super();
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public Long getParentCategoryId() {
        return parentCategoryId;
    }

    public void setParentCategoryId(Long parentCategoryId) {
        this.parentCategoryId = parentCategoryId;
    }

    public Long getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Long supplierId) {
        this.supplierId = supplierId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName == null ? null : categoryName.trim();
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }
}