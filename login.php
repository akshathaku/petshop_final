<?php
session_start();
if(isset($_SESSION['customer_id']))
{
    header('Location:./customer/home.php');
}
include './includes/connection.php';
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Pet Shop</title>

    <!-- Icons font CSS-->
    <link href="./login/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="./login/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="./login/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="./login/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="./login/css/main.css" rel="stylesheet" media="all">

    <!-- sweetalert -->
    <script src="./js/sweetalert/jquery-3.4.1.min.js"></script>
    <script src="./js/sweetalert/sweetalert2.all.min.js"></script>
</head>

<body>
    <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title text-center">Login</h2>
                    <form method="POST" onsubmit="return validateForm()">
                        <div class="input-group">
                            <label class="label">Username</label>
                            <input class="input--style-4" type="text" onclick="clearusernamevalidation()" name="username" id="username">
                            <span id="validateusername" style="color: red"></span>
                        </div>
                        <div class="input-group">
                            <label class="label">Password</label>
                            <input class="input--style-4" type="password" onclick="clearpasswordvalidation()" name="password" id="password">
                            <span id="validatepassword" style="color: red"></span>
                        </div>
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue" name="submit" type="submit">Submit</button>
                            <p>Doesn't have an account?<a href="./registration.php"> Register here</a></p>
                        </div>
                    </form>
                    <?php
                        if(isset($_POST['submit']))
                        {
                            $username=mysqli_real_escape_string($con,$_POST['username']);
                            $password=mysqli_real_escape_string($con,$_POST['password']);

                            $sql="SELECT * FROM customer WHERE customer_username='$username' AND customer_password='$password'";
                            $query=mysqli_query($con,$sql) or die(mysqli_error($con));
                            if(mysqli_num_rows($query))
                            {
                                $fetch=mysqli_fetch_array($query);
                                $_SESSION['customer_id']=$fetch['customer_id'];
                                $_SESSION['customer_email']=$fetch['customer_email'];
                                ?>
                                    <script>
                                        Swal.fire(
                                        {
                                            icon: 'success',
                                            title: 'Success!',
                                            text: 'You successfully Logged in'
                                        }).then((result) => {
                                            window.location='./customer/home.php';
                                        });
                                    </script>
                                <?php
                            }
                            else
                            {
                                ?>
                                    <script>
                                        Swal.fire(
                                        {
                                            icon: 'warning',
                                            title: 'Oops!',
                                            text: 'Something went wrong!!'
                                        }).then((result) => {
                                            window.location='login.php';
                                        });
                                    </script>
                                <?php
                            }
                        }
                    ?>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="./login/vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="./login/vendor/select2/select2.min.js"></script>
    <script src="./login/vendor/datepicker/moment.min.js"></script>
    <script src="./login/vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="./login/js/global.js"></script>

    <script src="./js/validations/login.js"></script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->