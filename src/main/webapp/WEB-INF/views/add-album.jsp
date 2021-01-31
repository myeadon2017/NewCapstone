
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@page import="com.hcl.model.User"%>
    <!DOCTYPE html>
    <html>

    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
        <meta charset="ISO-8859-1">
        <title>Add Album</title>
    </head>
    <%
	User user = (User) session.getAttribute("user");
	if (user == null) {
		response.sendRedirect("/login");
	}
	%>

    <body>
    	<div>
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
            </div>
        <div class="container">
         

            <div class="form-control">
                <h1 class="card text-center card-header">
                    <em>Welcome to the Add Product</em>
                </h1>
                
                <div class="card-body">    
                    <form class="form-control" method="post">

                        <div class="mb-4">
                            <label class="form-label">Cover</label>
                            <input class="form-control" type="text" name="cover" required="required">
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Title</label> 
                            <input class="form-control" type="text" name="title" required="required">
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Artist</label> 
                            <input class="form-control" type="text" name="artist" required="required">
                        </div>
                         <div class="mb-4">
                            <label class="form-label">Genre</label> 
                            <input class="form-control" type="text" name="genre" required="required">
                        </div>
                        <div class="mb-4">
                            <label class="form-label">Price</label> 
                            <input class="form-control" step=".01" type="number" name="price" required="required">
                        </div>
                        <div class="mb-4">
                            <label class="form-label">Inventory</label> 
                            <input class="form-control" type="number" name="inventory" required="required">
                        </div>

                        <input class="btn-primary" type="submit" value="addalbum">
                        
                    </form>
                </div>
            </div>

            <div style="height: 25px"></div>
            <div class="form-text">
                <h3>${message}</h3>
            </div>
        </div>
        <footer>
    <p class="pull-right"><a href="#">Back to top</a></p>

    <p>&copy; 2021 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
</footer>
    </body>
    </html>
