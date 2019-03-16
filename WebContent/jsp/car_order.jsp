<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>维修保养</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
	type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->



<style>
body {
	margin-top: 20px;
	margin: 0 auto;
	width: 100%;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}
</style>
<script type="text/javascript">
	function a() {
		var temp = $("#state").is(":hidden");
		if ($("#state").is(":hidden") == true) {
			($("#state").css('display', 'block'));
			return false;
		}
		if ($("#state").is(":hidden") == false) {
			($("#state").css('display', 'none'));
			return false;
		}
	}
	function b(i) {
		if (i == "b") {
			$("#b").css('display', 'block');
			$("#c").css('display', 'none');

		}
		if (i == "c") {
			$("#c").css('display', 'block');
			$("#b").css('display', 'none');

		}
	}

	function subForm(s){
		if(s=="b"){
			document.getElementById("form6").submit();
		}
		if(s=="c"){
			document.getElementById("form5").submit();
		}
		

	}
</script>
</head>
<body>
	<%@include file="/jsp/head.jsp"%>
	<div>
		<div style="background-color: #666666; height: 40px">
			<a href="javascript:void(0)" onclick="a()"> <font size="4px"
				style="font-weight: 600">服务声明</font></a>
		</div>
		<div id="state"
			style="width: 100%; font-size: 15px; display: none; border-style: solid; border-color: #DDDDDD; border-width: 5px 5px 5px 5px;">
			<div align="center">
				<h2>
					<font size="4px" style="font-weight: 900">服务声明</font>
				</h2>
			</div>
			<p style="text-indent: 6em;">维修保养需先到网上预约，由于公司要维修汽车较多，并且维修前公司要准备相关的零件、安排维修工人、安排相应车位、减少客户等待时间。现把具体流程公示如下：</p>
			<p>
				<font size="4px" style="font-weight: 900">汽车维修:</font>1、网上预约。2、公司初步计算费用。3、公司通知客户协商。4、公司通知客户送车维修。5、完成提车，计算总费用。6、售后服务。
			</p>
			<p>
				<font size="4px" style="font-weight: 900">汽车保养:</font>1、网上预约。2、公司初步计算费用。3、公司通知客户协商。4、公司通知客户送车保养。5、完成提车，计算总费用。6、售后服务。
			</p>
			<p>
				<span style="color: red;"><font size="4px"
					style="font-weight: 900">特别提示:</font>如果客户在本店买车，将享受维修保养9折优惠，新客户如果办理VIP也可以享受9折优惠!</span>
			</p>
		</div>
	</div>
	<div
		style="background-color: #666666; height: 40px; margin: 20px 0 0 0">
		<nobr>
			<a href="javascript:void(0)" onclick="b('b')"> <font size="4px"
				style="font-weight: 900">维修预约</font></a> <a href="javascript:void(0)"
				onclick="b('c')"> <font size="4px" style="font-weight: 900">保养预约</font></a>
		</nobr>
	</div>
	<div
		style="width:100%;background:url('${pageContext.request.contextPath}/jsp/img/1.jpg') no-repeat;background-size:100% 1000px;">
		<div width="100%" style="clear: both;" id="b">
			<div
				style="width: 60%; font-size: 18px; background: #ffffff; font-weight: 900; border-style: solid; border-width: 15px 15px 15px 15px; border-color: #DDDDDD; Margin: 0 250px 0 250px;"
				align="center">
				<h2>维修预约</h2>
				<form id="form6" action="${pageContext.request.contextPath}/order?" method="post">
				<input type="hidden" name="method" value="carorder">
				<input type="hidden" name="type" value="汽车维修">
					<p style="float: left; text-indent: 6em;">
						真实姓名<input name="name" type="text"
							style="width: 350px; height: 40px; border-radius: 10px;">
					</p>
					<p style="float: left; text-indent: 6em;">
						联系电话<input name="telephone" type="text"
							style="width: 350px; height: 40px; border-radius: 10px;">
					</p>
					<p style="float: left; text-indent: 6em;">
						预约时间<input name="ordertime" type="date"
							style="width: 350px; height: 40px; border-radius: 10px;">
					</p>
					<p style="float: left; text-indent: 6em;">
						维修说明
						<textarea name="explain"
							style="width: 350px; height: 150px; border-radius: 10px;"
							placeholder="请填写汽车车型，汽车出现问题，可能需要更换的零配件和个人要求"></textarea>
					</p>
					<p>
					<a href="javascript:void(0)" onclick="subForm('b')">
						<img src="${pageContext.request.contextPath}/jsp/img/sumbit.jpg"
							style="width: 400px; height: 150px;" align="center" />
							</a>
					</p>
				</form>
			</div>
		</div>
		
		<div width="100%" style="clear: both;display:none" id="c">
			<div
				style="width: 60%; font-size: 18px; background: #ffffff; font-weight: 900; border-style: solid; border-width: 15px 15px 15px 15px; border-color: #DDDDDD; Margin: 0 250px 0 250px;"
				align="center">
				<h2>保养预约</h2>
				<form id="form5" action="${pageContext.request.contextPath}/order?" method="post">
				<input type="hidden" name="method" value="carorder">
				<input type="hidden" name="type" value="汽车保养">
					<p style="float: left; text-indent: 6em;">
						真实姓名<input name="name" type="text"
							style="width: 350px; height: 40px; border-radius: 10px;">
					</p>
					<p style="float: left; text-indent: 6em;">
						联系电话<input name="telephone" type="text"
							style="width: 350px; height: 40px; border-radius: 10px;">
					</p>
					<p style="float: left; text-indent: 6em;">
						预约时间<input name="ordertime" type="date"
							style="width: 350px; height: 40px; border-radius: 10px;">
					</p>
					<p style="float: left; text-indent: 6em;">
						保养说明
						<textarea name="explain"
							style="width: 350px; height: 150px; border-radius: 10px;"
							placeholder="请填写汽车保养内容，汽车使用的时间，行驶了约多少万公里和个人要求"></textarea>
					</p>
					<p>
					<a href="javascript:void(0)" onclick="subForm('c')">
						<img src="${pageContext.request.contextPath}/jsp/img/sumbit.jpg"
							style="width: 400px; height: 150px;" align="center" />
							</a>
					</p>
				</form>
	      </div>
		</div>
		</div>		

	</body>
</html>
</body>
</html>