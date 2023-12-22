<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Store</title>
        <link rel="icon"
              href="images/EbookStore-Logo-footer.png"
            type="image/x-icon" />
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!--        <link rel="preconnect" href="https://fonts.gstatic.com" />
                <link
                    href="https://fonts.googleapis.com/css2?
                    family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;1,100;1,200;1,300;1,400;1,500;1,600&display=swap"
                    rel="stylesheet"
                    />-->
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="first-cont ">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6">
                            <h4>
                                Một cuốn sách hay cho ta một điều tốt,  <br />
                                một người bạn tốt cho ta một điều hay!
                            </h4>
                            <a href="home" class="h-btn">Khám phá ngay &#x27F6;</a>
                        </div>
                        <div class="col-sm-6">
                            <img src="images/Book.png" alt="Header Pic" />
                        </div>
                    </div>
                </div>
            </div>


<div class="container">
    <div class ="row">
        <jsp:include page="Left.jsp"></jsp:include>
        <div class="col-sm-9">
            <div class="row">

                <c:forEach items="${listP}" var="o">
                    <div class="col-12 col-md-6 col-lg-3">
                        <a class="card-cont" href="detail?pid=${o.id}" title="View Book">
                            <div class="card card-item">
                                <div class="book_img" style="background-image: url(${o.img})">
                                    
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title show_txt">${o.name}</h5>
                                    <p class="card-text show_txt">Số lượng: ${o.quantity}</p>
                                    <p class="card-text show_txt">Giá: ${o.price} đ</p>
                                    <div class="row" style="padding-top: 10px">
                                        <div class="col">
                                            <a href="addtocart?pid=${o.id}" class="btn btn-success btn-block"><i class="fa fa-cart-plus"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                            
                    </div>
                </c:forEach>


            </div>
        </div>

        </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>

