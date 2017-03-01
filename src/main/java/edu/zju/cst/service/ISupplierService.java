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
