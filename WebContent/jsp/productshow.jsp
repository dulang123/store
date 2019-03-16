<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>汽车销售</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
		<!-- 引入自定义css文件 style.css -->
		<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" /> --%>

		<style>
			body {
				margin-top: 20px;
				margin: 0 auto;
				width: 100%;
			}
			.carousel-inner .item img {
				width: 100%;
				height: 500px;
			}
		</style>
	</head>

	<body>
		
			<%@include file="/jsp/head.jsp" %>


		<div class="row" style="width:100%;margin:0 auto;">
			
			<div style="text-align:center;font-size:50px">
			<c:if test="${error!=null}">
			${error }
			</c:if>
			</div>
			<c:forEach items="${list }" var="p">
				<div class="col-md-2" style="width:30%;margin:0 18px;">
					<p><a href="${pageContext.request.contextPath }/product?method=getById&pid=${p.pid}">
						<img src="${pageContext.request.contextPath}/${p.pimage}" width="400" height="250">
					</a></p>
					<div align="center">
					<p><a href="${pageContext.request.contextPath }/product?method=getById&pid=${p.pid}" style='color:green'>${fn:substring(p.pname,0,10) }..</a></p>
					<p><font color="#FF0000">商城价：&yen;${p.shop_price }</font></p>
					</div>
				</div>
			</c:forEach>

		</div>

		
		
		
		

	</body>

</html>