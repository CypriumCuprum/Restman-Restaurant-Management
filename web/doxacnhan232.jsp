<%@page import="dao.HoadonDAO232"%>
<%@page import="model.hoadon.Hoadon232"%>
<%@page import="model.banan.Bandat232"%>
<%@page import="model.nguoidung.Nhanvienbanhang232"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xác nhận hóa đơn</title>
    </head>
    <body>
        <%
            String idParam = request.getParameter("id");
            Hoadon232 hoadon232 = null;
            Nhanvienbanhang232 user = null;

            if (idParam != null) {
                session = request.getSession();
                hoadon232 = (Hoadon232)session.getAttribute("hoadon_" + idParam);
                user = (Nhanvienbanhang232) session.getAttribute("nvbh");

                if (hoadon232 != null && user != null) {
                    HoadonDAO232 hoadonDAO = new HoadonDAO232();
                    if(hoadonDAO.savehoadontodb(hoadon232)){
                    
                    // Hiển thị thông báo lưu thành công
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Lưu hóa đơn thành công');");
                    out.println("window.location.href = 'gdHoadonKH232.jsp?id=" + idParam + "';");
                    out.println("</script>");
                }
                else{
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Lưu hóa đơn thất bại');");
                    out.println("window.location.href = 'gdHoadonKH232.jsp?id=" + idParam + "';");
                    out.println("</script>");
                }
                } else {
                    response.sendRedirect("error.jsp");
                }
            } else {
                response.sendRedirect("error.jsp");
            }
        %>
    </body>
</html>
