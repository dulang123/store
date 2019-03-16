package com.itheima.web.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import com.itheima.constant.Constant;
import com.itheima.domain.Category;
import com.itheima.domain.PageBean;
import com.itheima.domain.Product;
import com.itheima.service.CategoryService;
import com.itheima.service.ProductService;
import com.itheima.service.impl.CategoryServiceImpl;
import com.itheima.service.impl.ProductServiceImpl;
import com.itheima.utils.UUIDUtils;
import com.itheima.utils.UploadUtils;
import com.itheima.web.servlet.base.BaseServlet;

/**
 * 后台商品模块
 */
public class AdminProductServlet  extends BaseServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 跳转到添加的页面上
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String addUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			//调用categoryservice 查询所有分类
			CategoryService cs = new CategoryServiceImpl(); 
			
			request.setAttribute("list", cs.findList());
		} catch (Exception e) {
		}
		return "/admin/product/add.jsp";
	}
	public String china(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		String price=request.getParameter("price");
		String number=request.getParameter("number");
		String desc=java.net.URLDecoder.decode(request.getParameter("desc"), "utf-8");
		String name=java.net.URLDecoder.decode(request.getParameter("name"), "utf-8");
		System.out.println(id+name+price+number+desc);
		try {
			//调用categoryservice 查询所有分类
			CategoryService cs = new CategoryServiceImpl(); 
			
			request.setAttribute("list", cs.findList());
		} catch (Exception e) {
		}
		request.setAttribute("id", id);
		request.setAttribute("name", name);
		request.setAttribute("price", price);
		request.setAttribute("number", number);
		request.setAttribute("desc", desc);
		return "/admin/product/edit.jsp";
	}
	/**
	 * 展示已上架商品列表
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1.调用service 查询以上架商品
			ProductService ps = new ProductServiceImpl();
			List<Product> list = ps.findAll();
			
			//2.将返回值放入request中,请求转发
			request.setAttribute("list", list);
			request.getRequestDispatcher("/admin/product/list.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		
	}
	public void AllName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1.调用service 查询以上架商品
			ProductService ps = new ProductServiceImpl();
			String name=java.net.URLDecoder.decode(request.getParameter("username"), "utf-8");
			//List<Product> list = (List<Product>) ps.getByName(name);
			List<Product> list=ps.ByName(name);
			//3.将pagebean放入request中,请求转发 product_list.jsp
			if(list!=null && !list.isEmpty()){	
			request.setAttribute("list", list);
		
			System.out.println(list.size()+"size");
			}else{
				String error="抱歉，该商品暂未出售";
				request.setAttribute("error", error);
			}
			request.getRequestDispatcher("/jsp/productshow.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	
	}
	public String delet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			//调用categoryservice 查询所有分类
			ProductService ps = new ProductServiceImpl();
			String count =request.getParameter("count");
			System.out.println(count);
			ps.delet(count);
		} catch (Exception e) {
		}
		response.sendRedirect(request.getContextPath()+"/adminProduct?method=findAll");
		return null;
	}
	
	
}
