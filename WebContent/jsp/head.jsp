<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!doctype html>
<html>
<head>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script type="text/javascript">
  
$(function(){
	$("button").click(function(){
	
		if($("#test ").val()==""){
			return false;
		}else{
		
			window.location.href ="${pageContext.request.contextPath}/adminProduct?method=AllName&username="+encodeURI(encodeURI($("#test ").val()));;		
			window.event.returnValue=false; 
			
		}
		
	});
	      
  
		 //发送ajax 查询所有分类
		$.post("${pageContext.request.contextPath}/category",{"method":"findAll"},function(obj){
			//alert(obj);
			//遍历json列表,获取每一个分类,包装成li标签,插入到ul内部
			//$.each($(obj),function(){});
			$(obj).each(function(){
				//alert(this.cname);
				$("#c_ul").append("<li><a href='${pageContext.request.contextPath}/product?method=findByPage&pageNumber=1&cid="+this.cid+"'>"+this.cname+"</a></li>");
			});
		},"json"); 
		
	})
</script>
</head>
<body>
</body>
</html>
<!--
            	时间：2015-12-30
            	描述：菜单栏
            -->
           
		<div class="container-fluid">
			
					<div class=""  style="font-size:15px;text-align:right;hight:10px;">
				            <ol class="list-inline"  >	
						<c:if test="${empty user }">
							<li><a href="${pageContext.request.contextPath }/user?method=loginUI">登录</a></li>
							<li><a href="${pageContext.request.contextPath }/user?method=registUI">注册</a></li>
						</c:if>
						<c:if test="${not empty user }">
							${user.name }:你好!
							<li><a href="${pageContext.request.contextPath }/order?method=findMyOrdersByPage&pageNumber=1">我的订单</a></li>
							<li><a href="${pageContext.request.contextPath }/user?method=logout" >退出</a></li>
						</c:if>
						<li><a href="${pageContext.request.contextPath }/jsp/cart.jsp">购物车</a></li>
				</ol>
				</div>
			</div>
			<!--
            	时间：2015-12-30
            	描述：导航条
            -->
		<div class="container-fluid">
				<nav class="navbar navbar-inverse" style="background-color:#880000 ">
					<div class="container-fluid">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
							<a class="navbar-brand" href="${pageContext.request.contextPath }/jsp/index.jsp">首页</a>
						</div>

						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="font-size:17px">
							<ul class="nav navbar-nav" id="c_ul" style="font-size:17px">
							</ul>
							<form class="navbar-form navbar-right" method="post" name="form1">
								<div class="form-group">
									<input type="text" name="name" id="test" class="form-control" placeholder="Search">
								</div>
						
								<button class="btn btn-default">Submit</button>
							</form>

						</div>
						<!-- /.navbar-collapse -->
					</div>
					<!-- /.container-fluid -->
				</nav>
			</div>

			
			