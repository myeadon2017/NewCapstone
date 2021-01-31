<%@page import="com.hcl.model.Album"%>
<%@page import="com.hcl.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
<title>Edit Task</title>
</head>
<body>
	<%
	User user = (User) session.getAttribute("user");
	if (user == null) {
		response.sendRedirect("/login");		
	}
		Album a = (Album) request.getAttribute("album");
	%>
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
	<div class="container">
        <div style="height: 25px;"></div>
		<div class="form-control">
            <h1>Edit Album Form</h1>
            <div style="height: 25px;"></div>
            
            <div class="form-control">
                <form class="form-control" method="post" action="/editalbum/${album.getId()}">
                    <div class="card-body">
                        
                        <div class="clearfix"> 
                            <div class="clearfix" >
                                <button style="margin-left:10px;" class="btn btn-warning btn-lg float-end">Cancel</button>
                                <input class="btn btn-primary btn-lg float-end" type="submit" value="Save">
                            </div>
                        </div>
                        <div class="mb-4">
                            <label class="form-label">Cover</label> 
                            <input class="form-control" type="text" name="cover" value="${album.getCover()}" required="required" > 
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Title</label> 
                            <input class="form-control" type="text" name="title" value="${album.getTitle()}" required="required"> 
                        </div>
                        <div class="mb-4">
                            <label class="form-label">Artist</label> 
                            <input class="form-control" type="text" name="artist" value="${album.getArtist()}" required="required"> 
                        </div>
                        <div class="mb-4">
                            <label class="form-label">Genre</label> 
                            <input class="form-control" type="text" name="genre" value="${album.getGenre()}" required="required"> 
                        </div>
                        <div class="mb-4">
                            <label class="form-label">Price</label> 
                            <input class="form-control" type="number" step="0.1" name="price" value="${album.getPrice()}" required="required"> 
                        </div>
                        <div class="mb-4">
                            <label class="form-label">Inventory</label> 
                            <input class="form-control" type="number" name="inventory" value="${album.getInventory()}" required="required"> 
                        </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
        <footer>
    <p class="pull-right"><a href="#">Back to top</a></p>

    <p>&copy; 2021 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
</footer>
</body>
</html>