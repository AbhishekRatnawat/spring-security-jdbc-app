<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Hello world</h1>
Welcome page

<br>
<hr>
<p>
User: <security:authentication property="principal.username"/>
<br>
Role(s): <security:authentication property="principal.authorities"/>
</p>

<hr>
<!--  Add a link to /leaders, for managers -->
<security:authorize access="hasRole ('MANAGER')">
<p>
<a href="${pageContext.request.contextPath}/leaders">Leadership meeting</a>
	(only for managers)

</p>
</security:authorize>
<hr>

<!--  Add a link to /systems, for admins -->
<security:authorize access="hasRole ('ADMIN')">
<p>
<a href="${pageContext.request.contextPath}/systems">Admin meeting</a>
	(only for admins)

</p>
</security:authorize>
<hr>
<!-- add logout button -->

<form:form action="${pageContext.request.contextPath}/logout" method="POST">

<input type="submit" value="logout"/>

</form:form>

</body>
</html>