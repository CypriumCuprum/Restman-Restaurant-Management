/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.nguoidung.Nhanvienbanhang232;

/**
 *
 * @author Cuprum
 */
public class NhanvienbanhangDAO232 extends DAO232 {

    public NhanvienbanhangDAO232() throws SQLException {
        super();
    }

    public Nhanvienbanhang232 getNVBHbyID(int id) {
        String sql = "{CALL get_NVBH_info_by_id(?)}"; // Câu lệnh gọi procedure
        Nhanvienbanhang232 nhanVienBanHang = null; // Khởi tạo đối tượng nhân viên bán hàng

        try {
            Connection connection = this.getConnection();
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, id); // Gán giá trị id cho tham số của procedure

            ResultSet resultSet = statement.executeQuery(); // Thực thi câu lệnh và lấy kết quả

            // Kiểm tra xem có dữ liệu trả về không
            if (resultSet.next()) {
                // Lấy thông tin từ ResultSet và tạo đối tượng Nhanvienbanhang232
                nhanVienBanHang = new Nhanvienbanhang232(
                        resultSet.getString("vitri"),
                        resultSet.getInt("nguoidung_id"), // Lấy id từ bảng nguoidung
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("hovaten"),
                        resultSet.getString("diachi"),
                        resultSet.getString("sdt"),
                        resultSet.getString("ghichu"),
                        resultSet.getString("vaitro")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace(); // In ra lỗi nếu có
        }

        return nhanVienBanHang; // Trả về đối tượng Nhanvienbanhang232 hoặc null nếu không tìm thấy
    }

}
