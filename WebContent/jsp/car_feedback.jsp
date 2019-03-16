<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script> 
		<title>意见反馈</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	 <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	  <style type="text/css">
		body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
		p{margin-left:5px; font-size:14px;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=O7ub0aEG1QFOQOZQEUZOo1MspfaU8LqY"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js"></script>
		

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
	 function fee(){	
		 if($("#feed").val()==""||$("#tele").val()==""){	
			 alert("请填写相关信息再提交")	;
		       return false;			
		 }
	 }
	
	</script>

</head>
<body>
<%@include file="/jsp/head.jsp" %>
<div  style="background:#DDDDDD;height:280px;" >
<div style="width:50%;float:left">
				<h3 font-weight="900">最新公告</h3>
			     <ol>	
			<li style="height:30px"><a href=#>4S店年度盛典折扣惊喜不断送保险免费保养一年，还有超级大礼包等惊喜不断···&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2018-04-05</a></li>
			<li style="height:30px"><a href=#>中国汽车工业协会上高度赞扬我公司的先进管理技术，完善的售后服务受到顾···&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2018-04-01</a></li>
			<li style="height:30px"><a href=#>招聘信息：公司现需维修技工两名，销售人员3名，技术能力强，有工作经验的···&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2018-03-21</a></li>
			<li style="height:30px"><a href=#>公司最新引进奥迪A8系，客户在最近一个月内购买将可以参与抽大奖，获赠奥迪···&nbsp;&nbsp;&nbsp;&nbsp;2018-03-15</a></li>
			<li style="height:30px"><a href=#>各位客户的年假通知：公司将在大年初一到初三放假三天。如需维修保养汽车请···&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2018-02-15</a></li>
			<li style="height:30px"><a href=#>据美联社报道，欧洲汽车制造商协会周三公布，2017年欧洲汽车销量十年以来连···&nbsp;&nbsp;&nbsp;&nbsp;2018-01-25</a></li>
			<li style="height:30px"><a href=#>3月10日，奔驰全新GLS正式上市，新车售价区间内为107.6-199.8万元，这款汽车···&nbsp;&nbsp;2018-01-13</a></li>
			</ol>
			</div>
	<div style="width:50%;float:left">
	<h3>金融服务</h3>
	<p><a href=#><font size="3"color="black">悦贷金融计划:</font>0%~30%的弹性尾款减轻月供压力，首付比例20%起（新能源车15%起），12，24，36···</a>
	<p><a href=#><font size="3" color="black">悠贷金融计划:</font>分摊期末尾款一次性还款压力，同时享受更低的月供。年度还款比例为贷款金额的13%···</a>
	<p><a href=#><font size="3" color="black">标准智享贷款:</font>产品覆盖全车系，首付20%起，贷款期限24个月起，每月月供逐年降低，为您的可能支出···</a>
	<p><a href=#><font size="3" color="black">二手车贷款:</font>首付30%-50%，年度还款比例为贷款金额的13%-20%，24或36个月贷款期限。</a>
	<p><a href=#><font size="3" color="black">标准贷款:</font>产品覆盖全车系，首付比例20%起（新能源车15%起），贷款期限12、24、36、48或60个月···</a>
	<p><a href=#><font size="3" color="black">标准弹性贷款:</font>产品覆盖全车系，首付比例20%~50%，36个月贷款期限，期末的尾款金额为40%，减轻···</a>
	</div>
</div>			
<div style="clear:both;background:url('${pageContext.request.contextPath}/jsp/img/fee.jpg') no-repeat;background-size:100% 100%;height:250px;">
<div width="100%" style="clear:both; font-size: 15px;">
<h3>意见反馈</h3>
<div style="width:74%;float:left" align="center">
<form action="${pageContext.request.contextPath}/user" method="post">
<input type="hidden" name="method" value="message">
<p>您的姓名<input type="text" name="name" style="height:30px;width:130px;border-radius:10px;">
您的电话<input type="text" id="tele" name="telephone" style="height:30px;width:130px;border-radius:10px;">
反馈类型<select name="type" style="width: 100px;height:30px;font-size:15px;border-radius:10px;"> 
      <option value="汽车销售">汽车销售</option> 
      <option value="汽车维修">汽车维修</option>
       <option value="汽车保养">汽车保养</option>
      </select></p>
<p><textarea rows="5" id="feed" name="message" cols="80" placeholder="请输入您的意见或者建议">
</textarea>
<p><input type="submit" value="提交反馈内容" onclick="return fee()"style="height:30px;width:100px;border-radius:10px;">
</form>
</div>
<div  style="width:26%;float:left;" align="center">
<c:if test="${msg!=null }">
 <font color="red"> ${msg }</font>
</c:if>
</div>
</div>
</div>
<div class="" style="clear:both;background:url('${pageContext.request.contextPath}/jsp/img/111.jpg') no-repeat;background-size:40% 100%;height:400px;">
				<div  style="width:40%;height:400px;font-size:20px;float:left;">
					<br><br><br>
										
					<h2 style="text-algin:center">联系我们</h2>
					<p style="text-algin:center">电话:0817-3392877</p>
					<p style="text-algin:center">邮箱：2849385120@qq.com</p>			
					<p style="text-algin:center">地址 :深圳市福田区广深高速21线</p>
					<p style="color:red;font-size:30px;">欢迎您的光临!</p>				
				</div>
				<div id="allmap" style="width:60%;height:400px;float:left"></div>						
			</div>
			
			
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	var point = new BMap.Point(114.076,22.626);
	map.centerAndZoom(point, 15);
	map.addControl(new BMap.MapTypeControl({
		mapTypes:[
            BMAP_NORMAL_MAP,
            BMAP_HYBRID_MAP
        ]}));	  
	map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的
	map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
	var marker = new BMap.Marker(new BMap.Point(114.076,22.626)); // 创建点

	map.addOverlay(marker); 
	
</script>