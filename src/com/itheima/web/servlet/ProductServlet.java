package com.itheima.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itheima.domain.PageBean;
import com.itheima.domain.Product;
import com.itheima.domain.User;
import com.itheima.service.ProductService;
import com.itheima.service.impl.ProductServiceImpl;
import com.itheima.web.servlet.base.BaseServlet;


/**
 * 前台商品模块
 */
public class ProductServlet  extends BaseServlet{
	private static final long serialVersionUID = 1L;

	/**
	 * 分类商品分页展示
	 */
	public String findByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1.获取pagenumber cid  设置pagesize
			/*String parameter = request.getParameter("pageNumber");*/
			int pageNumber = 1;
			
			try {
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			} catch (NumberFormatException e) {
			}
			
			int pageSize = 6;
			String cid = request.getParameter("cid");
			
			//2.调用service 分页查询商品 参数:3个, 返回值:pagebean
			ProductService ps = new ProductServiceImpl();
			PageBean<Product> bean=ps.findByPage(pageNumber,pageSize,cid);
			
			//3.将pagebean放入request中,请求转发 product_list.jsp
			
			if(cid.equals("1")){	
				request.setAttribute("pb", bean);
				request.getRequestDispatcher("jsp/product_list.jsp").forward(request, response);
		     }
		   if(cid.equals("2")){
			    request.getRequestDispatcher("jsp/car_order.jsp").forward(request, response);
		
		  }
		     if(cid.equals("3")){
			request.getRequestDispatcher("jsp/car_feedback.jsp").forward(request, response);
			
		     }
		   if(cid.equals("4")){
			  User user=(User)request.getSession().getAttribute("user");
			  if(user == null){
				//未登录 提示
				request.setAttribute("msg", "请先登录");
				return "/jsp/login.jsp";
			}else{
				return "/jsp/car_online.jsp";
			}
		}
		
			
		} catch (Exception e) {
			request.setAttribute("msg", "分页查询失败");
			return "/jsp/msg.jsp";
		}
		return null;
	}
	/**
	 * 商品详情
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String getById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1.获取pid
			String pid = request.getParameter("pid");
			
			//2.调用service获取单个商品 参数:pid 返回值:product
			ProductService ps =new ProductServiceImpl();
			Product pro=ps.getById(pid);
			
			//3.将product放入request域中,请求转发 /jsp/product_info.jsp
			request.setAttribute("bean", pro);
		} catch (Exception e) {
			request.setAttribute("msg", "查询单个商品失败");
			return "/jsp/msg.jsp";
		}
		
		return "/jsp/product_info.jsp";
	}
}
