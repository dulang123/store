package com.itheima.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.itheima.constant.Constant;
import com.itheima.domain.Message;
import com.itheima.domain.User;
import com.itheima.domain.admin;
import com.itheima.service.CategoryService;
import com.itheima.service.UserService;
import com.itheima.service.impl.UserServiceImpl;
import com.itheima.utils.UUIDUtils;
import com.itheima.web.servlet.base.BaseServlet;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.InterningXmlVisitor;


/**
 * 用户模块
 */
public class UserServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 退出
	 */
	public String logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().invalidate();	
		
		Cookie[] cookies = request.getCookies();  
        if (null==cookies) {  
            System.out.println("没有cookie==============");  
        } else {  
            for(Cookie cookie : cookies){  
                if(cookie.getName().equals("pwd")){  
                	Cookie cookie1 = new Cookie("pwd","");
                    cookie1.setMaxAge(0);// 立即销毁cookie  
                    cookie1.setPath("/store/");  
                    System.out.println("被删除的cookie名字为:"+cookie1.getName()+cookie1.getValue());  
                    response.addCookie(cookie1);  
                    break;  
                }  
                }
            }
        response.sendRedirect(request.getContextPath());    
		return null;
	}
	public String message(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user=(User)request.getSession().getAttribute("user");
		if(user==null){	
			request.setAttribute("msg", "请先登录");
			return "/jsp/msg.jsp";
		}
		try {
			Message msg=new Message();
		
			BeanUtils.populate(msg, request.getParameterMap());			
			msg.setUser(user);
			msg.setId(UUIDUtils.getId());
			UserService us = new UserServiceImpl();
			us.message(msg);
			String msgs="<font color='red'><p><h3>您的反馈已经记录</h3><p>我们将把反馈处理的结果第一时间通过短信<p>的方式通知您，谢谢您对公司的支持和帮助</font>";
			request.setAttribute("msg", msgs);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace(); 
		}
		return "/jsp/car_feedback.jsp";
	}
	public String cookie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = null;
		String pwd=null;
		try {
		Cookie[] cookies = request.getCookies();
		 for(int i=0; i<cookies.length; i++) {  
	            // 获得具体的Cookie  
	            Cookie cookie = cookies[i];  
	            // 获得Cookie的名称  
	            if(cookie.getName().equals("user")){		  
	              name = URLDecoder.decode(cookie.getValue(),"UTF-8");
	           
	            } 
	            if(cookie.getName().equals("pwd")){		  
		            pwd = URLDecoder.decode(cookie.getValue(),"UTF-8");
		           		    }
	            if(name!=null&&pwd!=null){
	   			 break;
	   	       }
	            }
		 if(name!=null&&pwd!=null){
			//2.调用service完成登录 返回值:user
				UserService us = new UserServiceImpl();
				User user=us.login(name,pwd);
				
				//3.判断user 根据结果生成提示
				if(user == null){
					//用户名和密码不匹配
					request.setAttribute("msg", "用户名和密码不匹配");;
					return "/jsp/login.jsp";
				}
				
				//若用户不为空,继续判断是否激活
				if(Constant.USER_IS_ACTIVE != user.getState()){
					//未激活
					request.setAttribute("msg", "请先去邮箱激活,再登录!");
					return "/jsp/login.jsp";
				}
				
				//登录成功 保存用户登录状态
				request.getSession().setAttribute("user", user);
				ServletContext application = getServletContext();
				String sourceMessage="系统公告：<font color='gray'>"+ user.getName()+"走进了聊天室！</font><br>"; 
				application.setAttribute("message", sourceMessage);
	       }	
		 } catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("msg", "用户登录失败");				
			}
				return "/jsp/index.jsp";			
	}
	/**
	 * 用户登录
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1.获取用户名和密码
			String username = request.getParameter("username");
			String password	= request.getParameter("password");
			System.out.println(username+"name");
			
			//2.调用service完成登录 返回值:user
			UserService us = new UserServiceImpl();
			User user=us.login(username,password);
			
			//3.判断user 根据结果生成提示
			if(user == null){
				//用户名和密码不匹配
				request.setAttribute("msg", "用户名和密码不匹配");;
				return "/jsp/login.jsp";
			}
			
			//若用户不为空,继续判断是否激活
			if(Constant.USER_IS_ACTIVE != user.getState()){
				//未激活
				request.setAttribute("msg", "请先去邮箱激活,再登录!");
				System.out.print("msg");
				return "/jsp/login.jsp";
			}
			
			//登录成功 保存用户登录状态
			request.getSession().setAttribute("user", user);
			ServletContext application = getServletContext();
			String sourceMessage="系统公告：<font color='gray'>"+ user.getName()+"走进了聊天室！</font><br>"; 
			application.setAttribute("message", sourceMessage);
			/////////////////记住用户名//////////////////////
			//判断是否勾选了记住用户名.
			if("ok".equals(request.getParameter("savename"))){
				Cookie co = new Cookie("savename",URLEncoder.encode(username, "utf-8"));
				co.setMaxAge(1000000000);
				co.setPath(request.getContextPath()+"/");				
				response.addCookie(co);
				System.out.print("savename"+co.getValue());
			}
			if("ok".equals(request.getParameter("savepwd"))){
				Cookie co = new Cookie("user",URLEncoder.encode(username, "utf-8"));
				Cookie c = new Cookie("pwd",URLEncoder.encode(password, "utf-8"));
				co.setMaxAge(10000000);
				c.setMaxAge(100000000);
				co.setPath(request.getContextPath()+"/");
				c.setPath(request.getContextPath()+"/");
				System.out.println(co.getPath());
				response.addCookie(co);
				response.addCookie(c);
				System.out.println("user"+username);
			}
			///////////////////////////////////////
			
			//跳转到 index.jsp
			response.sendRedirect(request.getContextPath()+"/jsp/index.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "用户登录失败");
			return "/jsp/msg.jsp";
		}
		
		return null;
	}
	
	/**
	 * 跳转到登录页面
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String loginUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/jsp/login.jsp";
	}
	
	/**
	 * 用户激活
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String active(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1.接受code
			String code = request.getParameter("code");
			System.out.print(code);
			//2.调用service完成激活 返回值:user
			UserService us=new UserServiceImpl();
			User user=us.active(code);
			
			//3.判断user 生成不同的提示信息
			if(user == null){
				//没有找到这个用户,激活失败
				request.setAttribute("msg", "激活失败,请重新激活或者重新注册~");
				return "/jsp/msg.jsp";
			}
			
			//激活成功 
			request.setAttribute("msg", "恭喜你,激活成功了,可以登录了~");
		} catch (Exception e) {
			request.setAttribute("msg", "激活失败,请重新激活或者重新注册~");
			return "/jsp/msg.jsp";
		}
		return "/jsp/msg.jsp";
	}
	
	/**
	 * 用户注册
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String regist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			//1.封装对象
			User user = new User();
			BeanUtils.populate(user, request.getParameterMap());
			
			//1.1手动封装uid
			user.setUid(UUIDUtils.getId());
			user.setVip("普通客户");
			//1.2手动封装激活状态 state
			user.setState(Constant.USER_IS_NOT_ACTIVE);
			
			//1.3手动封装激活码 code
			user.setCode(UUIDUtils.getCode());
			
			//2.调用service完成注册
			UserService us=new UserServiceImpl();
			us.regist(user);
			
			//3.页面转发 提示信息
			request.setAttribute("msg", "恭喜你,注册成功,请登录邮箱完成激活!");
		}catch (Exception e) {
			e.printStackTrace();
			//转发到 msg.jsp
			request.setAttribute("msg", "用户注册失败!");
			return "/jsp/msg.jsp";
		}
		
		return "/jsp/msg.jsp";
	}
	/*
	 * 检测用户名是否存在
	 * */
	public void checkusername(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		try {
			UserService us = new UserServiceImpl();
			String username=request.getParameter("username").trim();
			
			String error=null;
			User user = us.check(username);
			if(user==null){
				error="恭喜用户名不存在";
				
			}else{
				error="用户名已经存在";
			}
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(error);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	/**
	 * 跳转到注册页面
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String registUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/jsp/register.jsp";
	}
	/*聊天处理
	 * */
	public void send(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		 //发言内容
		String content=java.net.URLDecoder.decode(request.getParameter("content"), "utf-8");
		 ServletContext application = getServletContext();
		 String sourceMessage=new String("");
		 User user=(User)request.getSession().getAttribute("user");
		 String sendTime =null;//发言时间
		 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
		 sendTime=df.format(System.currentTimeMillis());  
		
		 if(content==null||content.equals("")){
		
	        sourceMessage=application.getAttribute("message").toString();	         
		 } 			
		 else{
			 String from = java.net.URLDecoder.decode(request.getParameter("from"), "utf-8");		  	  	  
           
        	 sourceMessage=application.getAttribute("message").toString();
        	 sourceMessage+= "<font color='blue'><strong>" + from +"</strong></font>" +"<font size=4 color='blue'>:"+content+"</font>（" + sendTime + "）<br>";     
        	 System.out.println(sourceMessage);
		 }
            //发言时间
             application.setAttribute("message", sourceMessage);
             response.getWriter().print(sourceMessage);                    
	}
	public String UserAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService us = new UserServiceImpl();
		try {
			List<User> list=us.UserAll();
			request.setAttribute("list", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/admin/user/list.jsp";
	}
	
	public String MsgrAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService us = new UserServiceImpl();
		try {
			List<Message> list=us.MsgAll();
			request.setAttribute("list", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/admin/user/msglist.jsp";
	}
	public void Msgdelet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService us = new UserServiceImpl();
		try {
			String id=request.getParameter("id");
			us.Msgdelet(id);		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect(request.getContextPath()+"/user?method=MsgrAll");
	}
	public String adminlogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService us = new UserServiceImpl();
		admin a=new admin();
		try {
			BeanUtils.populate(a, request.getParameterMap());
		admin am=us.adminlogin(a);
		if(am==null){
			request.setAttribute("msg", "用户名或密码错误，请重新输入");
			return "/admin/index.jsp";
		}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return "/admin/home.jsp";
	}
	
}
