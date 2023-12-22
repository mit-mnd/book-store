<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--begin of menu-->
<div class="header">
    <nav class="navbar navbar-expand-md navbar-dark">
        <div class="container">
            <!--Logo-->
            <div class="navbar-brand logo">
                <a href="home">
                    <img src="images/EbookStore-Logo.png" alt="BookStore-Logo"/>
                </a>
            </div>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>


            <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">


                <!--Search and cart-->
                <form action="search" method="post" class="form-inline my-2 my-lg-0 m-auto">
                    <div class="input-group input-group-sm">
                        <input value="${txtS}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Tìm kiếm sách">
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-success btn-number">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </div>
                        <!--href="show"-->
                    <a class="btn btn-success btn-sm ml-3" href="Cart.jsp">
                        <i class="fa fa-shopping-cart"></i> Cart
                        <span class="badge badge-light">${sessionScope.cart == null ? null : sessionScope.size}</span>
                    </a>
                </form>

                <!--Navbar menu-->
                <ul class="navbar-nav ">

                    <c:if test="${sessionScope.acc != null}">
                        <c:if test="${sessionScope.acc.isAdmin == 1}">
                            <li class="nav-item">
                                <a class="nav-link" href="managerbook"><i class="fa fa-bars-progress"></i> Manager Book</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="allorder"><i class="fa fa-eye"></i> View Orders</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc.isAdmin == 0}">
                            <li class="nav-item">
                                <a class="nav-link" href="yourorder"><i class="fa fa-eye"></i> Your Orders</a>
                            </li>
                        </c:if>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fa fa-user"></i> ${sessionScope.acc.user}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logout"><i class="fa fa-right-from-bracket"></i> Logout</a>
                        </li>
                    </c:if>

                    <c:if test="${sessionScope.acc == null}">
                        <li class="nav-item">
                            <a class="nav-link" href="Login.jsp"><i class="fa fa-arrow-right-to-bracket"></i> Login</a>
                        </li>
                    </c:if>

                </ul>
            </div>
        </div>
    </nav>


</div>

<!--end of menu-->
