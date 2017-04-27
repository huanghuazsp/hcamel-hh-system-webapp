<%@page import="com.hh.system.util.request.Request"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hh.usersystem.bean.usersystem.UsOrganization"%>
<%@page import="com.hh.system.util.Check"%>
<%@page import="com.hh.system.util.SysParam"%>
<%@page import="com.hh.system.util.SystemUtil"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=SysParam.sysParam.getSysName()%></title>
<script type="text/javascript">
	<%
	String userAgent = request.getHeader("User-Agent");
	if(Request.checkClientType(userAgent)){%>
	  location.href   = "mobilelogin.jsp";
	<%}else{%>
	  location.href   = "weblogin.jsp";
	<%}%>
	

</script>
</head>
<body>
</body>
</html>