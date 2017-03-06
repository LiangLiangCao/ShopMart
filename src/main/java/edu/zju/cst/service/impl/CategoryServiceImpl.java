/*
 * LiangCao
 *
 *  Copyright (C) 2016 , Ltd. All rights reserved.
 *
 *  引用请标注来源
 */

package edu.zju.cst.service.impl;

import edu.zju.cst.bean.Category;
import edu.zju.cst.dao.CategoryMapper;
import edu.zju.cst.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Liang on 2/25/2017.
 */
@Service
public class CategoryServiceImpl implements ICategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    public int add(Category category) {
        int re  = categoryMapper.insert(category);
        return  re;
    }

    public int update(Category category) {
        int re = categoryMapper.updateByPrimaryKey(category);
        return re;
    }

    public int del(String id) {
        int re = categoryMapper.deleteByUpdate(Long.parseLong(id));
        return re;
    }

    public Category get(String id) {
        return categoryMapper.selectByPrimaryKey(Long.parseLong(id));
    }

    public List<Category> getCategories(int size, int page) {
        int offset = (page-1) * size;
        return categoryMapper.selectByPageSize(size,offset);
    }

    public int getCount(){
        return categoryMapper.countTotal();
    }
}
