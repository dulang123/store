<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>	
  
		<title>WEB01</title>
		<script src="${pageContext.request.contextPath}/js/du.js" type="text/javascript"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles3.css" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
      <script src="js/base-loading.js"></script>
		 <script type="text/javascript">
		 function app(){
			 if($(" #na ").val()==""||$(" #time ").val()==""){
				 
				 
			       return false;
				
			 }
		 }
		function su(i){
	if(i=="a"){		
		$("#da").css('display','block');
		$("#bb").css('display','none');
		$("#cc").css('display','none');
		
	}
	
	if(i=="b"){
		$("#bb").css('display','block');
		$("#da").css('display','none');
		$("#cc").css('display','none');
		
	} 
	if(i=="c"){
		$("#cc").css('display','block');
		$("#da").css('display','none');
		$("#bb").css('display','none');
	}
} </script>
	
	</head>
	<body>
		<div class="">			
			<%@include file="/jsp/head.jsp" %>
			<div class="container-fluid">
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="${pageContext.request.contextPath}/jsp/img/16.jpg" style="width:100%;height:800px;" >

						</div>
						<div class="item">
							<img src="${pageContext.request.contextPath}/jsp/img/4.jpg" style="width:100%;height:800px;" >
							
						</div>
						<div class="item">
							<img src="${pageContext.request.contextPath}/jsp/img/12.jpg" style="width:100%;height:800px;">
						</div>
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<!--
            	作者：ci2713@163.com
            	时间：2015-12-30
            	描述：商品显示
            -->
			<div class="" width="100%" style="clear:both ;">
				<div><h2>走进公司</h2></div>			
				<div style="width:25%;height:500px;float:left;background-color:	#40E0D0 ">
				<h3 font-weight= "900">品牌信誉</h3>
			<p style="text-indent: 2em;">公司在1998年成立，是中国最早一批引进4S店的厂家，在成立公司的时候，我们以品牌造就实力，服务提升生活的发展理念来发展。在汽车4S店成立这20年来，我们不断反省，不断超越
			在汽车行业里成为领头羊，汽车销售量以每年20%的增速持续增长，今年将突破一万辆！在为客户的路上，我们不断收到客户的好评与赞扬，但我们没有骄傲，我们永远在路上。</p>
			<p style="text-indent: 2em;">公司的主要销售汽车品牌是奥迪系列，奔驰系列和宝马系列。在近年来奥迪汽车以它的低调沉稳，质量保证受到众多客户追捧，它的美不在于它的清秀，而在与它的大气磅礴的内心下却示人成熟低调的外表
			而客户选择汽车维修保养时，公司承诺以服务成就品牌，以诚信完善消费，360度的透明流程人客户感到物有所值</p>
			</div>
			<div style="width:45%;height:500px;float:left;background-color:	#708090">				
			<h3>定制汽车</h3>车型
<select id="select" name="select" style="width: 100px;height:30px;font-size:15px"> 
<option value="0">奥迪系列</option> 
<option value="1">奔驰系列</option>
</select>
颜色<select id="myselect"  style="width: 100px;height:30px;font-size:15px"> 
<option value="0">传奇黑色</option> 
<option value="1">探戈红色</option>
<option value="2">朱鹭白色</option>  
</select>
<div id="a" ><img src="${pageContext.request.contextPath}/jsp/img/21.jpg" style="width:100%;height:415px;float:left"/></div>
<div id="b"style="display:none"><img src="${pageContext.request.contextPath}/jsp/img/22.jpg" style="width:100%;height:415px;float:left"/></div>
<div id="c" style="display:none"><img src="${pageContext.request.contextPath}/jsp/img/23.jpg" style="width:100%;height:415px;float:left"/></div>
<div id="d" style="display:none"><img src="${pageContext.request.contextPath}/jsp/img/31.jpg" style="width:100%;height:415px;float:left"/></div>
<div id="e" style="display:none"><img src="${pageContext.request.contextPath}/jsp/img/32.jpg" style="width:100%;height:415px;float:left"/></div>
<div id="f" style="display:none"><img src="${pageContext.request.contextPath}/jsp/img/33.jpg" style="width:100%;height:415px;;float:left"/></div>
	</div>
			<div style="width:30%;height:500px;float:left;background-color:#40E0D0 ;">
				<h3>个人服务</h3>	
				申请VIP：<div style="width:100%;height:100px;">
				<p style="text-indent: 2em;">尊敬的客户您好，申请VIP将为您提高您的服务质量，能更细致而全面地为您的爱车提供呵护，在汽车维修保养时您将直接享受9折优惠，
				预约排队将不再更久的等待，在下次购买新车的时候将享受9.5的惊喜价！<a href="${pageContext.request.contextPath}/order?method=carorder&ordertime=">现在去申请吧！</a>
				</div>
			
				预约试车
				   <form name="form4" action="${pageContext.request.contextPath}/order" method="post">
				   <input type="hidden"name="method" value="carorder">
				   <input type="hidden"name="type" value="预约试驾">
					<p list-style="none;">真实姓名<input name="name" id="na" type="text" style="height:30px;width:110px;border-radius:10px;">
					预约车型<select name="explain" style="width: 100px;height:30px;font-size:15px;border-radius:10px;"> 
      <option value="奥迪A8i预约试驾">奥迪A8i</option> 
      <option value="奔驰C200试驾">奔驰C200</option>
       <option value="奔驰C200试驾">宝马5T</option>
      </select></p>
					<p>电话号码<input name="telephone" type="text" style="height:30px;width:150px;border-radius:10px;"></p>
					<p>预约时间<input name="ordertime" id="time" type="date" style="height:30px;border-radius:10px;"></p>
					<p list-style="none;">具体地址<input name="address" type="text" style="height:30px;width:150px;border-radius:10px;"></p>
					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" onclick="return app()" value="马上预约" style="height:30px;width:100px;border-radius:10px;" align="center">	
					</form>	
				
					
