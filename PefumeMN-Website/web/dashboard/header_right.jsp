<%-- 
    Document   : header_right
    Created on : Dec 23, 2023, 5:17:02 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .option_avt {
                font-size: 16px;
                padding: 7px 15px;
                width: 130px;
            }

            .option_avt:hover{
                color: orange;
                background-color: rgba(0,0,0,0.1);
            }
            a:hover{
                color: orange;
            }
            .header_avt {
                animation: headerNotifyGrowth ease-in 0.2s;
                cursor: default;
                transform-origin: calc(100% - 20px) top;
                display: none;
                will-change: opacity, transform;
            }

            .header_avt::before {
                color: white;
                content: "";
                border-width: 20px 27px;
                border-style: solid;
                border-color: transparent transparent white transparent;
                position: absolute;
                top: -32px;
                right: 4px;
            }

            @keyframes headerNotifyGrowth {
                from {
                    opacity: 0;
                    transform: scale(0);
                }
                to {
                    opacity: 1;
                    transform: scale(1);
                }
            }
        </style>
    </head>
    <body>
        <div style="width: 100%;
             background-color: black;
             padding: 21px;
             margin-bottom: 20px; z-index: 1">
            <div style="">
                <ul style="color: black;
                    display: flex;
                    justify-content: flex-end;
                    align-items: center">
                    <li style="color: black;
                        margin-right: 30px" class="header_wishlist">
                        <a href="#">
                            <i style="font-size: 20px;
                               color: white" class="fa-solid fa-bell"></i>
                        </a>
                    </li>
                    <li onclick="change()" style="position: relative">
                        <img src="${sessionScope.account.image}" width="45px" style="color: white;
                             border-radius: 50%">
                        <ul id="avt" class="header_avt" style="margin-top:25px;
                            position: absolute;
                            left: -96px ;
                            background-color: white;
                            color: black;
                            padding: 10px;
                            max-width: 160px;
                            z-index: 1;
                            border-radius: 5px;
                            box-shadow: 0 1px 3.125rem 0 rgba(0, 0, 0, 0.2);">
                            <li class="option_avt"><a href="#">Checkout</a>
                            <li class="option_avt"><a href="#">My Account</a></li>
                            <li class="option_avt"><a id="logout" href="#" onclick="checkLogout()">${sessionScope.account==null ? "": "Logout"}</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>

        <script type="text/javascript">
            function change() {
                var a = document.getElementById("avt");
                if (a.style.display === 'none' || a.style.display === '') {
                    a.style.display = 'block';
                } else {
                    a.style.display = 'none';
                }
            }
            function checkLogout() {
                let ok = confirm('Are you sure you want to logout?');
                console.log(ok)
                if (ok) {
                    document.getElementById('logout').href = 'logout';
                }
            }

        </script>
    </body>
</html>
