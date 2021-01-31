<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
        <meta charset="ISO-8859-1">
        <title>Register</title>
    </head>

    <body>
    	<div>
          <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  			<div class="container-fluid">
			    <a class="navbar-brand" href="/index">TuNe WOrLd</a>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			      <div class="navbar-nav">
			        <a class="nav-link active" aria-current="page" href="/index">Home</a>
			        <a class="nav-link" href="#">About</a>
			        <a class="nav-link" href="/login">Login</a>
					<a class="nav-link" href="/register">Register</a>
			      </div>
			    </div>
			  </div>
			</nav>
            </div>
        <div class="container">
         

            <div class="form-control">
                <h1 class="card text-center card-header">
                    <em>Sign Up</em>
                </h1>
                
                <div class="card-body">    
                    <form class="form-control" method="post">

                        <div class="mb-4">
                            <label class="form-label">Username</label>
                            <input class="form-control" type="text" name="name" required="required">
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Password</label> 
                            <input class="form-control" type="password" name="password" required="required">
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Confirm Password</label> 
                            <input class="form-control" type="password" name="confirmation" required="required">
                        </div>
                        <h5>Billing Address</h5>
                        <div class="mb-4">
                            <label class="form-label">Address 1</label> 
                            <input class="form-control" type="text" name="billingStreetAddress1" required="required">
                        </div>
                        <div class="mb-4">
                            <label class="form-label">Address 2</label> 
                            <input class="form-control" type="text" name="billingStreetAddress2" required="required">
                        </div>
                        <div class="mb-4">
                            <label class="form-label">City</label> 
                            <input class="form-control" type="text" name="billingCity" required="required">
                        </div>
                        <div class="mb-4">
                            <label class="form-label">State</label> 
                            <input class="form-control" type="text" name="billingState" required="required">
                        </div>
                        <div class="mb-4">
                            <label class="form-label">Zip code</label> 
                            <input class="form-control" type="text" name="billingZipcode" required="required">
                        </div>
                        <h5>Shipping Address</h5>
                        <div class="mb-4">
                            <label class="form-label">Address 1</label> 
                            <input class="form-control" type="text" name="shippingStreetAddress1" required="required">
                        </div>
                        <div class="mb-4">
                            <label class="form-label">Address 2</label> 
                            <input class="form-control" type="text" name="shippingStreetAddress2" required="required">
                        </div>
                        <div class="mb-4">
                            <label class="form-label">City</label> 
                            <input class="form-control" type="text" name="shippingCity" required="required">
                        </div>
                        <div class="mb-4">
                            <label class="form-label">State</label> 
                            <input class="form-control" type="text" name="shippingState" required="required">
                        </div>
                        <div class="mb-4">
                            <label class="form-label">Zip code</label> 
                            <input class="form-control" type="text" name="shippingZipcode" required="required">
                        </div>                       

                        <input class="btn-primary" type="submit" value="Register">
                        
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