</div>						
</div>		
<div  style="width:100%;height:200px;background-color:#33b2CC;clear:both ;">
<div id="flash" style="width:300px;;height:200px;">
<img src="${pageContext.request.contextPath}/jsp/img/fla.jpg" style="width:300px;;height:200px;"/>
</div>	
</div> 
<!--
           	作者：ci2713@163.com
            	时间：2015-12-30
            	描述：广告部分
            -->
<div  width="100%">
<div  width="100px" style="clear:both ;">
<h2 style="text-align:left">最新汽车</h2>
<nobr ><td> <h3> <a href="javascript:void(0)" onclick="su('a')" style="float:left" align="center">奥迪A8&nbsp;&nbsp;</a></h3>
<h3><a href="javascript:void(0)" onclick="su('b')" style="float:left" align="center">奔驰c200&nbsp;&nbsp;</a></h3>    
<h3><a href="javascript:void(0)" onclick="su('c')" style="float:left" align="center">宝马5系&nbsp;&nbsp; </a></h3></td></nobr> 
</div>   
            <div style="width:100%;hight:400px;clear:both ;">
   
                 <div id="da">				   
				   <div style="font-size:10px;">				  
				   <img src="${pageContext.request.contextPath}/jsp/img/17.jpg" style="width:60%;height:500px;float:left"/>
				   </div>
				   <div style="width:40%;height:500px; background-color:#C8C8C8;float:left">
				    <h4 style="text-indent:8em;font-color:red;height:30px"><font color="red">奥迪A8&nbsp;&nbsp;&nbsp;报价：70万</font></h4>
				   <p style="text-indent:2em;"> 弹射起步模式还是那么简单，步骤不再多说，车身保持略微仰头的姿态顺利弹出，身体的撞击感仍然强烈，起步G值最高0.982g，比S8稍晚也稍低，1挡内持续爆发力相当强，一直维持在0.8g附近，不过进入2挡后趋于缓和，降到0.5g附近，S8在这时候可是又出现了一次1.03g的动力高潮，算了算了，别提那台难以理解的车了。A8L的成绩锁定在4.4秒，比官方4.7秒更快。奥迪在2008 年入选世界品牌价值实验室编制的《中国购买者满意度第一品牌》，排名第七。</p><p style="text-indent:2em;">奥迪轿车的标志为四个圆环，代表着合并前的四家公司。这些公司曾经是自行车、摩托车及小客车的生产厂家。由于该公司原是由4家公司合并而成，因此每一环都是其中一个公司的象征。
