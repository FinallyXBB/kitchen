<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="bb" prefix="bb" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="../backcss/comboList.css">
<link rel="stylesheet" href="../backcss/jquery-ui.css" />
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/backjs/table.js"></script>
<title>后台套餐列表</title>
</head>
<body>
<div style="float: right;">
	<form id="queryForm" action="/kitchen/backCombo/comboQuery.ms">
		<label>请选择分类：</label>
		<select name="categoryid">
		<option value="">全部</option>
		<c:forEach items="${categoryPageData.pageData }" var="item">
		<c:choose>		
		<c:when test="${categoryid eq item.categoryid}">
			<option value="${item.categoryid }" selected="selected">${item.categoryname }</option>
		</c:when>
		<c:otherwise>
			<option value="${item.categoryid }">${item.categoryname }</option>
		</c:otherwise>
		</c:choose>
		</c:forEach>		
		</select>
		<input type="submit" value="查看">
	</form>
</div>
<div id="main">
	<div id="combolist">
		<c:forEach items="${pageData.pageData }" var="item">
			<div class="comboxx">
				<img style="cursor: pointer;" src="${item.comboimage }" data-val="/kitchen/backCombo/beforeUpdateCombo.ms?comboid=${item.comboid}" onclick="modify(this,400,400)"/>
				<div class="xxxx">
					<label>套餐：${item.comboname }</label><br/>
					<label>价格：${item.comboprice }</label><br/>
					<label>
					<c:choose >
						<c:when test="${fn:length(item.combodescription) > 6}">制作：${fn:substring(item.combodescription,0,6)}...</c:when>
						<c:otherwise>制作：${item.combodescription }</c:otherwise>
					</c:choose>
					</label><br/>
					<label>总量：${item.combonum }</label><br/>
					<label>剩余：${item.comborenum }</label>
					<input type="button" value="修改" class="btn" data-val="/kitchen/backCombo/beforeUpdateCombo.ms?comboid=${item.comboid}" onclick="modify(this,400,400)">
				</div>
			</div>
		</c:forEach>
	</div>
	<bb:page ordercolumn="${pageData.ordercolumn }" url="/kitchen/backCombo/comboQuery.ms" 
	totalPageNum="${pageData.totalPageNum }" pagesize="${pageData.pagesize }" 
	categoryid="${pageData.categoryid }" currentPage="${pageData.currentPage }" 
	ordermethod="${pageData.ordermethod }" />
</div>
<div id="dialog-form" title="信息修改">
 	<script type="text/javascript">
	var ie = navigator.appVersion.indexOf('MSIE') != -1;
	if(ie)
	{
		document.write('<iframe name="DialogFrame" frameborder="0" scrolling="yes" id="DialogFrame" width="100%" height="100%"></iframe>');
	}
	else
	{
		document.write('<iframe name="DialogFrame" frameborder="0" scrolling="auto" id="DialogFrame" width="100%" height="100%"></iframe>');
	}
	</script>
</div>
</body>
</html>