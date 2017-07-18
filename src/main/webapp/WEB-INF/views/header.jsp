<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">kasturi's collection</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Categories<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">lehenga choli </a></li>
            <li><a href="#">Sadi</a></li>
             <li><a href="#">Panjabi dress</a></li>
             <li><a href="#">One piece</a></li>
                 <li><a href="#">Tops</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Your orders <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Your Orders </a></li>
            <li><a href="#">Your wish list</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Manage list <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="Product">Manage Product</a></li>
            <li><a href="catagory">Manage Catagory</a></li>
            <li><a href="supplier">Manage Supplier</a></li>
          </ul>
        </li>
 <li><a href="#">About us</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
         <li><a href="<c:url value= '/Register'/> "><span class="glyphicon glyphicon-pencil"></span>Register</a></li> 
      <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
</body>
</html>