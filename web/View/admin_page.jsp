<%-- 
    Document   : admin_page
    Created on : Dec 29, 2020, 7:14:30 PM
    Author     : admin
--%>

<%@page import="dao.userDAO"%>
<%@page import="dao.shoesDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="css/admin_page.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <div class="dashboard">
                <div class="left">
                    <span class="left__icon">
                        <span></span>
                        <span></span>
                        <span></span>
                    </span>
                    <div class="left__content">
                        <div class="left__logo">LOGO</div>
                        <div class="left__profile">
                            <div class="left__image"><a href="#"><form action="show_Index" method="get"></form><img src="assets/logo.png" alt=""></a></div>
                            <p class="left__name">Sea Shoes</p>
                        </div>
                        <ul class="left__menu">
                            <li class="left__menuItem">
                                <a href="#" class="left__title"><form action="show_admin_page" method="get"></form><img src="assets/icon-dashboard.svg" alt="">Dashboard</a>
                            </li>
                            <li class="left__menuItem">
                                <div class="left__title"><img src="assets/icon-tag.svg" alt="">Sản Phẩm<img class="left__iconDown" src="assets/arrow-down.svg" alt=""></div>
                                <div class="left__text">
                                    <a class="left__link" href="#"><form action="show_add_item_admin" method="get">Thêm Sản Phẩm</form></a>
                                    <a class="left__link" href="#"><form action="show_all_item_admin" method="get">Danh Sách SP</form></a>
                                </div>
                            </li>
                            
                            
                            <li class="left__menuItem">
                                <a href="#" class="left__title"><form action="show_listCustomer" method="get"></form><img src="assets/icon-users.svg" alt="">Khách Hàng</a>
                            </li>
                            <li class="left__menuItem">
                                <a href="view_orders.html" class="left__title"><img src="assets/icon-book.svg" alt="">Đơn Đặt Hàng</a>
                            </li>
                            <li class="left__menuItem">
                                <div class="left__title"><img src="assets/icon-user.svg" alt="">Admin<img class="left__iconDown" src="assets/arrow-down.svg" alt=""></div>
                                <div class="left__text">
                                    <a class="left__link" href="#"><form action="show_admin_add_admin" method="get">Thêm Admin</form></a>
                                    <a class="left__link" href="#"><form action="show_user_admin" method="get">Xem Admin</form></a>
                                </div>
                            </li>
                            <li class="left__menuItem">
                                <a href="#" class="left__title"><form action="LogOut" method="post"></form><img src="assets/icon-logout.svg" alt="">Đăng Xuất</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <%
                    shoesDao s= new shoesDao();
                    userDAO ud = new userDAO();
                 %>
                <div class="right">
                    <div class="right__content">
                        <div class="right__title">Bảng điều khiển</div>
                        <p class="right__desc">Bảng điều khiển</p>
                        <div class="right__cards">
                            <a class="right__card" href="#">
                                <form action="show_all_item_admin" method="get">
                                    <div class="right__cardTitle">Sản Phẩm</div>
                                    <div class="right__cardNumber"><%=s.numberItem()%></div>
                                    <div class="right__cardDesc">Xem Chi Tiết<img src="assets/arrow-right.svg" alt=""></div>
                                </form>
                            </a>
                            <a class="right__card" href="#">
                                <form action="show_listCustomer" method="get">
                                <div class="right__cardTitle">Khách Hàng</div>
                                <div class="right__cardNumber"><%=ud.numberCustomer()%></div>
                                <div class="right__cardDesc">Xem Chi Tiết <img src="assets/arrow-right.svg" alt=""></div>
                                </form>
                            </a>
                          
                            <a class="right__card" href="view_orders.html">
                                <div class="right__cardTitle">Đơn Hàng</div>
                                <div class="right__cardNumber">72</div>
                                <div class="right__cardDesc">Xem Chi Tiết <img src="assets/arrow-right.svg" alt=""></div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script type="text/javascript">
                const taga = document.getElementsByTagName("a");
		for(var i=0;i<taga.length;i++)
		{
			taga.item(i).addEventListener("click", function()
			{
				submitt(this);
					
			});
		}
                
                function submitt(z)
                {
                    z.children[0].submit();                    
                }
</script>
    <script src="js/main.js"></script>
</body>
</html>
