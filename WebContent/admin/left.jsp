<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>菜单</title>
<link href="${pageContext.request.contextPath}/css/left.css" rel="stylesheet" type="text/css"/>
<link rel="StyleSheet" href="${pageContext.request.contextPath}/css/dtree.css" type="text/css" />
</head>
<body>
<table width="100" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="12"></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td>
<div class="dtree">

	<a href="javascript: d.openAll();">展开所有</a> | <a href="javascript: d.closeAll();">关闭所有</a>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/dtree.js"></script>
	<script type="text/javascript">	
		d = new dTree('d');
		d.add('01',-1,'系统菜单树');
		d.add('0104','01','汽车管理');
		d.add('010401','0104','汽车列表','${pageContext.request.contextPath}/adminProduct?method=findAll','','mainFrame');
		d.add('010402','0104','添加商品','${pageContext.request.contextPath}/adminProduct?method=addUI','','mainFrame');		
		d.add('0105','01','订单管理');
		d.add('010501','0105','订单列表','${pageContext.request.contextPath}/adminOrder?method=findAllByState','','mainFrame');
		d.add('010502','0105','未付款订单','${pageContext.request.contextPath}/adminOrder?method=findAllByState&state=0','','mainFrame');
		d.add('010503','0105','已付款订单','${pageContext.request.contextPath}/adminOrder?method=findAllByState&state=1','','mainFrame');
		d.add('0107','01','客户管理');
		d.add('010701','0107','客户列表','${pageContext.request.contextPath}/user?method=UserAll','','mainFrame');
		d.add('0108','01','意见反馈');
		d.add('010801','0108','客户来信','${pageContext.request.contextPath}/user?method=MsgrAll','','mainFrame');
		d.add('0106','01','系统管理');
		d.add('010601','0106','备份还原','${pageContext.request.contextPath}/admin/sys.jsp','','mainFrame');
		document.write(d);
		
	</script>
</div>	</td>
  </tr>
</table>
</body>
</html>
