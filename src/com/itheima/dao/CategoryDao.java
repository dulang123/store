package com.itheima.dao;

import java.util.List;

import com.itheima.domain.Category;

public interface CategoryDao {

	List<Category> findAll() throws Exception;

	void save(Category c) throws Exception;
     int delete(String username) throws Exception;
	 Category select(String username) throws Exception; 
     int update(Category c,String name) throws Exception;
	}
