<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!doctype html>
<html>
<head>
		<title>WEB01</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
		<!-- 引入自定义css文件 style.css -->


   <style type="text/css">
    .code
    {
            background:url(code_bg.jpg);
            font-family:Arial;
            font-style:italic;
             color:blue;
             font-size:30px;
             border:0;
             padding:2px 3px;
             letter-spacing:3px;
             font-weight:bolder;             
             float:left;            
             cursor:pointer;
             width:100px;
             height:60px;
             line-height:60px;
             text-align:center;
             vertical-align:middle;

    }
  body {
				margin-top: 20px;
				margin: 0 auto;
				width: 100%;
			}
			.carousel-inner .item img {
				width: 100%;
				height: 500px;
			}
 
font {
    color: #666;
    font-size: 40px;
    font-weight: normal;
    padding-right:17px;
}
 </style> 
  <script language="javascript" type="text/javascript">

        var code;
        function createCode() {
            code = "";
            var codeLength = 4; //验证码的长度
            var checkCode = document.getElementById("checkCode");
            var codeChars = new Array( 2, 3, 4, 5, 6, 7, 8, 9, 
            'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); 
           
            for (var i = 0; i < codeLength; i++) 
            {
                var charNum = Math.floor(Math.random() * 52);
                code += codeChars[charNum];
               
            }
                checkCode.className = "code";
                checkCode.innerHTML = code;
            
        }
        function validateCode() 
    
        {   if($('#savename').is(':checked')) {
        	
        	  $('#savename').val("ok");
        }
        if($('#savepwd').is(':checked')) {
        	$('#savepwd').val("ok");
        }
            var inputCode = document.getElementById("inputCode").value;
            if (inputCode.length <= 0) 
            {
            	  alert("请输入验证码！");
            	  return false;
            }
            if (inputCode.toUpperCase() != code.toUpperCase()) 
            {
                alert("验证码输入有误！");
                createCode();
                return false;
            }
      
            
            
        } 
     </script>
     
</head>
<body onload="createCode()">
           <%@include file="head.jsp" %>  
<div class="container"  style="width:100%;height:460px;background:#FF2C4C url('${pageContext.request.contextPath}/jsp/img/1.jpg') no-repeat;background-size:100% 100%;">
<div class="row"> 
	
	<div class="col-md-5">
				<div style="width:440px;border:1px solid #E7E7E7;padding:20px 0 20px 30px;border-radius:5px;margin-top:60px;background:#fff;">
				<font>会员登录</font>USER LOGIN 
                 <p style="color:red;text-indent:5em;" >${msg}</p>
				<div>&nbsp;</div>
<form class="form-horizontal" action="${pageContext.request.contextPath }/user" method="post"  id="form1">
	<input type="hidden" name="method" value="login">
  
 
 <div class="form-group">

    <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">用户名</label>
    <div class="col-sm-6">
     <input type="text" class="form-control" id="username"  placeholder="请输入用户名" name="username" >
    </div>
  </div>
   <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
    <div class="col-sm-6">
      <input type="password" class="form-control" id="inputPassword3" placeholder="请输入密码" name="password">
    </div>
  </div>

    <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">验证码</label>     
    <div class="col-sm-3">
      <input type="text" class="form-control"  id="inputCode"  placeholder="验证码">
    </div>
    <div class="col-sm-3"   
     id="checkCode" onclick="createCode()">
     </div>
   <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox"> 
       <label>
          <input type="checkbox" id="savepwd" name="savepwd" > 自动登录
        </label>     
        <label>
          <input type="checkbox" id="savename" name="savename"> 记住用户名
        </label>
      </div>
    </div>
  </div>

  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
    <input type="submit"  width="100" value="登录" name="submit" onclick="return validateCode()" border="0"
    style="background: url('${pageContext.request.contextPath}/images/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
    height:35px;width:100px;color:white;" >
    </div>
  </div>
 
</form>
</div>			
</div>
</div>
</div>	

	
		
</body>
<script type="text/javascript">
$(function(){
	var val = "${cookie.savename.value}";
	if(val!=""){
		document.getElementById("username").value=decodeURI(val);
	}
})	
</script>
</html>