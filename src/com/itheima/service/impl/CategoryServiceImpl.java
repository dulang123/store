package com.itheima.service.impl;

import java.util.List;

import com.itheima.constant.Constant;
import com.itheima.dao.CategoryDao;
import com.itheima.dao.impl.CategoryDaoImpl;
import com.itheima.domain.Category;
import com.itheima.service.CategoryService;
import com.itheima.utils.JsonUtil;



public class CategoryServiceImpl implements CategoryService {

	@Override
	/**
	 * 后台展示所有分类
	 */
	public List<Category> findList() throws Exception {
		CategoryDao cd = new CategoryDaoImpl();
		return cd.findAll();
	}
	public Category select(String name) throws Exception{
		CategoryDao cd = new CategoryDaoImpl();
		Category c=cd.select(name);
		 return c;
	     }
    public String update(Category c,String name) throws Exception{
	CategoryDao cd = new CategoryDaoImpl();
	
	cd.update(c,name);
	 return "yes";
     }
	@Override
	/**
	 * 查询所有分类
	 */
	public String findAll() throws Exception {
		/*//1.调用dao 查询所有分类
		CategoryDao cd = new CategoryDaoImpl();
		List<Category> list = cd.findAll();*/
		
		List<Category> list=findList();
		
		//2.将list转换成json字符串
		if(list!=null && list.size()>0){
			return JsonUtil.list2json(list);
		}
		return null;
	}

	@Override
	/**
	 * 添加分类
	 */
	public void save(Category c) throws Exception {
		//1.调用dao 完成添加
		CategoryDao cd = new CategoryDaoImpl();
		cd.save(c);
		
	}

	

	@Override
	public int delect(String count) throws Exception {
		// TODO Auto-generated method stub
		CategoryDao cd = new CategoryDaoImpl();
		int c=cd.delete(count);
		System.out.println("delet "+c);
		return c;
	}
	
	

	

	

	
}
