<%-- 
    Document   : gdHoadonKH232
    Created on : Oct 29, 2024, 10:54:41 AM
    Author     : Cuprum
--%>

<%@page import="model.monan.BandatCombo232"%>
<%@page import="model.monan.BandatMonan232"%>
<%@page import="dao.HoadonDAO232"%>
<%@page import="model.hoadon.Hoadon232"%>
<%@page import="model.nguoidung.Nhanvienbanhang232"%>
<%@page import="model.banan.Bandat232"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hóa đơn page</title>
        <link rel="stylesheet" type="text/css" href="css/stylegdHoadonKH.css">
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
        <div class="container">
            <h1>Hóa Đơn Khách hàng</h1>
            <%
                String idParam = request.getParameter("id");
                HoadonDAO232 hoadonDAO232 = new HoadonDAO232();
                Bandat232 bandat = null;
                Nhanvienbanhang232 user = null;
                Hoadon232 hoadon232 = null;
                if (idParam!=null) {
                        session = request.getSession();
                        try { 
                        bandat = (Bandat232)session.getAttribute("bandat_"+idParam);
                        user = (Nhanvienbanhang232)session.getAttribute("nvbh");
                        } catch (Exception e) {
                        response.sendRedirect("error.jsp");
                            }
                    }
                else{
                    response.sendRedirect("error.jsp");
                }
                boolean checkexist = false;
                
                if (bandat != null && user != null) {
                hoadon232 = hoadonDAO232.getHoadonbyid(bandat.getId());
                if (hoadon232 == null) {
                        hoadon232 = hoadonDAO232.getHoadon(bandat, user);
                        session.setAttribute("hoadon_"+hoadon232.getId(), hoadon232);
                    }
                    else{
                    checkexist = true;
                }
                
           
                %>
                
                    <table border="2" >
                        <tr>
                            <th>ID </th>
                            <th><%=bandat.getId() %></th>
                        </tr>
                        <tr>
                            <th>Tên khách hàng </th>
                            <th><%=bandat.getKhachhang232().getHovaten()%></th>
                        </tr>
                        <tr>
                            <th>Nhân viên xác nhận đặt </th>
                            <th><%=bandat.getNhanvienbanhang232().getHovaten()%></th>
                        </tr>
                        <tr>
                            <th>Nhân viên thanh toán </th>
                            <th><%=hoadon232.getNvbhtaohoadon().getHovaten() %></th>
                        </tr>
                        <tr>
                            <th>Thời gian ăn trong ngày </th>
                            <th><%= (bandat.getNgayan()+": "+ bandat.getThoigianan())%></th>
                        </tr>
                        <tr>
                            <th>Thời gian thanh toán </th>
                            <th><%= hoadon232.getThoigiantao() %></th>
                        </tr>
                        
                    </table>
                <h3>Danh sách món đã đặt</h3>
                        <div class="results">
                        <table border="2">
                            <tr>
                        <th>STT</th>
                        <th>Món ăn/Combo</th>
                        <th>Đơn giá</th>
                        <th>Số lượng</th>
                        <th>Tổng tiền</th>
                    </tr>
                    <%
                        int cnt = 1;
                        for (BandatCombo232 elem : hoadon232.getBandat().getBandatCombo232arr()) {
                                %>
                                <tr>
                                    <th><%=cnt%></th>
                                    <th><%=elem.getCombo232().getTen() %></th>
                                    <th><%=elem.getDongia() %></th>
                                    <th><%=elem.getSoluong() %></th>
                                    <th><%=elem.getTongtien() %></th>
                                </tr>
                                <%
                                    cnt+=1;
                            }

                        for (BandatMonan232 elem : hoadon232.getBandat().getBandatMonan232arr()) {
                                %>
                                <tr>
                                    <th><%=cnt%></th>
                                    <th><%=elem.getMonan232().getTen() %></th>
                                    <th><%=elem.getDongia() %></th>
                                    <th><%=elem.getSoluong() %></th>
                                    <th><%=elem.getTongtien() %></th>
                                </tr>
                                <%
                                    cnt+=1;
                            }
                        %>
                        <tr>
                            <th colspan="4" style="text-align: left;">Tổng tiền</th>
                            <th><%=hoadon232.getTongtien() %></th>
                        </tr>
                                <%
                    %>
                        </table>
                        </div>
                <%
              
                    }
                %>
        </div>
        <%
            if (!checkexist) {
                    
                
            %>
        <div style="text-align: center; margin-top: 20px;margin-bottom: 100px">
    <form action="doxacnhan232.jsp" method="post">
        <input type="hidden" name="id" value="<%= idParam %>">
        <button type="submit" style="padding: 10px 20px; font-size: 16px;">Xác nhận</button>
    </form>
</div>
        <%
            }
%>
    </body>
</html>
