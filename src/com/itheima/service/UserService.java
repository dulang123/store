package com.itheima.service;

import java.util.List;

import com.itheima.domain.Message;
import com.itheima.domain.User;
import com.itheima.domain.admin;

public interface UserService {

	void regist(User user) throws Exception;

	User active(String code) throws Exception;
	User check(String username) throws Exception;
	User login(String username, String password) throws Exception;
	public void message(Message msg) throws Exception;
	public void Msgdelet(String id) throws Exception;
	List<Message> MsgAll() throws Exception;
	public List<User> UserAll() throws Exception;
	admin adminlogin(admin a) throws Exception;
}
