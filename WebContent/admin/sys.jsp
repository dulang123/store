<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.divForm{
position: absolute;/*绝对定位*/
width: 800px;
height: 200px;
text-align: center;/*(让div中的内容居中)*/
top: 50%;
left: 20%;
margin-top: -200px;
margin-left: -150px;

}
</style>
</head>
<body>
  <div class="divForm" > 
  <h1 align="center">系统备份</h1>
<form action="${pageContext.request.contextPath}/adminCategory" method="post">
<input type="hidden" name="method" value="copy">
<p>	
系统备份是防止数据库丢失的重要方法，备份的数据库将放到E:/d.sql</p>

<c:if test="${requestScope.font!=null }">
<font size="5" color="blue">备份成功</font>

</c:if>
<input type="submit" value="系统备份">
</form>
<h1 align="center">系统还原</h1>
<form action="${pageContext.request.contextPath}/adminCategory" method="post">
<input type="hidden" name="method" value="paste">
<p>
系统还原是防止数据库丢失的重要方法，还原的数据库将从E:/d.sql	放的本系统数据库中</p>
<p>请注意没备份数据库d.sql文件就无法还原</p>
<c:if test="${requestScope.fonts!=null }">
<font size="5" color="blue">还原成功</font>
</c:if>
<input type="submit" value="系统还原">
</form>
</div>
</body>
</html>