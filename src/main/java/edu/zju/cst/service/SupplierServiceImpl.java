/*
 *  CMB Confidential
 *
 *  Copyright (C) 2016 China Merchants Bank Co., Ltd. All rights reserved.
 *
 *  No part of this file may be reproduced or transmitted in any form or by any
 *  means, electronic, mechanical, photocopying, recording, or otherwise, without
 *  prior written permission of China Merchants Bank Co., Ltd.
 */

package edu.zju.cst.service;

import edu.zju.cst.bean.Supplier;
import edu.zju.cst.bean.User;
import edu.zju.cst.constant.SystemConstant;
import edu.zju.cst.dao.SupplierMapper;
import edu.zju.cst.exception.AuthException;
import edu.zju.cst.util.AuthUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Liang on 27/02/2017.
 */
@Service
public class SupplierServiceImpl implements ISupplierService {
    @Autowired
    private SupplierMapper suplyMapper;

    /**
     * 商户登陆
     *
     * @param password
     * @param request
     * @throws IOException
     */
    public void supplierLogin(String name, String password, HttpServletRequest request) throws AuthException, IOException {
        Supplier supplier = suplyMapper.selectByPrimaryKey(Long.parseLong(name));
        if (supplier == null) {
            throw new AuthException("username user does not exist.");
        }

        String supplyPassed = AuthUtils.getPassword(password);

        if (supplyPassed.equals(supplier.getPassword())) {

            HttpSession session = request.getSession();
            supplier.setPassword("");

            session.setAttribute(SystemConstant.SESSION_SUPPLY, supplier);
        } else {
            throw new AuthException("password or username wrong!");
        }
    }
}