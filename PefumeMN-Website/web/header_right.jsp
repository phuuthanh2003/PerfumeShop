<%-- 
    Document   : refine
    Created on : Dec 20, 2023, 7:55:37 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Perfume | E-Commerce</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
        <link rel="stylesheet" href="css/style.css">
        <style>
            li a:hover {
                color: #f6692a;
            }
            ul li a.active {
                color: #f6692a;
            }

            .li_header {
                color: white;
                margin-left: 50px;
                font-size: 18px;
            }

            .submit-price {
                font-size: 16px;
                background-color: black;
                color: white;
                font-weight: 600;
                padding: 5px 40px;
                border-radius: 20px;
                margin: 10px 0 20px
            }

            .submit-price:hover {
                background-color: rgba(0,0,0,0.3);
                color: black;
                font-weight: 600;
            }
        </style>
    </head>
    <body>
        <div class="header_top_right">
            <div class="header_right_info">
                <ul>
                    <li class="user">
                        <c:if test="${sessionScope.account == null}">
                            <a href="login" title="Icon User">
                                <i class="fa fa-user-circle"></i>
                            </a>
                        </c:if>
                        <c:if test="${sessionScope.account != null && sessionScope.account.roleID!=1}">
                            <a href="profile" title="Icon User">
                                <i class="fa fa-user-circle"></i>
                            </a>
                        </c:if>
                    </li>
                    <li class="header_wishlist">
                        <a href="#">
                            <i class="fa fa-heart-o"></i>
                            <c:if test="${sessionScope.wishList != null && sessionScope.wishListSize != 0}" >
                                <span class="item_count">
                                    ${sessionScope.wishListSize}
                                </span>
                            </c:if>
                        </a>
                    </li>
                    <c:if test="${sessionScope.account.roleID==1}">
                        <li class="header_wishlist">
                            <a href="admin">
                                <i class="fa-solid fa-chalkboard-user"></i>
                            </a>
                        </li>
                    </c:if>
                    <li class="mini_cart_wrapper">
                        <a href="javascript:void(0)">
                            <i class="fa fa-shopping-cart"></i>
                            <c:if test="${sessionScope.cart != null && sessionScope.cartSize != 0}" >
                                <span class="item_count">
                                    ${sessionScope.cartSize}
                                </span>
                            </c:if>
                        </a>

                        <div class="mini_cart mini_cart2">
                            <c:set var="subTotal" value="0"/>
                            <c:set var="subPrice" value="0"/>
                            <div class="cart_gallery" style="max-height: 250px; overflow-y: auto;">
                                <c:if test="${sessionScope.cart != null && sessionScope.cartSize != 0}">
                                    <c:forEach items="${sessionScope.listItemsInCart}" var="p">
                                        <div class="cart_item">
                                            <div class="cart_img">
                                                <a href="#"><img src="${p.product.image1}"
                                                                 alt="Perfume"></a>
                                            </div>
                                            <div class="cart_info">
                                                <a href="#">${p.product.name}</a>
                                                <p><span>Rs.${p.price}</span> X ${p.quantity}</p>
                                            </div>
                                            <div class="cart_remove">
                                                <a href="cart?rid=${p.product.id}"><i class="fa fa-times"></i></a>
                                            </div>
                                        </div>
                                        <c:set var="subTotal" value="${subTotal + (p.product.price*p.quantity)}"/>
                                        <c:set var="subPrice" value="${subPrice + (p.price * p.quantity)}"/>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${sessionScope.cart == null || sessionScope.cartSize == 0}">
                                    <span class="header__cart-list--no-cart-msg">Nothing now!</span>
                                    <img src="images/emptycart.png" alt="Emptycart" style=" width: 60%;">
                                </c:if>
                            </div>
                            <div class="mini_cart_table">
                                <div class="cart_table_border">
                                    <div class="cart_total">
                                        <span>Sub Total :</span>
                                        <span class="price" style="color:grey">Rs. ${subTotal}</span>
                                    </div>

                                    <div class="cart_total mt-10">
                                        <span>Total :</span>
                                        <span class="price">Rs. ${subPrice}</span>
                                    </div>

                                </div>
                            </div>
                            <div class="mini_cart_footer">
                                <div class="cart_button">
                                    <a href="${sessionScope.account == null ? 'login' : 'viewcart'}">View Cart</a>
                                </div>
                            </div>
                        </div>

                    </li>
                </ul>
            </div>
            <div class="header_account">
                <ul>
                    <li class="top_links">
                        <a href="#">
                            <i class="fa fa-cog"></i>
                        </a>
                        <ul class="dropdown_links">
                            <li><a href="#">Checkout</a></li>
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">Shopping cart</a></li>
                            <li><a href="#">Wishlist</a></li>
                        </ul>
                    </li>
                    <c:if test="${sessionScope.account!=null}">
                        <li>
<<<<<<< HEAD
                            <a href="${sessionScope.account.roleID==1?"admin":"profile"}" style="color: white">Hello, ${sessionScope.account==null ? "": sessionScope.name}!</a>
                            <a href="${sessionScope.account.roleID==1?"admin":"profile"}">
                                <img src="${sessionScope.account.image}" width="40px" style="color: white; border-radius: 50%">
                            </a>
=======
                            <!--<a href="${sessionScope.account.roleID==1?"admin":"profile"}" style="color: white">Hello, ${sessionScope.account==null ? "": sessionScope.name}!</a>-->
                            <a href="${sessionScope.account.roleID==1?"admin":"profile"}"><img src="${sessionScope.account.image}" width="40px" style="color: white; border-radius: 50% ;border: 2px solid white;"></a>
>>>>>>> 304f764d35e5d9ca275be7b5ca0fd111bb95f8bb
                        </li>
                        <li>
                            <a id="logout" href="#" onclick="checkLogout()" style="color: white; text-decoration: underline; font-style: bold;
                               text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);">${sessionScope.account==null ? "": "LOGOUT"}</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>   
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
        <script src="js/countdown.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
        <script src="js/clickevents.js"></script>
    </body>
</html>
