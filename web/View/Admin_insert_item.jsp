<%--  
    Document   : Admin_insert_item
    Created on : Dec 28, 2020, 3:15:50 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="css/Admin_insert_item.css">
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
                <div class="right">
                    <div class="right__content">
                        <div class="right__title">Bảng điều khiển</div>
                        <p class="right__desc">Chèn danh mục</p>
                        <div class="right__formWrapper">
                            <form  action="Add_Item" method="get">
                                <div class="right__inputWrapper">
                                    <label for="title">Tên Sản Phẩm</label>
                                    <input id="txt1" type="text"  name="tensp" required>
                                </div>
                                <div class="right__inputWrapper">
                                    <label for="p_category">Loại</label>
                                    <input id="txt2" type="text" name="loaisp" required >
                                </div>
                                <div class="right__inputWrapper">
                                    <label for="image">Đường dẫn ảnh</label>
                                    <input id="txt3" type="text" name="linkImg" required>
                                </div>
                                <div class="right__inputWrapper">
                                    <label for="title">Giá sản phẩm</label>
                                    <input id="txt4"  type="text" name="gia" required>
                                </div>
                                 <div class="right__inputWrapper">
                                    <label for="title">Thương hiệu</label>
                                    <input id="txt5" type="text" name="brand" required>
                                 </div>
                                <input type="submit" value="Thêm" style="width: 30%; height: 40px; background-color: black; color: white;margin: 0 35% 0 35%">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="js/main.js"></script>
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
</body>
</html>
