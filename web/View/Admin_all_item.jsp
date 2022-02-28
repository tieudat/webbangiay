<%-- 
    Document   : Admin_all_item
    Created on : Dec 28, 2020, 3:21:32 PM
    Author     : admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.shoes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="css/Admin_all_item.css">
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
                        <p class="right__desc">Xem sản phẩm</p>
                        <div class="right__table">
                            <div class="right__tableWrapper">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Hình ảnh</th>
                                            <th>Giá SP</th>
                                            <th>Loại</th>
                                            <th>Sửa</th>
                                            <th>Xoá</th>
                                        </tr>
                                    </thead>
                            
                                    <tbody>
                                        <%
                                        ArrayList<shoes> li= new ArrayList<shoes>(); 
                                        li =(ArrayList<shoes>) session.getAttribute("listShoesAdmin");
                                        for(shoes i:li){
                                        %>
                                        <tr>
                                            <td data-label="STT"><%=i.getIdShoes()%></td>
                                            <td data-label="Tên sản phẩm"><%=i.getNameShoes()%></td>
                                            <td data-label="Hình ảnh"><img src="<%=i.getLinkImg()%>" alt=""></td>
                                            <td data-label="Giá SP"><%=i.getGiaTien()%></td>
                                            <td data-label="Loại"><%=i.getLoai()%></td>
                                            <td class="right__iconTable">
                                                <form action="show_admin_edit_item" method="get">
                                                    <input id="id_edit" name="ide" type="hidden" value="<%=i.getIdShoes()%>">
                                                    <input type="submit" value="Sửa">
                                                </form>
                                            </td>
                                            <td class="right__iconTable">
                                                <form action="Delete_Item" method="get">
                                                    <input id="id_del" name="idd" type="hidden" value="<%=i.getIdShoes()%>">
                                                    <input type="submit" value="Xóa">
                                                </form>
                                            </td>
                                            
                                        </tr>
                                      <% } %>
                                    </tbody>
                                </table>
                            </div>
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