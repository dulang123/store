package com.itheima.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.itheima.dao.UserDao;
import com.itheima.domain.Message;
import com.itheima.domain.User;
import com.itheima.domain.admin;
import com.itheima.utils.DataSourceUtils;



public class UserDaoImpl implements UserDao{

	@Override
	/**
	 * 用户注册
	 */
	public void save(User user) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		/*
		 *  `uid` varchar(32) NOT NULL,
			  `username` varchar(20) DEFAULT NULL,
			  `password` varchar(20) DEFAULT NULL,
			  
			  `name` varchar(20) DEFAULT NULL,
			  `email` varchar(30) DEFAULT NULL,
			  `telephone` varchar(20) DEFAULT NULL,
			  
			  `birthday` date DEFAULT NULL,
			  `sex` varchar(10) DEFAULT NULL,
			  `state` int(11) DEFAULT NULL,
			  
			  `code` varchar(64) DEFAULT NULL,
		 */
		String sql = "insert into user values(?,?,?,?,?,?,?,?,?,?,?);";
		qr.update(sql, user.getUid(),user.getUsername(),user.getPassword(),
				user.getName(),user.getEmail(),user.getTelephone(),
				user.getBirthday(),user.getSex(),user.getState(),
				user.getCode(),user.getVip());
	}

	@Override
	/**
	 * 通过激活码获取用户
	 */
	public User getByCode(String code) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from user where code = ? limit 1";
		return qr.query(sql, new BeanHandler<>(User.class), code);
	}

	@Override
	/**
	 * 更新用户
	 */
	public void update(User user) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		/*
		 *  `uid` varchar(32) NOT NULL,
			  `username` varchar(20) DEFAULT NULL,
			  `password` varchar(20) DEFAULT NULL,
			  
			  `name` varchar(20) DEFAULT NULL,
			  `email` varchar(30) DEFAULT NULL,
			  `telephone` varchar(20) DEFAULT NULL,
			  
			  `birthday` date DEFAULT NULL,
			  `sex` varchar(10) DEFAULT NULL,
			  `state` int(11) DEFAULT NULL,
			  
			  `code` varchar(64) DEFAULT NULL,
		 */
		String sql="update user set password = ?,sex = ?,state = ?,code = ? where uid = ?";
		qr.update(sql, user.getPassword(),user.getSex(),user.getState(),user.getCode(),user.getUid());
	}

	@Override
	/**
	 * 用户登录
	 */
	public User getByUsernameAndPwd(String username, String password) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from user where username = ? and password = ? limit 1";
		return qr.query(sql, new BeanHandler<>(User.class), username,password);
	}
	public admin getadmin(admin a) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from admin where name = ? and pwd = ? limit 1";
		return qr.query(sql, new BeanHandler<>(admin.class), a.getUsername(),a.getPassword());
	}
   public User check(String username) throws Exception{
	   QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
	   String sql = "select * from user where username = ?";
		return qr.query(sql, new BeanHandler<>(User.class), username);
			
   }
   public List<User> Userall() throws Exception{
	   QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
	   String sql = "select * from user";
	   return qr.query(sql, new BeanListHandler<>(User.class));
			
   }
   public List<Message> MsgAll() throws Exception{
	   QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
	   String sql = "select * from message";
	   return qr.query(sql, new BeanListHandler<>(Message.class));
			
   }
   public void Msgdelet(String id) throws Exception{
	   QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
	   String sql = "delete from message where id=? ";
		 qr.update(sql,id);
			
   }
   public void insert(Message msg) throws Exception{
	   QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
	   String sql = "insert into message values(?,?,?,?,?,?);";
	   qr.update(sql,msg.getId(),msg.getName(),msg.getTelephone(),msg.getType(),msg.getMessage(),msg.getUser().getUid());
	
		
   }
}
