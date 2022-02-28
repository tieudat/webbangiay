<%-- 
    Document   : signup
    Created on : Nov 23, 2020, 2:31:52 PM
    Author     : admin
--%>


<%@page import="dao.userDAO"%>
<%@page import="model.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>signup</title>
        <meta charset="utf-8">
	<meta charset="viewport" content="width=device-width,initial-scale=1.0">
	<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
	<link rel="stylesheet" type="text/css" href="css/signup.css">
	<style>
            <%@include file ="/css/signup.css" %>
        </style>
    </head>
    <body>
        <div id="container" class="container">
		<!--FORM SELECTION-->
		<div class="row">
			<!--đăng ký-->
			<div class="col align-items-center flex-col">
				
                                    <form action="SignUp" method="post">
					<div class="form sign-up">
                                            <%
                                                if(session.getAttribute("UserTonTai")!=null){
                                                session.removeAttribute("UserTonTai");
                                            %>
                                            <p style="font-size: 20px">Tên tài khoản đã tồn tại</p>
                                            <% } %>
						<div class="input-group">
							<i class='bx bxs-user'></i>
                                                        <input name="usernameSign" type="text" placeholder="username" required="required">
                                                        
						</div>
                                            <div class="input-group">
							<i class='bx bxs-user'></i>
							<input name="fullnameSign" type="text" placeholder="Fullname" required="required">
						</div>
						<div class="input-group">
							<i class='bx bx-mail-send'></i>
							<input name="emailSign" type="email" placeholder="email" required="required">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt' ></i>
                                                        <input name="passSign" type="password" placeholder="password" required="required">
						</div>
                                                
						
                                                <div class="input-group">
							<i class='bx bxs-user'></i>
							<input name="addressSign" type="text" placeholder="Address" required="required">
						</div>
                                            <div class="input-group">
							<i class='bx bxs-user'></i>
							<input name="phoneSign" type="text" placeholder="Phone" required="required">
						</div>
                                            <input type="submit" value="Đăng ký" style="width: 100%;background-color: var(--primary-color); color: white; height: 50px; cursor: pointer; border: none">
						<p>
							<span>
								Đã có tài khoản sẵn sàng
							</span>
                                                        <b onclick="toggle()" class="pointer">
								Đăng nhập
							</b>
						</p>
					</div>
                                    </form>
				
				
			</div>
			<!--kết thúc đăng ký-->
			<div class="col align-items-center flex-col">
				<div class="form-wrapper align-items-center">
                                    <form action="LogIn" method="post">
					<div class="form sign-in">
						<div class="input-group">
							<i class='bx bxs-user'></i>
							<input name="usernamelog" type="text" placeholder="username" required="required">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt' ></i>
							<input name="passwordlog" type="password" placeholder="password" required="required">
						</div>
                                            <input type="submit" value="Đăng nhập"style="width: 100%;background-color: var(--primary-color); color: white; height: 50px; cursor: pointer; border: none">
						
						<p>
							<span>
								Chưa có tài khoản
							</span>
							<b onclick="toggle()" class="pointer">
								Đăng ký
							</b>	
						</p>
					</div>
                                    </form>
				</div>
				
			</div>
		</div>
		<!--END FORM SELECTION-->
		<!--CONTENT SELECTION-->
		<div class="row content-row">
			<!--sign-in content-->
			<div class="col align-items-center flex-col">
				<div class="text sign-in">
					<h2>Welcome Back</h2>
					<p>SeaShoes Học Viện Công Nghệ Bưu Chính Viễn Thông</p>
				</div>
				<div class="img sign-in">
					<img src="login/giayphong.jpg" alt="WELCOME">
				</div>
			</div>
			<!--end sign-in content-->
			<!--sign-up content-->
			<div class="col align-items-center flex-col">
				<div class="img sign-up">
					<img src="login/nike.jpg" alt="Join">
				</div>
				<div class="text sign-up">
					<p>SeaShoes Học Viện Công Nghệ Bưu Chính Viễn Thông</p>
					<h2>Join With Us</h2>
				</div>
			</div>
			<!--end sign-up content-->
		</div> 
		<!--END CONTENT SELECTION-->
	</div>

	<script src="js/sign.js"></script>
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

