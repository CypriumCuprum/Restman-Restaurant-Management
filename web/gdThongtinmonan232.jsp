<%@page import="model.monan.Combo232"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.monan.Monan232"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chi Tiết Món Ăn</title>
    <link rel="stylesheet" type="text/css" href="css/stylegdThongtinmonan.css">
</head>
<body>
    <!-- Thanh menu topbar -->
        <div class="topbar">
            <a href="gdChinhKH232.jsp" class="active">Trang chủ</a>
            <!--đang phát triển-->
            <a href="homepage.jsp">Thông tin tài khoản</a>
            <a href="gdTimkiemmonan232.jsp">Tìm kiếm món ăn</a>
            <!--đang phát triển-->
            <a href="homepage.jsp">Đơn đặt bàn</a>
            <!--đang phát triển-->
            <a href="homepage.jsp">Hỗ trợ khách hàng</a> 
            <a href="dangxuat.jsp">Đăng xuất</a>
        </div>
    <%
        // Lấy id từ tham số request
        String idParam = request.getParameter("id");
        Monan232 monan232 = null;
        Combo232 combo232 = null;

        if (idParam != null) {
            // Lấy session hiện tại
            session = request.getSession();
            // Tìm món ăn trong session
            if (idParam.contains("monan")) {
                    monan232 = (Monan232) session.getAttribute(idParam);
                    if (monan232 != null) {
    %>
        <h1>Chi Tiết Món Ăn</h1>
        <div class="details">
            <p><strong>ID:</strong> <span><%= monan232.getId() %></span></p>
            <p><strong>Tên:</strong> <span><%= monan232.getTen() %></span></p>
            <p><strong>Đơn Giá:</strong> <span><%= monan232.getDongia() + " VNĐ" %></span></p>
            <p><strong>Mô tả: </strong><span><%= monan232.getMota() %></span></p>
        </div>
    <%
        } else {
    response.sendRedirect("error.jsp");
        }
                }
                else if (idParam.contains("combo")) {
                    combo232 = (Combo232) session.getAttribute(idParam);
if (combo232 != null) {
    %>
        <h1>Chi Tiết Món Ăn</h1>
        <div class="details">
            <p><strong>ID:</strong> <span><%= combo232.getId() %></span></p>
            <p><strong>Tên:</strong> <span><%= combo232.getTen() %></span></p>
            <p><strong>Đơn Giá:</strong> <span><%= combo232.getDongia() +" VNĐ" %> </span></p>
            <p><strong>Mô tả: </strong><span><%= combo232.getMota() %></span></p>
        </div>
    <%
        } else {
   response.sendRedirect("error.jsp");
        }
                }
                else{
                response.sendRedirect("error.jsp");
        }
            
        }

        
    %>
</body>
</html>
