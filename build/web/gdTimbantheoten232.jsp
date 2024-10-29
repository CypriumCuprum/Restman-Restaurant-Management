<%-- 
    Document   : gdTimkiemmonan232.jsp
    Created on : Oct 21, 2024, 3:21:34 PM
    Author     : Cuprum
--%>


<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="dao.BandatDAO232"%>
<%@page import="model.banan.Bandat232"%>
<%@page import="dao.MonanDAO232"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tìm kiếm bàn ăn</title>
        <link rel="stylesheet" type="text/css" href="css/stylegdTimbantheoten.css">
    </head>
    </head>
    <body>
        <!-- Thanh menu topbar -->
        <div class="topbar">
            <a href="gdChinhNVBH232.jsp">Trang chủ</a>
            <!--đang phát triển-->
            <a href="homepage.jsp">Thông tin tài khoản</a>
            <a href="gdTimbantheoten232.jsp">Tìm bàn</a>
            <!--đang phát triển-->
            <a href="homepage.jsp">Đơn đặt bàn</a>
            <!--đang phát triển-->
            <a href="homepage.jsp">Hỗ trợ khách hàng</a> 
            <a href="dangxuat.jsp">Đăng xuất</a>
        </div>
        <div class="container">
        <h1>Tìm bàn theo tên</h1>
        <div class="search-bar">
            <form action="" method="GET">
                <input type="text" name="query" placeholder="Nhập tên bàn ăn..." required value="<%= request.getParameter("query") != null ? request.getParameter("query") : "" %>">
                <button type="submit">Tìm Kiếm</button>
            </form>
        </div>

        <div class="results">
            <h2>Kết Quả Tìm Kiếm</h2>
            

                <table border="2">
                    <tr>
                        <th>ID</th>
                        <th>Tên Bàn</th>
                        <th>Khách hàng</th>
                        <th>Thời gian đặt</th>
                        <th>Buổi ăn</th>
                    </tr>
                    
            <%
                // Lấy giá trị từ tham số 'query' trong GET request
                String query = request.getParameter("query");
                List<Bandat232> bandat232arr = new ArrayList<>();
                BandatDAO232 bandatDAO232 = new BandatDAO232();
                // Kiểm tra nếu có giá trị tìm kiếm
                if (query != null && !query.trim().isEmpty()) {
                    // Giả lập danh sách món ăn có sẵn
                    bandat232arr = bandatDAO232.getBandattheoten(query);
                }
                
                if (bandat232arr.isEmpty()) {
                        %>
                        <p>Không tìm thấy bàn ăn nào phù hợp với tìm kiếm của bạn.</p>
                        <%
                    }
                else{

                    // Tìm kiếm các món ăn phù hợp
                    for (Bandat232 item : bandat232arr) {
                        session.setAttribute("bandat_"+ item.getId(), item);
                        int id_item = item.getId();
                        String tenban = item.getBanan232().getTenban();
                        String tenkhachhang = item.getKhachhang232().getHovaten();
                        String tennvbh = item.getNhanvienbanhang232().getHovaten();
                        Date timedatban = item.getThoigiandat();
                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                        String strThoiGianDat = sdf.format(timedatban);
                        String thoigianan = item.getThoigianan();
                    %>
                             <tr onclick="window.location.href='gdHoadonKH232.jsp?id=<%= item.getId() %>'">
                        <td><%= id_item %></td>
                        <td><%= tenban %></td>
                        <td><%= tenkhachhang %></td>
                        <td><%= strThoiGianDat %></td>
                        <td><%= thoigianan %></td>
                    </tr>
                    <%
                    }
                }
                
            %>
        </div>
    </div>
    </body>
</html>
