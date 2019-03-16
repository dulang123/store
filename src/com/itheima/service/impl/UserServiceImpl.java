package com.itheima.service.impl;

import java.util.List;

import com.itheima.constant.Constant;
import com.itheima.dao.UserDao;
import com.itheima.dao.impl.UserDaoImpl;
import com.itheima.domain.Message;
import com.itheima.domain.User;
import com.itheima.domain.admin;
import com.itheima.service.UserService;
import com.itheima.utils.MailUtils;

public class UserServiceImpl implements UserService {

	@Override
	/**
	 * 用户注册
	 */
	public void regist(User user) throws Exception {
		//1.调用dao完成注册List
		//UserDao ud=(UserDao) BeanFactory.getBean("UserDao");
		UserDao ud=new UserDaoImpl();
		ud.save(user);
		                                                             
		//2.发送激活邮件
		String emailMsg="恭喜"+user.getName()+":成为汽车4S店的客户,<a href='http://localhost:8080/store/user?method=active&code="+user.getCode()+"'>点此激活</a>";
		MailUtils.sendMail(user.getEmail(), emailMsg);
	}

	@Override
	/**
	 * 用户激活
	 */
	public User active(String code) throws Exception {
		UserDao ud=new UserDaoImpl();
		//1.通过code获取用户
		User user=ud.getByCode(code);
		
		//1.1 通过激活码没有找到 用户
		if(user == null){
			return null;
		}
		
		//2.若获取到了 修改用户
		user.setState(Constant.USER_IS_ACTIVE);
		user.setCode(null);
		
		ud.update(user);
		return user;
	}
	public User check(String username) throws Exception {
		UserDao ud=new UserDaoImpl();
		
		return ud.check(username);
	}
	public List<User> UserAll() throws Exception {
		UserDao ud=new UserDaoImpl();
		
		return (List<User>) ud.Userall();
	}
	public List<Message> MsgAll() throws Exception {
		UserDao ud=new UserDaoImpl();
		
		return (List<Message>)ud.MsgAll();
	}
	public void Msgdelet(String id) throws Exception {
		UserDao ud=new UserDaoImpl();
		
		 ud.Msgdelet(id);;
	}
	@Override
	/**
	 * 用户登录
	 */
	public User login(String username, String password) throws Exception {
		UserDao ud=new UserDaoImpl();
		
		return ud.getByUsernameAndPwd(username,password);
	}
	public admin adminlogin(admin a) throws Exception {
		UserDao ud=new UserDaoImpl();
		
		return ud.getadmin(a);
	}
	public void message(Message msg) throws Exception {
		UserDao ud=new UserDaoImpl();		
		 ud.insert(msg);
	}

}
