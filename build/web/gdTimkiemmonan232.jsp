<%-- 
    Document   : gdTimkiemmonan232.jsp
    Created on : Oct 21, 2024, 3:21:34 PM
    Author     : Cuprum
--%>

<%@page import="model.monan.Monan232"%>
<%@page import="dao.MonanDAO232"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tìm kiếm món ăn</title>
        <link rel="stylesheet" type="text/css" href="css/stylegdTimkiemmonan.css">
    </head>
    </head>
    <body>
        <!-- Thanh menu topbar -->
        <div class="topbar">
            <a href="gdChinhKH232.jsp">Trang chủ</a>
            <!--đang phát triển-->
            <a href="homepage.jsp">Thông tin tài khoản</a>
            <a href="gdTimkiemmonan232.jsp">Tìm kiếm món ăn</a>
            <!--đang phát triển-->
            <a href="homepage.jsp">Đơn đặt bàn</a>
            <!--đang phát triển-->
            <a href="homepage.jsp">Hỗ trợ khách hàng</a> 
            <a href="dangxuat.jsp">Đăng xuất</a>
        </div>
        <div class="container">
        <h1>Tìm Kiếm Món Ăn</h1>
        <div class="search-bar">
            <form action="" method="GET">
                <input type="text" name="query" placeholder="Nhập tên món ăn..." required value="<%= request.getParameter("query") != null ? request.getParameter("query") : "" %>">
                <button type="submit">Tìm Kiếm</button>
            </form>
        </div>

        <div class="results">
            <h2>Kết Quả Tìm Kiếm</h2>
            

                <table border="2">
                    <tr>
                        <th>ID</th>
                        <th>Tên Món Ăn</th>
                        <th>Đơn Giá</th>
                    </tr>
                    
            <%
                // Lấy giá trị từ tham số 'query' trong GET request
                String query = request.getParameter("query");
                List<Monan232> foodItems = new ArrayList<>();
                MonanDAO232 monanDAO232 = new MonanDAO232();
                // Kiểm tra nếu có giá trị tìm kiếm
                if (query != null && !query.trim().isEmpty()) {
                    // Giả lập danh sách món ăn có sẵn
                    foodItems = monanDAO232.getMonAn(query);
                }
                
                if (foodItems.isEmpty()) {
                        %>
                        <p>Không tìm thấy món ăn nào phù hợp với tìm kiếm của bạn.</p>
                        <%
                    }
                else{

                    // Tìm kiếm các món ăn phù hợp
                    for (Monan232 item : foodItems) {
                        session.setAttribute("monan_"+ item.getId(), item);
                    %>
                             <tr onclick="window.location.href='gdThongtinmonan232.jsp?id=<%= item.getId() %>'">
                        <td><%= item.getId() %></td>
                        <td><%= item.getTen() %></td>
                        <td><%= item.getDongia() %></td>
                    </tr>
                    <%
                    }
                }
                
            %>
        </div>
    </div>
    </body>
</html>
