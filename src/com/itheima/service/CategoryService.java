package com.itheima.service;

import java.util.List;

import com.itheima.domain.Category;

public interface CategoryService {

	String findAll() throws Exception;



	List<Category> findList() throws Exception;
	
	void save(Category c) throws Exception;
	String update(Category c,String name) throws Exception;
	public int delect(String count) throws Exception;
	Category select(String name) throws Exception;
	
}
