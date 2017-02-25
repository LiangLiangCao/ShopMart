package edu.zju.cst.bean;

public class Category {
    private Long categoryId;

    private Long catCategoryId;

    private Long suplrId;

    private String categName;

    public Category(Long categoryId, Long catCategoryId, Long suplrId, String categName) {
        this.categoryId = categoryId;
        this.catCategoryId = catCategoryId;
        this.suplrId = suplrId;
        this.categName = categName;
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

    public Long getCatCategoryId() {
        return catCategoryId;
    }

    public void setCatCategoryId(Long catCategoryId) {
        this.catCategoryId = catCategoryId;
    }

    public Long getSuplrId() {
        return suplrId;
    }

    public void setSuplrId(Long suplrId) {
        this.suplrId = suplrId;
    }

    public String getCategName() {
        return categName;
    }

    public void setCategName(String categName) {
        this.categName = categName == null ? null : categName.trim();
    }
}