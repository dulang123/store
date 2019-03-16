<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>w
<body  style="width:100%;height:500px;background: url('${pageContext.request.contextPath}/jsp/img/1.jpg') no-repeat;background-size:100% 100%;">
 
<div style="width:100%;height:50px">
<center>
</center> 
<form method="post" action="${pageContext.request.contextPath }/user?method=adminlogin" target="_parent" name='theForm' onsubmit="return validate()">
  <table cellspacing="0" cellpadding="0" style="margin-top: 100px" align="center">
  <tr>
      <td style="padding-left: 50px"><c:if test="${msg!=null }">
<font color="red">${msg }</font>
</c:if>      
      </td></tr>
  <tr>
    <td style="padding-left: 50px">
      <table>
      
      <tr>
        <td style="color:blue">管理员姓名：</td>
        <td><input type="text" name="username" style="width:150px;height:20px"/></td>
      </tr>
      <tr>
        <td style="color:blue">管理员密码：</td>
        <td><input type="password" name="password" style="width:150px;height:20px"/></td>
      </tr>
      <tr><td>&nbsp;</td><td><input type="submit" value="进入管理中心" style="width:150px;height:30px"class="button" /></td></tr>
      
      </table>
    </td>
  </tr>
  </table>
</form>
</div>
</body>
</html>