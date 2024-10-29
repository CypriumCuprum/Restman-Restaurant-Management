<%@page import="dao.NhanvienDAO232"%>
<%@page import="model.nguoidung.Nhanvien232"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.NguoidungDAO232"%>
<%@page import="model.nguoidung.Nguoidung232"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Đăng nhập</title>
        <link rel="stylesheet" type="text/css" href="css/stylelogin.css">
    </head>
    <body>
        <div class="login-box">
            <h2>Đăng nhập</h2>

            <form method="post">
                <input type="text" name="username" placeholder="Tên đăng nhập" required>
                <input type="password" name="password" placeholder="Mật khẩu" required>
                <button type="submit">Đăng nhập</button>
            </form>

            <%
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                NguoidungDAO232 nguoidungDAO = new NguoidungDAO232();
                NhanvienDAO232 nhanvienDAO232 = new NhanvienDAO232();

                if (username != null && password != null) {
                    try {
                        Nguoidung232 nguoidung = nguoidungDAO.getLogin(username, password);

                        if (nguoidung != null) {
                            session.setAttribute("nguoidung", nguoidung);
                            String vaitro = nguoidung.getVaitro();
                            if ("khachhang".equals(vaitro)) {
                                response.sendRedirect("gdChinhKH232.jsp");
                            } else {
                                String vitri = nhanvienDAO232.getVitri(nguoidung.getId());
                                if ("nhanvienbanhang".equals(vitri)) {
                                    response.sendRedirect("gdChinhNVBH232.jsp");
                                } else if ("quanly".equals(vitri)) {
                                    response.sendRedirect("gdChinhquanly232.jsp");
                                } else if ("nhanvienkho".equals(vitri)) {
                                    response.sendRedirect("gdChinhnhanvienkho232.jsp");
                                } else {
                                    System.out.println("Sai vị trí");
                                }
                            }
                        } else {
                            out.println("<p style='color:red;'>Sai tên đăng nhập hoặc mật khẩu. Vui lòng thử lại.</p>");
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println("<p style='color:red;'>Có lỗi xảy ra khi kết nối đến cơ sở dữ liệu.</p>");
                    }
                }
            %>
        </div>
    </body>
</html>
