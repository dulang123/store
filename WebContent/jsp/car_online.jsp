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

<script type="text/javascript">
window.setInterval("showContent();",10000);
function showContent(){
	var url="${pageContext.request.contextPath }/user?method=send&content="
	var args={"time":new Date()}		
	$.post(url,args,function(data){
		$("#message").html(data);
	});
	return false;
    }  
	function send() { //验证聊天信息并发送
		var val=$("#content1").val();
		if(val==""){
			alert("发送信息不可以为空！");
			form1.content1.focus();
			return false;
		}
		var url="${pageContext.request.contextPath }/user?method=send&from="+encodeURI(encodeURI($("#form1").val()))+"&content="+encodeURI(encodeURI(val)); 
		var args={"time":new Date()}
		$.post(url,args,function(data){
			$("#message").html(data);
		});
		return false;
		
	}
	
	function checkScrollScreen(){
	    if(!$('#scrollScreen').is(':checked')){
	    	 document.getElementById("message").style.overflow='scroll';
	    }else{	       
	        document.getElementById("message").style.overflow='hidden';
	        document.getElementById('message').scrollTop = document.getElementById('message').scrollHeight*2;   
	       
	    }
	    setTimeout('checkScrollScreen()',500);
	}
</script>
</head>
<body onload="checkScrollScreen()">
	<%@include file="/jsp/head.jsp"%>
	
	<div class="a" style="width: 60%;height: 500px;float:left;">	
				<div style="background-color:#0000AA;height: 50px;" id="content" align="center"><font size="3" color="red">聊天内容</font></div>
				<div style="height:80%"  id="message" align="center"; >
				<c:if test="${message!=null }">
		         ${message }
	             </c:if>
				</div>	
			<div style="background-color:#0000AA;"  align="center">	
			<table>
	        <tr>
	        <form action=""  name="form1" method="post">		       	
			<td width="19" align="left"><font size="3" color="red">${user.name }</font></td>
			<input name="from" type="hidden" id="form1"value="${user.name }"> 
			<td width="19" align="left"></td>
			<td><input type="text"id="content1" style="height:50px;width:300px;font-size:20px;"> </td>
		    <td align="right"><input name="Submit2" type="submit" class="btn_grey" value="发送"style="height:50px;width:100px;"  onclick="return send()"></td>
		   <td width="19" align="left"><input name="scrollScreen" type="checkbox" class="noborder" id="scrollScreen" onClick="checkScrollScreen()" value= "1" checked></td>	
		 	</form>
	      </tr>	
	      </table>
	</div>
</div>
<div style="width: 40%;height: 500px;text-align:center;float:left; background-image:url(${pageContext.request.contextPath}/image/10.jpg);background-size:100%100%;">
<font size="5" color="blue" >4S旗舰店欢迎您的光临</font>
</div>	
</body>
</html>