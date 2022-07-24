<%@page import="com.wipro.bean.*,com.wipro.Dao.*,com.wipro.util.DButil,java.util.*,javax.servlet.http.Cookie" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BongoDishes</title>

    <link rel="stylesheet" href=" https://unpkg.com/swiper/swiper-bundle.min.css" />

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="./resources/css/style3.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
    
<!-- header section starts      -->

<header>

    <a href="#" class="logo"><i class="fas fa-utensils"></i>BongoDishes</a>

    <nav class="navbar">
        
        <a class="active" href="#dishes">dishes</a>
        <a href="#about">about</a>
        <a href="#review">review</a>
        <a href="ConfirmLogOut.html">Logout</a>
        
        
    </nav>

    <div class="icons">
        <i class="fas fa-bars" id="menu-bars"></i>
        <i class="fas fa-search" id="search-icon"></i>
        <a href="NewCart.jsp" class="fas fa-shopping-cart"></a>
    </div>
    <%
                
                 String userName=(String)session.getAttribute("name");
                 if(userName==null){
                    response.sendRedirect("index.jsp");
                }
    %>
</header>

<!-- header section ends-->

<!-- search form  -->

<form action="" id="search-form">
    <input type="search" placeholder="search here..." name="" id="search-box">
    <label for="search-box" class="fas fa-search"></label>
    <i class="fas fa-times" id="close"></i>
</form>

<!-- home section starts  -->


<!-- home section ends -->

<!-- dishes section starts  -->

<section class="dishes" id="dishes">

    <h3 class="sub-heading"> our dishes </h3>
    <h1 class="heading"> popular dishes </h1>

    <div class="box-container">

        <!-- <div class="box">
            <a href="#" class="fas fa-heart"></a>
            <a href="#" class="fas fa-eye"></a>
            <img src="./resources/images/FoodWeb/images/dish-1.png" alt="">
            <h3>Burger</h3>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
            </div>
            <span>&#x20b9; 160</span>
            <a href="#" class="btn">add to cart</a>
        </div>

        <div class="box">
            <a href="#" class="fas fa-heart"></a>
            <a href="#" class="fas fa-eye"></a>
            <img src="./resources/images/FoodWeb/images/dish-2.png" alt="">
            <h3>Momo</h3>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
            </div>
            <span>&#x20b9; 350</span>
            <a href="#" class="btn">add to cart</a>
        </div>

        <div class="box">
            <a href="#" class="fas fa-heart"></a>
            <a href="#" class="fas fa-eye"></a>
            <img src="./resources/images/FoodWeb/images/dish-3.png" alt="">
            <h3>Chicken Tandori</h3>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
            </div>
            <span>&#x20b9; 250</span>
            <a href="#" class="btn">add to cart</a>
        </div>

        <div class="box">
            <a href="#" class="fas fa-heart"></a>
            <a href="#" class="fas fa-eye"></a>
            <img src="./resources/images/FoodWeb/images/dish-4.png" alt="">
            <h3>Pizza</h3>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
            </div>
            <span>&#x20b9; 150</span>
            <a href="#" class="btn">add to cart</a>
        </div>

        <div class="box">
            <a href="#" class="fas fa-heart"></a>
            <a href="#" class="fas fa-eye"></a>
            <img src="./resources/images/FoodWeb/images/dish-5.png" alt="">
            <h3>Ice cream</h3>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
            </div>
            <span>&#x20b9; 210</span>
            <a href="#" class="btn">add to cart</a>
        </div>

        <div class="box">
            <a href="#" class="fas fa-heart"></a>
            <a href="#" class="fas fa-eye"></a>
            <img src="./resources/images/FoodWeb/images/dish-6.png" alt="">
            <h3>tasty food</h3>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
            </div>
            <span>&#x20b9; 200</span>
            <a href="#" class="btn">add to cart</a>
        </div> -->
        <%
        StoreDao sd=new StoreDao();
        String query=request.getParameter("q");
        ArrayList<RelStoreFoodBean> list=sd.getAllRelations(query);
        FoodBean fb=null;
            %>
        
        <%
            
        RelStoreFoodBean  rsfb;
            for(int i=0;i<list.size();i++)
            {
                rsfb=list.get(i);
                
              
                %> 
                <div class="box" id="<%= rsfb.getRelationId() %>">
                    <div class="image">
                        <img src="<%= rsfb.getPath() %>" alt="">
                        <a href="#" class="fas fa-heart"></a>
                    </div>
                    <div class="content">
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                        <h3><%= sd.getFoodName(rsfb.getFoodid()) %></h3>
                        <p>By <%= sd.getStoreName(rsfb.getStoreid()) %> </p>
                        <div id="btngrp<%= rsfb.getRelationId()%>">
                            <button class="btn" onclick="setcart(<%=  rsfb.getRelationId()%>)" id="somebutton">Add to Cart</button>
                            </div>
                        <span class="price" id="price<%= rsfb.getRelationId()%>">&#x20b9; <%= rsfb.getPrice() %></span>
                    </div>
                </div>
        <%
            }
        %>
    </div>

