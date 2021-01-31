<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.hcl.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
<title>Welcome To Tune World</title>
</head>
 <%
	User user = (User) session.getAttribute("user");
	if (user == null) {
		response.sendRedirect("/login");
	}
	%>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="/<%=user.getName()%>/<%=user.getId()%>/managerhome">TuNe WOrLd</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <a class="nav-link active" aria-current="page" href="/<%=user.getName()%>/<%=user.getId()%>/managerhome">Home</a>
        <a class="nav-link" href="/list-albums">Add/Edit/Delete Products</a>
        <a class="nav-link" href="/logout">Logout</a>
        
      </div>
    </div>
  </div>
</nav>
<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img height=700 width=600 src="https://images.unsplash.com/photo-1483000805330-4eaf0a0d82da?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OXx8bXVzaWN8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img height=700 width=600 src="https://images.unsplash.com/photo-1495305379050-64540d6ee95d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjN8fG11c2ljfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img height=700 width=600 src="https://images.unsplash.com/photo-1551710029-607e06bd45ff?ixid=MXwxMjA3fDB8MHxzZWFyY2h8N3x8c3R1ZGlvfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" class="d-block w-100" alt="...">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </a>
</div>
<footer>
    <p class="pull-right"><a href="#">Back to top</a></p>

    <p>&copy; 2021 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
</footer>
</body>
</html>