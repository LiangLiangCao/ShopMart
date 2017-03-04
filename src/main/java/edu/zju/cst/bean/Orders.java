package edu.zju.cst.bean;

import java.math.BigDecimal;
import java.util.Date;

public class Orders {
    private Long ordrId;

    private Long userId;

    private String name;

    private String address;

    private String phone;

    private Integer postage;

    private BigDecimal total;

    private String deliveryDate;

    private String deliveryMethod;

    private BigDecimal productToatl;

    private Date createTime;

    private Date payTime;

    private Date closeTime;

    private String state;

    private Integer isDelete;

    public Orders(Long ordrId, Long userId, String name, String address, String phone, Integer postage, BigDecimal total, String deliveryDate, String deliveryMethod, BigDecimal productToatl, Date createTime, Date payTime, Date closeTime, String state, Integer isDelete) {
        this.ordrId = ordrId;
        this.userId = userId;
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.postage = postage;
        this.total = total;
        this.deliveryDate = deliveryDate;
        this.deliveryMethod = deliveryMethod;
        this.productToatl = productToatl;
        this.createTime = createTime;
        this.payTime = payTime;
        this.closeTime = closeTime;
        this.state = state;
        this.isDelete = isDelete;
    }

    public Orders() {
        super();
    }

    public Long getOrdrId() {
        return ordrId;
    }

    public void setOrdrId(Long ordrId) {
        this.ordrId = ordrId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getPostage() {
        return postage;
    }

    public void setPostage(Integer postage) {
        this.postage = postage;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public String getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(String deliveryDate) {
        this.deliveryDate = deliveryDate == null ? null : deliveryDate.trim();
    }

    public String getDeliveryMethod() {
        return deliveryMethod;
    }

    public void setDeliveryMethod(String deliveryMethod) {
        this.deliveryMethod = deliveryMethod == null ? null : deliveryMethod.trim();
    }

    public BigDecimal getProductToatl() {
        return productToatl;
    }

    public void setProductToatl(BigDecimal productToatl) {
        this.productToatl = productToatl;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getPayTime() {
        return payTime;
    }

    public void setPayTime(Date payTime) {
        this.payTime = payTime;
    }

    public Date getCloseTime() {
        return closeTime;
    }

    public void setCloseTime(Date closeTime) {
        this.closeTime = closeTime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }
}