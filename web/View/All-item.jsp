<%-- 
    Document   : All-item
    Created on : Nov 23, 2020, 9:10:39 AM
    Author     : admin
--%>

<%@page import="model.user"%>
<%@page import="model.shoes"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!DOCTYPE html>
<html>
<head>
	<title>All-item</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/All-item.css">
        <link rel="stylesheet" type="text/css" href="css/footer.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
        <style>
            <%@include file ="/css/All-item.css" %>
        </style>
</head>
<body>
<header class="header">
		<div class="topbar">
			<div class="container">
				<div class="row">
					<div class="row row__col-7">
						<ul>
							<li class="hidden-a">
								<a class="hidden-a--link" href="tel:tieudat1999@gmail.com">tieudat1999@gmail.com</a>
							</li>
							<li class="line_a hidden-a">/</li>
							<li class="hidden-a">
								<a class="hidden-a--link" href="tel:0355799278">0355799278</a>
							</li>
						</ul>
					</div>
                                        <%
                                            if(session.getAttribute("user")==null){
                                        %>
					<div class="row row__col-5">
						<ul>
							<li class="hidden-b">
                                                            <a class="hidden-b--link" href="#"><form action="show_SignUp" method="post">Đăng ký</form></a>
                                                                
							</li>
							<li class="line_b hidden-b">/</li>
							<li class="hidden-b">
                                                            <a class="hidden-b--link" href="#"><form action="show_Login" method="post">Đăng nhập</form></a>
							</li>
						</ul>
					</div>
                                        <%}
                                          else{
                                                user u = new user();
                                                u = (user) session.getAttribute("user");
                                          %>
                                          <div class="row row__col-5">
						<ul>
							<li class="hidden-b">
                                                            <a class="hidden-b--link" href="#"><form action="show_info_user" method="get"><%=u.getFullname()%></form></a>
                                                                
							</li>
							<li class="line_b hidden-b">/</li>
							<li class="hidden-b">
                                                            <a class="hidden-b--link" href="#"><form action="LogOut" method="post">Đăng xuất</form></a>
							</li>
						</ul>
					</div>
                                          <% } %>
				</div>
			</div>
		</div>
		<div class="botbar">
			<div class="container">
				<div class="row">
					<div class="content_header">
					<div class="row row__col-3-logo">
						<a class="logo-header" href="#">
                                                    <form action="show_Index" method="get">
							<img src="img-about/logo.png" alt="Sea Shoes">
                                                    </form>
						</a>
					</div>
					<div class="row row__col-6-menu">
						<nav class="nav-menu">
							<ul class="nav-menu nav-menu__full">
								<li class="nav-menu-item ">
									<a href="#" class="a-img"><form action="show_Index" method="get">Trang chủ </form></a>
								</li>
								<li class="nav-menu-item">
									<a href="#" class="a-img"><form action="show_About" method="get">Giới thiệu </form></a>
								</li>
								<li class="nav-menu-item active">
                                                                    <a href="#" class="a-img"><form action="show_All_Item" method="get">Sản phẩm </form></a>			
								</li>
								
								<li class="nav-menu-item">
									<a href="#" class="a-img"><form action="show_Contact" method="get">Liên hệ </form></a>
								</li>
                                                                <%
                                                                    user u = new user();
                                                                    if(session.getAttribute("user")!=null){
                                                                    u= (user) session.getAttribute("user");
                                                                    if(u.getPosition().equals("admin")){
                                                                 %>  
                                                                <li class="nav-menu-item">
									<a href="#" class="a-img"><form action="show_admin_page" method="get">Admin</form></a>
								</li>
                                                                <% } else if(u.getPosition().equals("customer"))
                                                                        {
                                                                    %>
                                                                <li class="nav-menu-item">
									<a href="#" class="a-img"><form action="show_info_user" method="get">Hồ sơ cá nhân</form></a>
								</li>
                                                                <%      }
                                                                    } %>
							</ul>
						</nav>
					</div>
					<div class="row row__col-3-search">
						<div class="cartgroup ">
							<div class="searchion inline-b">
								<span class="visible_index visible_index--hover nn"><i class="fas fa-search"></i></span>
								<div class="searchmini">
                                                                    <form action="search" method="get" class="input-group search-bar">
										<input type="text" name="nameShoes" autocomplete="off" placeholder="Tìm kiếm..." class="input-group-field auto-search visible_index">
										<button type="submit" class="visible_index btn icon-fallback-text">
											<span class="fa fa-search"></span>      
										</button>
                                                                    </form>
								</div>
							</div>
							<div class="header-right inline-block">
								<div class="top-cart-contain f-right">
									<div class="mini-cart text-xs-center">
										<div class="heading-cart cart_header">
											<a class="img_hover_cart" href="#" title="Giỏ hàng">
                                                                                            <form action="show_Cart" method="get">
												<div class="icon_hotline visible_index">
													<img src="img-about/shopping-bag-1.png" alt="Sea Shoes">
												</div>
                                                                                            </form>
											</a>
										</div>	
									</div>
								</div>
							</div>
						</div>
					</div>
					</div>
				</div>
			</div>
		</div>
	</header>
    <div class="title-about">
		<div class="content-title">
			<h2>Sản phẩm</h2>
			<div class="desition-title">
				<ul>
                                    <li><a href="#" class="content-link"><form action="show_Index" method="get">Trang chủ</form></a></li>
					<li>/</li>
                                        <li><a href="#" class="content-link"><form action="show_All_Item" method="get">Sản phẩm</form></a></li>
				</ul>
			</div>

		</div>
	</div
