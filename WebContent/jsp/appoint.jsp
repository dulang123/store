<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>会员登录</title>
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
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}
</style>
</head>

<%@include file="/jsp/head.jsp"%>

<body>

	<form action="${pageContext.request.contextPath }/order" id="orderForm"
		method="post" class="form-horizontal"
		style="margin-top: 5px; margin-left: 150px;">
		<input type="hidden" name="method" value="pay"> <input
			type="hidden" name="address"> <input type="hidden"
			name="name"> <input type="hidden" name="telephone">
		<input type="hidden" name="oid" value="${bean.oid }">
		<div class="row">
		<div style="margin:0 auto;margin-top:10px;width:950px;">
					<strong>订单详情</strong>
		<table class="table table-bordered">
						<tbody>
							<tr class="warning">			
		
				<th colspan="2">订单编号:${bean.oid } </th>
				<th colspan="2">订单状态:
				
									<c:if test="${bean.state == 0 }">未付款</c:if>
									<c:if test="${bean.state == 1 }">已付款</c:if>
									<c:if test="${bean.state == 2 }">确认收货</c:if>
									<c:if test="${bean.state == 3 }">已完成</c:if>
								</th>
				
				</tr>
				<tr class="warning">
				             <th>预约时间</th>
								<th>订单类型</th>
								<th>预约定金</th>
								<th>总计</th>								
							</tr>				
				
			<tr class="active">
			<td  width="20%">${bean.ordertime }</td>
				<td  width="20%">${bean.type }</td>
				<td  width="20%">${bean.total }</td>
				<td  width="20%">${bean.total }</td>
				
				
			</tr>
			</tbody>
			</table>
			</div>

				<div style="text-align:right;margin-right:120px;">
					付款金额: <strong style="color:#ff6600;">￥${bean.total }元</strong>
				</div>

			</div>
<!-- --- -->


		<div style="margin-top:5px;margin-left:150px; align="center">
			<strong>选择银行：</strong>
			<p>
				<br /> <input type="radio" name="pd_FrpId" value="ICBC-NET-B2C"
					checked="checked" />工商银行 <img
					src="${pageContext.request.contextPath}/bank_img/icbc.bmp"
					align="middle" />&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
					name="pd_FrpId" value="BOC-NET-B2C" />中国银行 <img
					src="${pageContext.request.contextPath}/bank_img/bc.bmp"
					align="middle" />&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
					name="pd_FrpId" value="ABC-NET-B2C" />农业银行 <img
					src="${pageContext.request.contextPath}/bank_img/abc.bmp"
					align="middle" /> <br /> <br /> <input type="radio"
					name="pd_FrpId" value="BOCO-NET-B2C" />交通银行 <img
					src="${pageContext.request.contextPath}/bank_img/bcc.bmp"
					align="middle" />&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
					name="pd_FrpId" value="PINGANBANK-NET" />平安银行 <img
					src="${pageContext.request.contextPath}/bank_img/pingan.bmp"
					align="middle" />&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
					name="pd_FrpId" value="CCB-NET-B2C" />建设银行 <img
					src="${pageContext.request.contextPath}/bank_img/ccb.bmp"
					align="middle" /> <br /> <br /> <input type="radio"
					name="pd_FrpId" value="CEB-NET-B2C" />光大银行 <img
					src="${pageContext.request.contextPath}/bank_img/guangda.bmp"
					align="middle" />&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
					name="pd_FrpId" value="CMBCHINA-NET-B2C" />招商银行 <img
					src="${pageContext.request.contextPath}/bank_img/cmb.bmp"
					align="middle" />

			</p>
			<hr />
			<p style="text-align: right; margin-right: 100px;">
				<a href="javascript:document.getElementById('orderForm').submit();">
					<img
					src="${pageContext.request.contextPath}/images/finalbutton.gif"
					width="204" height="51" border="0" />
				</a>
			</p>
			<hr />

		</div>
			
	</form>

	
	

</body>
</html>