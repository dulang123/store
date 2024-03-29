package com.itheima.dao;

import java.util.List;

import com.itheima.domain.PageBean;
import com.itheima.domain.Product;

public interface ProductDao {

	List<Product> findHot() throws Exception;
	public List<Product> findName(String pid) throws Exception;
	List<Product> findNew() throws Exception;

	Product getById(String pid) throws Exception;

	List<Product> findByPage(PageBean<Product> pb, String cid) throws Exception;

	int getTotalRecord(String cid) throws Exception;

	List<Product> findAll() throws Exception;
	void delet(String id) throws Exception;
	void save(Product p) throws Exception;
	public void update(Product p,String id) throws Exception;
}
