<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2018/5/16
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>你好，我是首页</h1>

<% String username = request.getAttribute("username") + "";%>
欢迎你：
<%=username%>
</body>
</html>
