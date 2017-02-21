<%--
  Created by IntelliJ IDEA.
  User: Liang
  Date: 19/02/2017
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>


<%String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<html>
<head>
    <title>nice to meet you!</title>
</head>
<body>
<br/>
<div>
    ${result}
</div>

</body>
</html>
