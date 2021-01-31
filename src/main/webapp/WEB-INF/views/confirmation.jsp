<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="com.hcl.model.User"%>


<html>

<head>
<title>Confirmation</title>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
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
    <a class="navbar-brand" href="/<%=user.getName()%>/<%=user.getId()%>/userhome">TuNe WOrLd</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <a class="nav-link active" aria-current="page" href="/<%=user.getName()%>/<%=user.getId()%>/userhome">Home</a>
        <a class="nav-link" href="/list-albums2">All Album's</a>
        <a class="nav-link" href="#">About</a>
        <!-- <a class="nav-link" href="/login">Login</a> -->
        <a class="nav-link" href="/logout">Logout</a>
        <a class="nav-link" href="/register">Register</a>
        <a class="nav-link" href="/usercart/${user.getId()}">My Cart</a>
      </div>
    </div>
  </div>
</nav>
	<div class="container">
	<h2>Congrat's ${user.getName()}</h2>
		<h2>Your Order Has Been Confirmed!</h2>
		<h4>Order Number: 34532452</h4>
		<h4>Expect To See Your Delivery In 4-5 Business Days!</h4>
	</div>
	
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<footer>
    <p class="pull-right"><a href="#">Back to top</a></p>

    <p>&copy; 2021 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
</footer>
</body>

</html>