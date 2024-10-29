<%-- 
    Document   : dangxuat
    Created on : Oct 28, 2024, 12:16:21 AM
    Author     : Cuprum
--%>


<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Hủy bỏ session để người dùng đăng xuất
    javax.servlet.http.HttpSession currentSession = request.getSession(false);
    if (currentSession != null) {
        currentSession.invalidate(); // Hủy session
    }
    // Chuyển hướng về trang đăng nhập
    response.sendRedirect("login.jsp");
%>


