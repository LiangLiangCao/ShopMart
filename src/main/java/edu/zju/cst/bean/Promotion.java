package edu.zju.cst.bean;

import java.util.Date;

public class Promotion {
    private Long promoId;

    private Long suplrId;

    private String promoName;

    private Date beginTime;

    private Date endTime;

    private Short discount;

    public Promotion(Long promoId, Long suplrId, String promoName, Date beginTime, Date endTime, Short discount) {
        this.promoId = promoId;
        this.suplrId = suplrId;
        this.promoName = promoName;
        this.beginTime = beginTime;
        this.endTime = endTime;
        this.discount = discount;
    }

    public Promotion() {
        super();
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

    public String getPromoName() {
        return promoName;
    }

    public void setPromoName(String promoName) {
        this.promoName = promoName == null ? null : promoName.trim();
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
}