德国奥迪公司制造汽车与摩托车的历史可追溯到19世纪。最初设在萨克森州的四家汽车公司——茨维考市(zwickau)的奥迪（audi）和霍希(horch)汽车公司、开姆尼--西格玛市(chemnitz-siegmar)的漫游者汽车公司（wanderer）以及zschopau市的dkw汽车公司，对当时德国汽车工业的进步做出了杰出的贡献。
</p>
				   </div>
			      </div>		      
                  <div id="bb" style="display:none;">				   
				   <div style="font-size:10px;">			   
				   <img src="${pageContext.request.contextPath}/jsp/img/32.jpg" style="width:60%;height:500px;float:left"/>
				   </div>
				   <div style="width:40%;height:500px;float:left;background-color:#C8C8C8;">
				    <h4 style="text-indent:8em;"><font color="red">奔驰c200&nbsp;&nbsp;&nbsp;报价：110万</font></h4>
				   <p>&nbsp;&nbsp;&nbsp;&nbsp;与前代车型相比，C 级轿跑车将运动理念演绎得更为鲜活，加之别具一格的外观，为双门轿跑车的设计树立了新的标杆。始终如一的运动性轿跑车设计与低矮扁平的轮廓浑然一体，辅以无框车门、全新后端以及两件式 LED 尾灯，成为焦点。内饰中处处流露着运动气息，这同样离不开采用一体式外观的座椅。除了设计，其驾驶体验也是丝毫不逊色。(AIRMATIC) 等装备相辅相成，使 C 级轿跑车成为竞争的主导者。奔驰车，不但质量无可比拟，而且车系齐全，目前主要生产C级车（中档轿、跑车）、E级车（高档轿、跑车）、S级车（豪华轿、跑车），还有G型车（SUV越野车）。</p>
				   <p style="text-indent:2em;"> 公司早期出产的车分为曼海姆版和斯图加特版，1936年至今，无论是高中低档车都统一为一个相同的名字“梅塞德斯——奔驰”。之所以取这个名，有一段佳话。1899年，奥地利驻德总领事埃米尔·杰利内克订购了3辆戴姆勒凤凰牌轿车，他用他女儿的名字——梅塞德斯为它们命名，并开着车参加了尼斯汽车拉力赛，获得了冠军。埃米尔认为是他女儿的名字带来了好运，就建议戴姆勒公司采用其名。戴姆勒公司也希望借这个奥地利贵族帮它打开奥地利市场，便采用了此名，没想到，其销量大增。后来成立的戴姆勒—奔驰公司也将其产品全部命为梅塞德斯—奔驰。</p>
				   </div>
				 
			      </div>		      
                 <div id="cc" style="display:none">				   
				   <div style="font-size:10px;">
				   <img src="${pageContext.request.contextPath}/jsp/img/35.jpg" style="width:60%;height:500px;float:left"/>
				   </div>
				   <div style="width:40%;height:500px;float:left;background-color:#C8C8C8;">
				   <h4 style="text-indent:8em;"><font color="red">宝马5系&nbsp;&nbsp;&nbsp;报价：55万</font></h4>
				   <p style="text-indent:2em;">宝马5系在豪华中大型车里很有竞争力，全新一代5系（代号G38）于6月底正式上市，长轴版价格区间为44.99万-66.39万元。新车采用和7系类似的设计风格，造型更加年轻化。这代5系在技术上有质的提升。全车身采用约70%的铝质材料，比老款减重约100公斤以上；这让整车的操控更加出色，在舒适性与运动间达到了一种更平衡的状态。BMW的蓝白标志象征着旋转的螺旋桨，这正是公司早期历史的写照。但是现任的宝马总裁却更正说，人们总以为蓝白标志是螺旋桨，其实应该是，宝马的总部在慕尼黑，德国的巴伐利亚州，而巴伐利亚州的州旗是蓝白相间的，宝马的名字又是巴伐利亚发动机公司，宝马就代表了巴伐利亚，代表了德国最精湛的发动机技术。</p>
<p style="text-indent:2em;">1923年，第一部宝马摩托车问世。五年后的1928年，BMW收购了埃森那赫汽车厂，并开始生产汽车。之后，BMW将许多汽车制造史上的杰作推向市场，这些产品不断激发出强烈的感情和人们的渴望，铸就了BMW公司作为一家汽车制造商的杰出声誉。
BMW是全世界最成功和效益最好的豪华汽车品牌，2002年，公司成功销售了超过100万部BMW和MINI品牌的汽车，销售纪录首次突破一百万辆；在摩托车业务上，销量超过9.2万辆，再创销售新高。在全球，BMW集团的员工总数超过10万人。</p>

				   </div>
			      </div>
			     </div>
			     </div>
			<!--
            	作者：ci2713@163.com
            	时间：2015-12-30
            	描述：商品显示
            -->
            <div style="width:100%;height:150px;clear:both;background-color:#888888;">
<table  width="100%">
  <tr>
    <td width="10%">版权声明</td>
    <td width="10%">法律声明 </td> 
    <td width="10%">奥迪全球 </td>  
    <td width="10%">奔驰全球 </td>   
    <td  width="45%">订阅公司新闻专递</td> 
  </tr>
</table>
<br>
公司公网备号：221036552322号
<hr width="90%" align="center">
©2018&nbsp; 中国杜氏汽车4S店&nbsp; 版权所有
</div>
	</body>
</html>
