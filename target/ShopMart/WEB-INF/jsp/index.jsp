<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<html>
<head>
    <title>test1</title>
</head>
<body>
<h2>Hello World!lalalal</h2>

<form:form method="post" modelAttribute="user" action="${basePath}/toJson">
    用户名:<form:input path="username"/>
    密码:<form:password path="password"/>
    <input type="submit" value="提交">
</form:form>
</body>
</html>