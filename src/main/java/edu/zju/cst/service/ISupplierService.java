/*
 *  LiangCao
 *
 *  Copyright (C) 2016 , Ltd. All rights reserved.
 *
 *  引用请标注来源
 */

package edu.zju.cst.service;

import edu.zju.cst.exception.AuthException;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created by Liang on 27/02/2017.
 */
public interface ISupplierService {
    public void supplierLogin(String name, String password, HttpServletRequest request) throws AuthException,
            IOException;
}
