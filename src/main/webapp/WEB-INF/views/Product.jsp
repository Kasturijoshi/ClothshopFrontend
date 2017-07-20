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
<form:form method = "POST" modelAttribute="Product" action = "${formaction}" enctype="multipart/form-data">
         <table>

<tr>
			   <form:input type= "hidden" path="pid" />
               <td><form:label path = "pname">product name:</form:label></td>
               <td><form:input cssClass="form-control" path = "pname" /></td>
               <td>
               <form:errors cssClass="form-control" path="pname"/>
               </td>
            </tr>
<tr>
               <td><form:label path = "pdescriptn">Description</form:label></td>
               <td><form:input cssClass="form-control" path = "pdescriptn" /></td> <td>
               <form:errors cssClass="form-control" path="pdescriptn"/>
               </td>
            </tr>
            <tr>
               <td><form:label path = "price">Price</form:label></td>
               <td><form:input cssClass="form-control" path = "price" /></td> <td>
               <form:errors cssClass="form-control" path="price"/>
               </td>
            </tr>
<tr>
               <td><form:label path = "pqty">Product Quantity</form:label></td>
               <td><form:input cssClass="form-control" path = "pqty" /></td> <td>
               <form:errors cssClass="form-control" path="pqty"/>
               </td>
            </tr>
            <tr>
			   <td><form:label path="imgpath">Image Path:</form:label></td>
               <td><form:input type="file" cssClass="form-control" path = "file" /></td>
            </tr>
<tr>
               <td><form:label path = "catid">cat id</form:label></td>
               <td>
               <form:select path="catid">
               <c:forEach items="${catagoryList}" var="catagory">
               <for:option value="${catagory.catid}">${catagory.catname}</for:option>
               </c:forEach>
               </form:select>
               </td>
               <td><form:input cssClass="form-control" path = "catid" /></td> <td>
               <form:errors cssClass="form-control" path="catid"/>
               </td>
            </tr>
<tr>
               <td><form:label path = "supid">sup id</form:label></td>
               <td>
               <form:select path="supid">
               <c:forEach items="${supplierList}" var="supplier">
                <for:option value="${supplier.supid}">${supplier.supname}</for:option>
                </c:forEach>
               </form:select>
               </td>
               <td><form:input cssClass="form-control" path = "supid" /></td> <td>
               <form:errors cssClass="form-control" path="supid"/>
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
      <table border="1" class="table">

<tr>
      
      <th>Product Name</th>
       <th>Product Price</th>
      </tr>
<c:forEach var="pro" items="${ProductList}" >
<tr>
      <td>${pro.pname}</td>
      <td>${pro.price}</td>
      <td><a href="<c:url value= '/updatepro/${pro.pid}'/> ">Update</a></td>
      <td><a href="<c:url value= '/deletepro/${pro.pid}'/> ">Delete</a></td>
       <td><a href="<c:url value= '/disp/${pro.pid}'/> ">View</a></td>
      </tr>
</c:forEach>
      </table>
</body>
</html>