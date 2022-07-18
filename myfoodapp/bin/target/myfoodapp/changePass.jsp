<!doctype html>
<html lang="en">

<head>
  <title>ChangePassword</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS v5.0.2 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <style>
    .container {
      margin: auto;
      display: flex;
      align-items: center;
      justify-content: center;
      
    }
    h3{
      font-weight: 150;

    }
  </style>
</head>

<body>
  <div class="container">
    
    <form action="ChangePass" method="post" onsubmit="return validatePass2()">
      <div>
        
        <h2>Change Passowrd</h2>
        
      </div>
      <div class="mb-3  my-4">
        <label for="inputUserName" class="form-label">User Name</label>
        <input type="text" class="form-control col-md-6" name="inputUserName" id="inputUserName" placeholder="">
         <label for="inputOldPassword" class="form-label">Old Password</label>
        <input type="password" class="form-control col-md-6" name="inputOldPassword" id="inputOldPassword" placeholder="">
        
        <label for="inputPassword" class="form-label my-2">New Password</label>
        <input type="password" class="form-control col-md-6" name="inputPassword" id="inputPassword" placeholder="">

        <label for="inputPassword2" class="form-label">Confirm Password</label>
        <input type="password" class="form-control col-md-6" name="inputPassword2" id="inputPassword2" placeholder="">

        <button type="submit" class="btn btn-dark my-4 col-5">Submit</button>
      </div>
    </form>
  </div>
 

  <script src="./resources/validate.js"></script>
  <!-- Bootstrap JavaScript Libraries -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
    integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
    integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
    crossorigin="anonymous"></script>
</body>

</html>