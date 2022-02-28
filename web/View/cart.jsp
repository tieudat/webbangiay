<%@page import="model.user"%>
<%@page import="model.shoes"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE lang="vi">
<html>
<head>
	<title> Sea Shoes</title>
	<link rel="stylesheet" type="text/css" href="css/cart.css">
        <link rel="stylesheet" type="text/css" href="css/footer.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,900;1,100;1,300;1,700;1,900&display=swap" rel="stylesheet">
	<meta charset="utf-8" content="width=device-width,initial-scale=1" >
        <style>
            <%@include file ="/css/cart.css" %>
        </style>
</head>
<body>
    <div id="thanhtoan" class="form-thanhtoan" action="thanhtoan">
    <form action="pay"  method="post" class="form-content">
        
        <div  class="container" style="display: flex; flex-direction: column;">
            <label for="uname"><b>Nhập địa chỉ nhận hàng</b></label>
            <input type="text" name="txt_Diachi" required>
            <label for="uname"><b>Nhập số điện thoại liên hệ</b></label>
            <input type="text" name="txt_soDT" required>
            <label for="uname"><b>Nhập tên người nhận</b></label>
            <input type="text" name="txt_soDT" required>
            
            <input id ="str" type="hidden" name="hoadon">
      </div>

      <div class="container" style="background-color:#f1f1f1">
          <%
            if(session.getAttribute("user")==null)
            { 
                %>
                <button type="button" onclick="alert('bạn cần đăng nhập');">Lưu lại</button>
                <%
            }
            else
            {           
                %>            
                <button type="submit">Lưu lại</button>
                <%
            }
        %>         
                <button type="button" onclick="document.getElementById('thanhtoan').style.display='none'" class="cancelbtn">Quay lại</button>
      </div>
    
    </form>
    </div>
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
								<li class="nav-menu-item active">
									<a href="#" class="a-img"><form action="show_Index" method="get">Trang chủ </form></a>
								</li>
								<li class="nav-menu-item">
									<a href="#" class="a-img"><form action="show_About" method="get">Giới thiệu </form></a>
								</li>
								<li class="nav-menu-item nav-menu-item--after nav-menu-item-hover">
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
			<h2>Giới thiệu</h2>
			<div class="desition-title">
				<ul>
					<li><a href="#" class="content-link">
                                                <form action="show_Index" method="get">Trang chủ</form>
                                            </a>
                                        </li>
					<li>/</li>
					<li><a  class="content-link">Giỏ hàng</a></li>
				</ul>
			</div>

		</div>
	</div>
	            <div id="bdaugiohang">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalLabel">Sản phẩm trong giỏ hàng.</h4>

                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <a aria-hidden="true"></a>
                        </button>

                    </div>
<!--                    <form action="/cart" method="post" id="cartform" style="display: block;">-->
                        <div class="modal-body">
                            <table style="width:100%;" id="cart-table">
                                <tbody>
                                    <tr>
                                        <th></th>
                                        <th>Tên sản phẩm</th>
                                        <th>Số lượng</th>
                                        <th>Giá tiền cho 1 sản phẩm</th>
                                        <th></th>
                                    </tr>
                                    <tr class="line-item original">
                                        <td class="item-image"></td>
                                        <td class="item-title">
                                            <a></a>
                                        </td>
                                        <td class="item-quantity"></td>
                                        <td class="item-price"></td>
                                        <td class="item-delete"></td>
                                    </tr>
                       
                                    <%
                                        if(session.getAttribute("cart")!=null)
                                        {
                                            ArrayList<shoes> dsgiay = (ArrayList<shoes>)session.getAttribute("cart");
                                            for(shoes s : dsgiay)
                                            {
                                    %>      
                                   
                                            <tr class="line-item">
                                                <td class="item-image">
                                                    <img style="width: 160px;height: 160px;" src="<%=s.getLinkImg() %>" /></td>
                                                <td class="item-title">
                                                    <a><%=s.getNameShoes() %><br></a>
                                                </td>
                                                <td class="item-quantity"><input class="SoGIAY" name="updates[]" min="1" type="number" value="1" class=""></td>
                                                <td class="item-price"><%=s.getGiaTien() %></td>
                                                <td class="item-delete">
                                                    <form action="Del_shoes" method="get">
                                                        <input class="idGIAY" name="idSanpham" type="hidden" value="<%=s.getIdShoes() %>">
                                                        <a href="#" onclick="this.parentElement.submit()">Xóa</a>
                                                    </form>
                                                </td>
                                            </tr>
                                    <%
                                            }
                                        }
                                    %>

                                </tbody>
                            </table>
                        </div>
           
                                <div class="col-lg-6 text-right">
                                    <div class="buttons btn-modal-cart">
                                        <button type="submit" class="button-default" onclick="showThanhtoan()">
                                            Thanh toán
                                        </button>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </form>
                </div>
            </div>
        </div>
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
                
                function showThanhtoan()
                {
                    document.getElementById("thanhtoan").style.display = "block";
                    var oTable = document.getElementById('cart-table');		
                    var rowLength = oTable.rows.length;		
                    var soluong = document.getElementsByClassName("SoGIAY");                   
                    var aidi = document.getElementsByClassName("idGIAY");
                    
                    for (i = 0; i < rowLength; i++){
                        var idSP = aidi.item(i).value;
                        var slSP = soluong.item(i).value;
                        var str = document.getElementById("str").value;
                        str = str + idSP + "," + slSP + ".";
                        document.getElementById("str").value = str;
                        alert(str);
                    }
                    
                    
                }
                
                function check()
	{
		
	}

</script>
</html>