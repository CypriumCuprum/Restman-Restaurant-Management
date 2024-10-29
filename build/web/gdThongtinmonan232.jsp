<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.monan.Monan232"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chi Tiết Món Ăn</title>
</head>
<body>
    <%
        // Lấy id từ tham số request
        String idParam = request.getParameter("id");
        Monan232 monan = null;

        if (idParam != null) {
            // Lấy session hiện tại
            session = request.getSession();
            // Tìm món ăn trong session
            monan = (Monan232) session.getAttribute("monan_" + idParam);
        }

        if (monan != null) {
    %>
        <h1>Chi Tiết Món Ăn</h1>
        <p><strong>ID:</strong> <%= monan.getId() %></p>
        <p><strong>Tên Món Ăn:</strong> <%= monan.getTen() %></p>
        <p><strong>Đơn Giá:</strong> <%= monan.getDongia() %></p>
        <p><strong>Mô tả: </strong><%= monan.getMota() %></p>
    <%
        } else {
    %>
        <h1>Không tìm thấy món ăn.</h1>
    <%
        }
    %>
</body>
</html>