</div>
<div class="sidebar">
	<div class="searchTitleBar" style="margin-left: 1%">
		<div class="dropdown">
			<button class="dropbtn" type="button">Danh mục</button>
			<div class="dropdown-content">
                            <a href="#"><form action="show_GiayTheThao" method="get">Thể thao</form></a>
                            <a href="#"><form action="show_GiayChayBo" method="get">Chạy bộ</form></a>
                            <a href="#"><form action="show_GiayDaBong" method="get">Đá bóng</form></a>
			 </div>
		</div>
	</div>
	<div class="searchTitleBar">
		<div class="dropdown">
			<button class="dropbtn" type="button">Thương hiệu</button>
			<div class="dropdown-content">
                            <a href="#"><form action="show_GiayAdidas" method="get">Adidas</form></a>
			    <a href="#"><form action="show_GiayNike" method="get">Nike</form></a>
                            <a href="#"><form action="show_GiayThuongDinh" method="get">Thượng Đình</form></a>
			 </div>
		</div>
	</div>
	<div class="searchTitleBar" style="margin-right:1%">
		<div class="dropdown">
			<button class="dropbtn" type="button">Sắp xếp theo</button>
			<div class="dropdown-content">
                            <a href="#"><form action="sort_az" method="get">A-Z</form></a>
			    <a href="#"><form action="sort_GiaTangDan" method="get">Giá tăng dần</form></a>
                            <a href="#"><form action="sort_GiaGiamDan" method="get">Giá giảm dần</form></a>
			 </div>
		</div>
	</div>
</div>
<div class="Item">
    <%
        ArrayList<shoes> s = new ArrayList<shoes>();
        if(session.getAttribute("listItem")!=null)
        s = (ArrayList<shoes>) session.getAttribute("listItem");
        for(shoes i : s)
        {
    %>
	<div class="Box-item">
		<div class="img-item">
			<a href="#">
                            <form action ="show_Item" method="get">
                                <input type="hidden" name="idShoes" value="<%=i.getIdShoes()%>">
				<img src="<%=i.getLinkImg()%>">
                            </form>
			</a>
		</div>
		<div class="other-item">
			<div class="product-name">
				<a href="#" >
                                    <form action ="show_Item" method="get">
                                        <input type="hidden" name="idShoes" value="<%=i.getIdShoes()%>">
                                        <%=i.getNameShoes()%>
                                    </form>	
				</a>
			</div>
			<div class="brand">
				<a href="#">
                                    <form action="show_TheoThuongHieu" method="get">
                                        <input type="hidden" name="brandShoes" value="<%=i.getThuongHieu()%>">
					<%=i.getThuongHieu()%>
                                    </form>
				</a>
			</div>
			<div class="price">
				<p><%=i.getGiaTien()+"đ"%></p>
			</div>
		</div>
	</div> 
    <% } %>