</section>

<!-- dishes section ends -->

<!-- about section starts  -->

<section class="about" id="about">

    <h3 class="sub-heading"> about us </h3>
    <h1 class="heading"> why choose us? </h1>

    <div class="row">

        <div class="image">
            <img src="./resources/images/FoodWeb/images/about-img.png" alt="">
        </div>

        <div class="content">
            <h3>best food in the country</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore, sequi corrupti corporis quaerat voluptatem ipsam neque labore modi autem, saepe numquam quod reprehenderit rem? Tempora aut soluta odio corporis nihil!</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam, nemo. Sit porro illo eos cumque deleniti iste alias, eum natus.</p>
            <div class="icons-container">
                <div class="icons">
                    <i class="fas fa-shipping-fast"></i>
                    <span>free delivery</span>
                </div>
                <div class="icons">
                    <i class="fas fa-dollar-sign"></i>
                    <span>easy payments</span>
                </div>
                <div class="icons">
                    <i class="fas fa-headset"></i>
                    <span>24/7 service</span>
                </div>
            </div>
            <a href="#" class="btn">learn more</a>
        </div>

    </div>

</section>

<!-- about section ends -->

<!-- menu section starts  -->

<!-- menu section ends -->

<!-- review section starts  -->

<section class="review" id="review">

    <h3 class="sub-heading"> customer's review </h3>
    <h1 class="heading"> what they say </h1>

    <div class="swiper-container review-slider">

        <div class="swiper-wrapper">

            <div class="swiper-slide slide">
                <i class="fas fa-quote-right"></i>
                <div class="user">
                    <img src="./resources/images/FoodWeb/images/arha - Copy.jpeg" alt="">
                    <div class="user-info">
                        <h3>Arha</h3>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </div>
                <p>Best website i have used ever for food delivery .</p>
            </div>

            <div class="swiper-slide slide">
                <i class="fas fa-quote-right"></i>
                <div class="user">
                    <img src="./resources/images/FoodWeb/images/su.jpg" alt="">
                    <div class="user-info">
                        <h3>Suman</h3>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </div>
                <p>It has amazing and spicy food and delivery also quickly. All the the best and try to more tasty items. I can prefer every time use this website and very very happy to say good and wonderful..</p>
            </div>

            <div class="swiper-slide slide">
                <i class="fas fa-quote-right"></i>
                <div class="user">
                    <img src="./resources/images/FoodWeb/images/shpaib.jpeg" alt="">
                    <div class="user-info">
                        <h3>Shoaib</h3>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </div>
                <p>Excellent food and service.The prices are pocket friendly also. We. Ordered for Butter Chicken , Manchurian with gravy and many more.The flavors are good and typical as well..</p>
            </div>

            <div class="swiper-slide slide">
                <i class="fas fa-quote-right"></i>
                <div class="user">
                    <img src="" alt="">
                    <div class="user-info">
                        <h3>Rahul</h3>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </div>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit fugiat consequuntur repellendus aperiam deserunt nihil, corporis fugit voluptatibus voluptate totam neque illo placeat eius quis laborum aspernatur quibusdam. Ipsum, magni.</p>
            </div>

        </div>

    </div>
    <span id="totalamount" style="visibility: none;">0</span>
</section>

<!-- review section ends -->

<!-- order section starts  -->


<!-- order section ends -->

<!-- footer section starts  -->

<section class="footer">

    <div class="box-container">

        <div class="box">
            <h3>locations</h3>
            <a href="#">Kolkata</a>
            <a href="#">Burdwan</a>
            <a href="#">Bandel</a>
            <a href="#">Kalyani</a>
            <a href="#">Mednipure</a>
        </div>

        <div class="box">
            <h3>quick links</h3>
            <a href="#dishes">dishes</a>
            <a href="#about">about</a> 
            <a href="#review">reivew</a>
            
        </div>

        <div class="box">
            <h3>contact info</h3>
            <a href="#">6296345703</a>
            <a href="#">9804117063</a>
            <a href="#">7479212309</a>
            <a href="#">7808879358</a>
            <a href="#">West Bengal, india</a>
        </div>

        <div class="box">
            <h3>follow us</h3>
            <a href="#">facebook</a>
            <a href="#">twitter</a>
            <a href="#">instagram</a>
            <a href="#">linkedin</a>
        </div>

    </div>

    <div class="credit"> copyright @ 2022 by <span>Team Dets</span> </div>

</section>

<!-- footer section ends -->

<!-- loader part  -->
<!--<div class="loader-container">
    <img src="./resources/images/FoodWeb/images/loader.gif" alt="">
</div> -->





















<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<!-- custom js file link  -->
<script src="./resources/script/script2.js"></script>

</body>
</html>