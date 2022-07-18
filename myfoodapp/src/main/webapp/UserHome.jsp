 <%@page import="com.wipro.bean.PizzaBean,com.wipro.Dao.PizzaDao,com.wipro.util.DButil,java.util.*,javax.servlet.http.Cookie" %> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./resources/css/Home.css">
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"  integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <title>Welcome to Pizza Zone</title>
 

</head>

<body>
    <header class="head">
        <h1>PIZZA&nbsp;<i class="fas fa-pizza-slice" ></i>&nbsp;ZONE</h1>
        <nav class="navbar">
           <!--  <a href="PizzaStoreDetails.html"   style="text-decoration: none;">PIZZA STORE</a> -->
            <!-- <a href="#menu"   style="text-decoration: none;">ADD PIZZA TO CART</a> -->
            <a href="NewCart.jsp"  style="text-decoration: none;">CART</a>
           
            <a href="#contact"  style="text-decoration: none;">FEEDBACK</a>
        </nav>

        <div class="side-bar">
            <a href="ConfirmLogOut.html" class="confirmation"><i class="fas fa-sign-out-alt"></i></a>
        </div>

    </header>
    <div id="myModal" class="modal">

        <!-- Modal content -->
        <div class="modal-content">
            <span class="close">&times;</span>
            <div class="modal-body">
                <h5 >Are You Sure Want Quit?</h5>
            </div>
            <div class="modal-footer">
                <!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
                <!-- <button type="submit" href="AdminLogout" class="btn btn-secondary" data-bs-dismiss="modal">Yes</button> -->
                <a href="AdminLogout"  style="width: 75px;"><button>Yes</button></a>
            </div>
        </div>

    </div>


    <!----------------------------------Home Section----------------------------->
    <section class="home" id="home">
        <div class="home-content">
            <div id='login-form' class='login-page'>
                <div class="form-box">
                    <center>
                        <h3> Admin </h3>
                    </center><br>
                    <a href="AdminLogin.html">
                        <center><img src="" height=150 width=200></img>
                    </a>
                    <br><br><br>
                    <center>
                        <h3> User </h3>
                    </center><br>
                    <a href="UserLogin.html">
                        <center><img src="" height=150 width=200></img>
                    </a>
                    </center>
                    </a>
                    </center></a>
                </div>
            </div>
        </div>
    </section>
  
   <%PizzaDao pd=new PizzaDao();
    ArrayList<PizzaBean> list=pd.getAllFood();
        %>
    <!----------------------menu----------------------->
    <section class="menu" id="menu">
        <h4>Our Menu</h4>
        <div class="menu-content">
            <%
            
            PizzaBean pb;
            for(int i=0;i<list.size();i++)
            {
                pb=list.get(i);
                %> 
            <div class="in-box">

                <i class="far fa-heart"></i>
                <img src="<%= pb.getImagePath() %>" alt="">
                <br>
                <div class="in-content">
                    <div class="star">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <h2><%= pb.getFoodName() %></h2>
                        <div class="price"><%= pb.getPrice() %></div>
                        <div id="btngrp<%= pb.getFoodId()%>">
                            <button class="btn" onclick="setcart(<%= pb.getFoodId() %>)" id="somebutton">Add to Cart <i class="fas fa-plus-circle"></i></button>
                            </div>
                    </div>
                </div>
            </div>
        <%    
        }
        %> 
         
            </div>
        </div>
    </section>
   <!-- <img src="" alt="" srcset=""> -->
    <!-----------------------------services-------------------->
    <section class="service" id="service">
        <h4>Services</h4>
        <div class="service-content">
            <div class="inner-box">
                <img src="./resources/images/s-1.png" alt="">
                <h2>Free Delivery</h2>
                <p>Given the evolving COVID-19 situation, we wanted to reassure you that the safety and wellbeing of
                    customers and colleagues is always our top priority.</p>
                <button class="btn">Read More</button>
            </div>
            <div class="inner-box">
                <img src="./resources/images/s-2.jpg" alt="">
                <h2>Online Payment</h2>
                <p>The main advantages of using online payment are cost and time savings, increased sales, and reduced
                    transaction costs.</p>
                <button class="btn">Read More</button>
            </div>
            <div class="inner-box">
                <img src="./resources/images/s-3.png" alt="">
                <h2>Fresh Food</h2>
                <p>Fresh fruits and vegetables are an important part of a healthy diet. They contain essential vitamins,
                    minerals, fiber and other nutrients that are essential for good health.</p>
                <button class="btn">Read More</button>
            </div>
        </div>
    </section>

  
    <!-------------------------------------------contact Section-------------->
    <footer class="contact" id="contact">
        <div class="contact-sec">
            <div class="contact-inner">
                <div class="contact-inner-col">
                    <img src="./resources/images/logo.png" alt="img" class="image">
                </div>
                <div class="contact-inner-col">
                    <h1>FeedBack&nbsp;<i class="fas fa-paper-plane"></i></h1>
                    <p>NM Joshi Marg, next to Deepak Talkies, Lower Parel, Mumbai, Maharashtra 400013
                    </p>
                    <p>We Want To Hear From You, Write Us:</p>
                    <form action="#" id="" method="get">

                        <textarea name="" id="" placeholder="Text Area" cols="10" rows="8"></textarea>
                        <button class="btn">Submit</button>
                    </form>
                </div>
            </div>
            <!--
        <div class="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d58893.91726126665!2d72.8237066014888!3d22.695889226543283!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e5b060b242c55%3A0xc415d383e5344e08!2sNadiad%2C%20Gujarat!5e0!3m2!1sen!2sin!4v1641204268785!5m2!1sen!2sin"
                width="100%" height="250" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </div>-->
            <br>
            <div class="copyright">
                <p>All Rigthts Reserved.Copyright &copy; Pizza Zone Ltd.</p>
                <div class="social">
                    <i class="fab fa-facebook"></i>
                    <i class="fab fa-instagram"></i>
                    <i class="fab fa-pinterest"></i>
                    <i class="fab fa-google-plus"></i>
                </div>
            </div>
        </div>
    </footer>

    <!-------------------------------java script ------------->
    <script>
        let searchbtn = document.querySelector('#search');
        let searchfrm = document.querySelector('.head .search-bar');

        // searchbtn.onclick = () => {
        //     searchfrm.classList.toggle('active');
        //     menu.classList.remove('active');
        // }

        let menu = document.querySelector('.head .navbar');
        document.querySelector('#bars').onclick = () => {
            menu.classList.toggle('active');
            searchfrm.classList.remove('active');

        }
        window.onscroll = () => {
            menu.classList.remove('active');
            searchfrm.classList.remove('active');
        }
        
    </script>
    <script src="./resources/script/new.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script> -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script> -->
  
</body>

</html>