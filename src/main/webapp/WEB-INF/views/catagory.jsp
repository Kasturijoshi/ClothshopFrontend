<%@ page isELIgnored="false" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CRUD OPERATIONS</title>
</head>
<body>
<div>
${msg}
</div>
<c:if test="${isEditing}" >
<c:url var="formaction"  value="/update"/>
</c:if>
<c:if test="${not isEditing}" >
<c:url var="formaction"  value="/save"/>
</c:if>
<form:form method = "POST" modelAttribute="catagory" action = "${formaction}">
         <table>
<tr>
               <td><form:label path = "catid">catid:</form:label></td>
               <td><form:input path = "catid" /></td>
            </tr>
<tr>
               <td><form:label path = "catname">Name:</form:label></td>
               <td><form:input path = "catname" /></td>
            </tr>
<tr>
               <td><form:label path = "catdesc">Description</form:label></td>
               <td><form:input path = "catdesc" /></td>
            </tr>
<tr>
               <td colspan = "2">
               <c:if test="${isEditing}" >
                  <input type = "submit" value = "Update"/>
                  </c:if>
                     <c:if test="${not isEditing}" >
                  <input type = "submit" value = "Save"/>
                  </c:if>
               </td>
            </tr>
</table>
</form:form>
      <table>
<tr>
      <th>ID</th>
      <th>Name</th>
      <th>catdesc</th>
      </tr>
<c:forEach var="prd" items="${CatagoryList}" >
<tr>
      <td>${prd.catid}</td>
      <td>${prd.catname}</td>
      <td>${prd.description}</td>
      <td><a href="update/${prd.catid}">Update</a></td>
      <td><a href="delete/${prd.catid}">Delete</a></td>
      </tr>
</c:forEach>
      </table>
</body>
</html>