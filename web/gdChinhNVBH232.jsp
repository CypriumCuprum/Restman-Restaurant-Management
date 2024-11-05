<%-- 
    Document   : gdChinhNVBH232
    Created on : Oct 27, 2024, 11:55:57 PM
    Author     : Cuprum
--%>

<%@page import="model.nguoidung.Nhanvienbanhang232"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giao diện chính NVBH</title>
        <link rel="stylesheet" type="text/css" href="css/stylegdChinhNVBH232.css">

    </head>
    <body>
        <!-- Thanh menu topbar -->
        <div class="topbar">
            <a href="gdChinhNVBH232.jsp" class="active">Trang chủ</a>
            <!--đang phát triển-->
            <a href="homepage.jsp">Thông tin tài khoản</a>
            <a href="gdTimbantheoten232.jsp">Tìm bàn</a>
            <!--đang phát triển-->
            <a href="homepage.jsp">Đơn đặt bàn</a>
            <!--đang phát triển-->
            <a href="homepage.jsp">Hỗ trợ khách hàng</a> 
            <a href="dangxuat.jsp">Đăng xuất</a>
        </div>
        <%
            Nhanvienbanhang232 nhanvienbanhang232 = (Nhanvienbanhang232)session.getAttribute("nvbh");
        %>
        <div class="content">
            <h1>Chào mừng <%= nhanvienbanhang232.getHovaten() %>!</h1>
            <p>Chúc một ngày làm việc vui vẻ</p>
        </div>
    </body>
</html>
