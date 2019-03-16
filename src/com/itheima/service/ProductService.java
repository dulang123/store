package com.itheima.service;

import java.util.List;

import com.itheima.domain.PageBean;
import com.itheima.domain.Product;

public interface ProductService {

	List<Product> findHot() throws Exception;

	List<Product> findNew() throws Exception;

	Product getById(String pid) throws Exception;

	PageBean<Product> findByPage(int pageNumber, int pageSize, String cid) throws Exception;

	List<Product> findAll() throws Exception;
	List<Product> ByName(String pid) throws Exception;
	 PageBean <Product> getByName(String pid,int pageNumber) throws Exception;
	void delet(String id) throws Exception;
	void save(Product p)throws Exception;
	public void update(Product p,String id) throws Exception;
}
