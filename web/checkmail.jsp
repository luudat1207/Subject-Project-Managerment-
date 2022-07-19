<%-- 
    Document   : checkmail
    Created on : May 20, 2022, 5:38:50 PM
    Author     : Luu Dat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>G6</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css">
    </head>
    <body>
        <div class="container">
            <h1 style="text-align: center">
                <a  class="btn btn-secondary" href="dashboard" role="button">Back To Home</a>
            </h1>
        <div class="row">
          <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card border-0 shadow rounded-3 my-5">
              <div class="card-body p-4 p-sm-5">
                <h5 class="card-title text-center mb-5 fw-light fs-5">User registration</h5>
                <div class="form-floating mb-3">
                    
                    
                   <form action="checkmail" method="POST"> 
                  <div class="form-floating mb-3">
                    <input type="text" name="mail" class="form-control" id="floatingInput" placeholder="Username" required>
                    <label for="floatingInput">Your Email</label>
                  </div>
                  
                  <div class="d-grid" style="margin-top: 10px;">
                        <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">Done</button>
                  </div>
                  </form>
                    
                  </div>
                 </div>
            </div>
          </div>
        </div>
      </div>
    </body>
</html>
