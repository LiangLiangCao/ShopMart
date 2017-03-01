/*
 *  CMB Confidential
 *
 *  Copyright (C) 2016 China Merchants Bank Co., Ltd. All rights reserved.
 *
 *  No part of this file may be reproduced or transmitted in any form or by any
 *  means, electronic, mechanical, photocopying, recording, or otherwise, without
 *  prior written permission of China Merchants Bank Co., Ltd.
 */

package edu.zju.cst.controller;

import com.sun.deploy.net.HttpResponse;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by SX2601 on 2017/2/28.
 */
@Controller
public class ManageUserController {

    @RequestMapping(value="",method = RequestMethod.POST)
    public void addUser(HttpRequest request, HttpResponse response){


    }

    @RequestMapping(value="",method = RequestMethod.DELETE)
    public void deleteUser(HttpRequest request, HttpResponse response){


    }

    @RequestMapping(value="",method = RequestMethod.GET)
    public void findUser(HttpRequest request, HttpResponse response){


    }



}
