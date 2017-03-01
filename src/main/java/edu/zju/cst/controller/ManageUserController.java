/*
 *  LiangCao
 *
 *  Copyright (C) 2016 , Ltd. All rights reserved.
 *
 *  引用请标注来源
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