</div>
<footer class="footer">
			<div class="site-footer">
				<div class="section top-footer mid-footer">
					<div class="container">
						<div class="row">
							<div class="footer-col-1">
								<div class="widget-ft">
									<h4 class="title-menu">
										<a href="#">Hệ thống cửa hàng</a>
									</h4>
									<div class="list-menu">
										<div class="widget-ft wg-logo">
											<div class="item">
												<h4 class="title-menu4 icon_none_first">
													<a>Sea Shoes Thanh Xuân</a>
												</h4>
												<ul class="contact contact_x">
													<li>
														<span class="txt_content_child">
															<span>Địa chỉ:</span>
															27A Khuất Duy Tiến
														</span>
													</li>
													<li class="sdt">
														<span> Hotline:</span>
														<a href="tel:0355799278">0355799278</a>
													</li>
												</ul>
											</div>
											<div class="item">
												<h4 class="title-menu4 icon_none_first">
													<a>Sea Shoes Phùng Khoang</a>
												</h4>
												<ul class="contact contact_x">
													<li>
														<span class="txt_content_child">
															<span>Địa chỉ:</span>
															Chợ Phùng Khoang, Hà Đông
														</span>
													</li>			
													<li class="sdt">
														<span> Hotline:</span>
														<a href="tel:0123456789">0123456789</a>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="footer-col-2">
								<div class="row">
									<div class="col-2-6">
										<div class="widget-ft first">
											<h4 class="title-menu">
												<a role="button" class="collapsed" data-toggle="collapse" aria-expanded="false" data-target="#collapseListMenu01" aria-controls="collapseListMenu01">
													Về chúng tôi
												</a>
											</h4>
											<div class="collapse" id="collapseListMenu01">
												<ul class="list-menu">
													<li class="li_menu"><a href="#"><form action="show_Index" method="get">Trang chủ</form></a></li>
													<li class="li_menu"><a href="#"><form action="show_About" method="get">Giới thiệu</form></a></li>
													<li class="li_menu"><a href="#"><form action="show_All_Item" method="get">Sản phẩm</form></a></li>
													<li class="li_menu"><a href="#"><form action="show_Contact" method="get">Liên hệ</form></a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="col-2-6">
										<div class="widget-ft first">
											<h4 class="title-menu">
												<a role="button" class="collapsed" data-toggle="collapse" aria-expanded="false" data-target="#collapseListMenu02" aria-controls="collapseListMenu02">
													Chính sách 
												</a>
											</h4>
											<div class="collapse" id="collapseListMenu02">
												<ul class="list-menu">
													<li class="li_menu"><a href="#"><form action="show_Index" method="get">Trang chủ</form></a></li>
													<li class="li_menu"><a href="#"><form action="show_About" method="get">Giới thiệu</form></a></li>
													<li class="li_menu"><a href="#"><form action="show_All_Item" method="get">Sản phẩm</form></a></li>
													<li class="li_menu"><a href="#"><form action="show_Contact" method="get">Liên hệ</form></a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="footer-col-3">
								<div class="widget-ft">
									<h4 class="title-menu">
										<a role="button">
											Đăng ký
										</a>
									</h4>
									<div class="footer-widget">
										<a href="/" class="bocongthuong">					
											<img src="img-about/bocongthuong.png" alt="Sea Shoes">					
										</a>
									</div>
									<h4 class="title-menu tittle_time">
										<a role="button">
											Thanh toán
										</a>
									</h4>
									<div class="time_work">
										<ul class="list-menu">
											<li class="li_menu li_menu_xxx">
												<a href="/" class="bocongthuong">					
													<img src="img-about/payment.png" alt="Sea Shoes">					
												</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="section clearfix"></div>
		</footer>
</body>
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
</html>
</html>
