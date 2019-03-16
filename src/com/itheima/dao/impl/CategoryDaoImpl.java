package com.itheima.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.itheima.dao.CategoryDao;
import com.itheima.domain.Category;
import com.itheima.domain.User;
import com.itheima.utils.DataSourceUtils;

public class CategoryDaoImpl implements CategoryDao {

	@Override
	/**
	 * 查询所有分类
	 */
	public List<Category> findAll() throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from category";
		return qr.query(sql, new BeanListHandler<>(Category.class));
	}

	@Override
	/**
	 * 添加分类
	 */
	public void save(Category c) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "insert into category values (?,?);";
		qr.update(sql, c.getCid(),c.getCname());
	}
	public int delete(String username) throws Exception {
		 QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		   String sql ="delete from category where cname=?";
			return qr.update(sql, username);
	}
	public int update(Category c,String name) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "update category set cname=? where cid=?";
		//update user set password = ?,sex = ?,state = ?,code = ? where uid = ?
		return qr.update(sql,name,c.getCid());
	}
	public Category select(String name) throws Exception{
		   QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		   String sql = "select * from category where cid = ?";
			return qr.query(sql, new BeanHandler<>(Category.class), name);
		
			
	   }

	

	


}
