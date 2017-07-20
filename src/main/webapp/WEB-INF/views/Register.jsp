<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Register here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<div>
${msg}
</div>

<form:form method = "POST" modelAttribute="Customer" action = "savecus">
         <table>

            <tr>
            <form:input type= "hidden" path="cusid" />
               <td><form:label path = "cusname">Name:</form:label></td>
               <td><form:input  cssClass="form-control" path = "cusname" /></td>
                <td>
               <form:errors  cssClass="form-control" path="cusname"/>
               </td>
            </tr>
            <tr>
               <td><form:label path = "pswd">Password:</form:label></td>
               <td><form:input  cssClass="form-control" path = "pswd" /></td>
                <td>
               <form:errors cssClass="form-control" path="pswd"/>
               </td>
            </tr>
            <tr>
               <td><form:label path = "email">Email:</form:label></td>
               <td><form:input  cssClass="form-control" path = "email" /></td>
                <td>
               <form:errors cssClass="form-control" path="email"/>
               </td>
            </tr>
            <tr>
               <td><form:label path = "cusadd">Customer Address:</form:label></td>
               <td><form:input cssClass="form-control" path = "cusadd" /></td>
                <td>
               <form:errors cssClass="form-control" path="cusadd"/>
               </td>
            </tr>
            <tr>
               <td><form:label path = "phnno">Phone number:</form:label></td>
               <td><form:input cssClass="form-control" path = "phnno" /></td>
                <td>
               <form:errors cssClass="form-control" path="phnno"/>
               </td>
            </tr>
            <tr>
               <td><form:label path = "username">User Name:</form:label></td>
               <td><form:input cssClass="form-control" path = "username" /></td>
                <td>
               <form:errors cssClass="form-control" path="username"/>
               </td>
            </tr>
            <tr>
               <td><form:label path = "userrole">User Role:</form:label></td>
               <td><form:input cssClass="form-control" path = "userrole" /></td>
                <td>
               <form:errors cssClass="form-control" path="userrole"/>
               </td>
            </tr> 
</table>
</form:form>
      <div class="wrapper">
      <button type="submit" class="btn btn-default">Submit</button>
      </div>
</body>
</html>