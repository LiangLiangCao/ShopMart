package edu.zju.cst.bean;

import java.util.Date;

public class Promotion {
    private Long promotionId;

    private String promotionName;

    private Date beginTime;

    private Date endTime;

    private Short discount;

    private Integer isDelete = 0;

    public Promotion(Long promotionId, String promotionName, Date beginTime, Date endTime, Short discount, Integer isDelete) {
        this.promotionId = promotionId;
        this.promotionName = promotionName;
        this.beginTime = beginTime;
        this.endTime = endTime;
        this.discount = discount;
        this.isDelete = isDelete;
    }

    public Promotion() {
        super();
    }

    public Long getPromotionId() {
        return promotionId;
    }

    public void setPromotionId(Long promotionId) {
        this.promotionId = promotionId;
    }

    public String getPromotionName() {
        return promotionName;
    }

    public void setPromotionName(String promotionName) {
        this.promotionName = promotionName == null ? null : promotionName.trim();
    }

    public Date getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Short getDiscount() {
        return discount;
    }

    public void setDiscount(Short discount) {
        this.discount = discount;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }
}