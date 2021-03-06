<%@ page isELIgnored="false" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/css/Stylesheet1.css">
<script type="text/javascript" src="resources/js/Script1.js"></script> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<title>CRUD OPERATIONS</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<c:if test="${isEditing}" >
<c:url var="formaction"  value="/updatesup"/>
</c:if>
<c:if test="${not isEditing}" >
<c:url var="formaction"  value="/savesup"/>
</c:if>
<form:form method = "POST" modelAttribute="Supplier" action = "${formaction}">
         <table class= "table">

<tr>
    <form:input type= "hidden" path="supid" />         
              <td><form:label path = "supname">Name:</form:label></td>
               <td><form:input cssClass="form-control" path = "supname" /></td>
                <td>
               <form:errors cssClass="form-control" path="supname"/>
               </td>
            </tr>
<tr>
               <td><form:label path = "supadd">Address</form:label></td>
               <td><form:input cssClass="form-control" path = "supadd" /></td> <td>
               <form:errors cssClass="form-control" path="supadd"/>
               </td>
            </tr>
<tr>
               <td colspan = "2">
               <c:if test="${isEditing}" >
                  <input type = "submit" value = "Updatesup"/>
                  </c:if>
                     <c:if test="${not isEditing}" >
                  <input type = "submit" value = "Save supplier"/>
                  </c:if>
               </td>
            </tr>
</table>
</form:form>
     <div>
      <table border="1" class="table">
<tr>
      <th>ID</th>
      <th>Name</th>
      <th>Address</th>
      </tr>
<c:forEach var="sup" items="${SupplierList}" >
<tr>
      <td>${sup.supid}</td>
      <td>${sup.supname}</td>
      <td>${sup.supadd}</td>
      <td><a href="<c:url value= 'updatesup/${sup.supid}'/> ">Update</a></td>
      <td><a href="<c:url value= 'deletesup/${sup.supid}'/> ">Delete</a></td>
      </tr>
</c:forEach>
      </table>
      </div>
</body>
</html>