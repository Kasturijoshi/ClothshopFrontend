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
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<div>
${msg}
</div>
<c:if test="${isEditing}" >
<c:url var="formaction"  value="/updatepro"/>
</c:if>
<c:if test="${not isEditing}" >
<c:url var="formaction"  value="/savepro"/>
</c:if>
<form:form method = "POST" modelAttribute="Product" action = "${formaction}">
         <table>
<tr>
               <td><form:label path = "pid">product id:</form:label></td>
               <td><form:input path = "pid" /></td>
               <td>
               <form:errors path="pid"/>
               </td>
            </tr>
<tr>
               <td><form:label path = "pname">product name:</form:label></td>
               <td><form:input path = "pname" /></td>
               <td>
               <form:errors path="pname"/>
               </td>
            </tr>
<tr>
               <td><form:label path = "pdescriptn">Description</form:label></td>
               <td><form:input path = "pdescriptn" /></td> <td>
               <form:errors path="pdescriptn"/>
               </td>
            </tr>
            <tr>
               <td><form:label path = "price">Price</form:label></td>
               <td><form:input path = "price" /></td> <td>
               <form:errors path="price"/>
               </td>
            </tr>
<tr>
               <td><form:label path = "pqty">Product Quantity</form:label></td>
               <td><form:input path = "pqty" /></td> <td>
               <form:errors path="pqty"/>
               </td>
            </tr>
<tr>
               <td><form:label path = "catid">cat id</form:label></td>
               <td><form:input path = "catid" /></td> <td>
               <form:errors path="catid"/>
               </td>
            </tr>
<tr>
               <td><form:label path = "supid">sup id</form:label></td>
               <td><form:input path = "supid" /></td> <td>
               <form:errors path="supid"/>
               </td>
            </tr>
<tr>
               <td colspan = "2">
               <c:if test="${isEditing}" >
                  <input type = "submit" value = "Updatepro"/>
                  </c:if>
                     <c:if test="${not isEditing}" >
                  <input type = "submit" value = "Savepro"/>
                  </c:if>
               </td>
            </tr>
</table>
</form:form>
      <table>
<tr>
      <th>ID</th>
      <th>Name</th>
      <th>description</th>
       <th>price</th>
        <th>quantity</th>
         <th>catid</th>
          <th>supid</th>
      </tr>
<c:forEach var="pro" items="${ProductList}" >
<tr>
      <td>${pro.pid}</td>
      <td>${pro.pname}</td>
      <td>${pro.pdescriptn}</td>
      <td>${pro.price}</td>
      <td>${pro.pqty}</td>
      <td>${pro.catid}</td>
      <td>${pro.supid}</td>
      <td><a href="updatepro/${pro.pid}">Update</a></td>
      <td><a href="deletepro/${pro.pid}">Delete</a></td>
      </tr>
</c:forEach>
      </table>
</body>
</html>