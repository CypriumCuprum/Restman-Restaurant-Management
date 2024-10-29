/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import model.nguoidung.Khachhang232;

/**
 *
 * @author Cuprum
 */
public class KHDAO232 extends DAO232 {

    public KHDAO232() throws SQLException {
        super();
    }

    public Khachhang232 getkhachhangbyId(int id) {
        String sqlkhachhang = "{CALL get_khachhang_info_by_id(?)}";
        Khachhang232 khachhang = null;
        try {
            Connection connection = this.getConnection();
            CallableStatement statement = connection.prepareCall(sqlkhachhang);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                int userId = resultSet.getInt("id");
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                String hovaten = resultSet.getString("hovaten");
                String diachi = resultSet.getString("diachi");
                String sdt = resultSet.getString("sdt");
                String ghichu = resultSet.getString("ghichu");
                String vaitro = resultSet.getString("vaitro");
                resultSet.close();
                statement.close();
                // Giả sử Thethanhvien232 là null hoặc có phương thức để khởi tạo
                return new Khachhang232(null, userId, username, password, hovaten, diachi, sdt, ghichu, vaitro);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // xử lý lỗi kết nối
        }
        return khachhang;
    }

}
