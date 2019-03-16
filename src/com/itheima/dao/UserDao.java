package com.itheima.dao;

import java.util.List;

import com.itheima.domain.Message;
import com.itheima.domain.User;
import com.itheima.domain.admin;

public interface UserDao {
   User check(String username)throws Exception;
	void save(User user) throws Exception;

	User getByCode(String code) throws Exception;

	void update(User user) throws Exception;

	User getByUsernameAndPwd(String username, String password) throws Exception;
	void insert(Message msg) throws Exception;
	List<Message> MsgAll() throws Exception;
	 List<User> Userall() throws Exception;
	void Msgdelet(String id) throws Exception;
	public admin getadmin(admin a) throws Exception;
}
