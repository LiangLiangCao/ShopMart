package edu.zju.cst.constant;

/**
 * Created by SX2601 on 2017/2/22.
 */
public class SystemConstants {
    /**
     * Session中的管理员Key
     */
    public static final String SESSION_ADMIN = "SESSION_ADMIN";
    /**
     * Session中的供应商Key
     */
    public static final String SESSION_SUPPLY = "SESSION_SUPPLY";
    /**
     * Session中的普通用户Key
     */
    public static final String SESSION_CUSTOM = "SESSION_CUSTOM";
    /**
     * Session中的订单的Key
     */
    public static final String SESSION_ORDER = "SESSION_ORDER";
    /**
     * Session中的正在支付的产品的Key
     */
    public static final String SESSION_PRODUCT = "SESSION_PRODUCT";
    /**
     * Session中的订单项的Key
     */
    public static final String SESSION_ORDERITERMT = "SESSION_ORDERITERMT";
    /**
     * 超级管理员配置文件key
     */
    public static final String SUPER_ADMIN = "shopMart.admin";
    /**
     * user的role字段为ADMIN_KIND_USR则是管理员
     */
    public static final String ADMIN_KIND_USR = "1";
    /**
     * user的role字段为SUPER_ADMIN_USR则是超级管理员
     */
    public static final String SUPER_ADMIN_USR = "0";
    /**
     * user的role字段为CUSTOM_KIND_USR则是普通用户
     */
    public static final String CUSTOM_KIND_USR = "2";
}
