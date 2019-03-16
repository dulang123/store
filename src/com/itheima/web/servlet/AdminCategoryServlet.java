package com.itheima.web.servlet;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itheima.domain.Category;
import com.itheima.service.CategoryService;
import com.itheima.service.impl.CategoryServiceImpl;
import com.itheima.utils.UUIDUtils;
import com.itheima.web.servlet.base.BaseServlet;

/**
 * 后台分类管理模块
 */
public class AdminCategoryServlet  extends BaseServlet{
	private static final long serialVersionUID = 1L;
	
	/**
	 * 添加分类
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1.封装category对象
			Category c = new Category();
			c.setCid(UUIDUtils.getId());
			c.setCname(request.getParameter("cname"));
			//2.调用service完成添加操作
			CategoryService cs = new CategoryServiceImpl();
			cs.save(c);
			
			//3.重定向
			response.sendRedirect(request.getContextPath()+"/adminCategory?method=findAll");
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return null;
	}
	
	/**
	 * 跳转到添加页面
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String addUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/admin/category/add.jsp";
	}
	
	public String china(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String count=request.getParameter("id");
		System.out.print(count);
		String name=java.net.URLDecoder.decode(request.getParameter("name"), "utf-8");
		request.setAttribute("id", count);
		request.setAttribute("name", name);
		return "/admin/category/mm.jsp";
	}
	/**
	 * 展示所有分类
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1.调用service 获取所有的分类
			CategoryService cs = new CategoryServiceImpl();
			List<Category> list=cs.findList();
			
			//2.将返回值放入request域中 请求转发
			request.setAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		
		return "/admin/category/list.jsp";
	}
	public String delet(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String count= java.net.URLDecoder.decode(request.getParameter("count"), "utf-8");
		System.out.println(count);
		CategoryService cs = new CategoryServiceImpl();
		cs.select(count);
		//Category c=new Category();
		int sc=cs.delect(count);
		System.out.println(sc);
		//String s=cs.delete(c);
		//System.out.println(s);
		response.sendRedirect(request.getContextPath()+"/adminCategory?method=findAll");
	    return null;
	}
	public String update(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String count=request.getParameter("id");
		String name=request.getParameter("name");
		CategoryService cs = new CategoryServiceImpl();
		Category c=cs.select(count);
		System.out.println(c.getCid()+c.getCname());
		CategoryService cs2 = new CategoryServiceImpl();
		String s=cs2.update(c,name);
		response.sendRedirect(request.getContextPath()+"/adminCategory?method=findAll");
		System.out.println("s");
		return null;
	}
	public void copy(HttpServletRequest request, HttpServletResponse response) throws Exception{
        try {
            Runtime rt = Runtime.getRuntime();
 
            // 调用 调用mysql的安装目录的命令
            Process child = rt
                    .exec("C:\\Program Files (x86)\\MySQL\\mysql Server 5.1\\bin\\mysqldump -h localhost -uroot -p123456 store");
            // 设置导出编码为utf-8。这里必须是utf-8
            // 把进程执行中的控制台输出信息写入.sql文件，即生成了备份文件。注：如果不对控制台信息进行读出，则会导致进程堵塞无法运行
            InputStream in = child.getInputStream();// 控制台的输出信息作为输入流
 
            InputStreamReader xx = new InputStreamReader(in, "utf-8");
            // 设置输出流编码为utf-8。这里必须是utf-8，否则从流中读入的是乱码
 
            String inStr;
            StringBuffer sb = new StringBuffer("");
            String outStr;
            // 组合控制台输出信息字符串
            BufferedReader br = new BufferedReader(xx);
            while ((inStr = br.readLine()) != null) {
                sb.append(inStr + "\r\n");
                
            }
            System.out.println(sb);
            outStr = sb.toString();
 
            // 要用来做导入用的sql目标文件：
            FileOutputStream fout = new FileOutputStream("e:\\d.sql");
            OutputStreamWriter writer = new OutputStreamWriter(fout, "utf-8");
            writer.write(outStr);
            writer.flush();
            in.close();
            xx.close();
            br.close();
            writer.close();
            fout.close();
 
            System.out.println("");
            String font="系统备份成功";
            request.setAttribute("font", font);
            request.getRequestDispatcher("/admin/sys.jsp").forward(request, response);
 
        } catch (Exception e) {
            e.printStackTrace();
        }
 
    }
	public void paste(HttpServletRequest request, HttpServletResponse response) throws Exception{
        try {
            Runtime runtime = Runtime.getRuntime();
            Process process = runtime
                    .exec("C:\\Program Files (x86)\\MySQL\\mysql Server 5.1\\bin\\mysql -hlocalhost -uroot -p123456 "
                    		+ "--default-character-set=utf8 store");
            OutputStream outputStream = process.getOutputStream();
            BufferedReader br = new BufferedReader(new InputStreamReader(
                    new FileInputStream("e:\\d.sql"), "utf-8"));
            String str = null;
            StringBuffer sb = new StringBuffer();
            while ((str = br.readLine()) != null) {
                sb.append(str + "\r\n");
               
            }
            str = sb.toString();
             System.out.println(str);
            OutputStreamWriter writer = 
            		new OutputStreamWriter(outputStream,"utf-8");
            writer.write(str);
            writer.flush();
            outputStream.close();
            br.close();
            writer.close();
            String font="系统还原成功";
            request.setAttribute("fonts", font);
            request.getRequestDispatcher("admin/sys.jsp").forward(request, response);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
