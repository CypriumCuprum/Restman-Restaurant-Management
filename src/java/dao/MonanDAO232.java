/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.monan.Monan232;

/**
 *
 * @author Cuprum
 */
public class MonanDAO232 extends DAO232 {

    public MonanDAO232() throws SQLException {
        super();
    }

    public List<Monan232> getMonAnbyname(String tenMonAn) throws SQLException {
        List<Monan232> danhSachMonAn = new ArrayList<>();
        String sql = "{CALL timkiemmonantheoten(?)}";

        try {
            Connection connection = this.getConnection();
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, tenMonAn); // Thiết lập tham số đầu vào
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String ten = resultSet.getString("ten");
                String mota = resultSet.getString("mota");
                float dongia = resultSet.getFloat("dongia");

                Monan232 monAn = new Monan232(id, ten, mota, dongia);
                danhSachMonAn.add(monAn);
            }
        } catch (Exception e) {
            e.getStackTrace();
        }

        return danhSachMonAn;
    }

    public Monan232 getMonanbyId(int id) {
        Monan232 monan = null;
        String query = "CALL getMonanbyId(?)"; // Giả sử bạn đã tạo stored procedure như đã nêu

        try {
            Connection connection = this.getConnection();
            CallableStatement statement = connection.prepareCall(query);

            statement.setInt(1, id); // Gán giá trị id vào tham số của procedure

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    // Lấy thông tin từ ResultSet và tạo đối tượng Monan232
                    int monanId = resultSet.getInt("id");
                    String ten = resultSet.getString("ten");
                    String mota = resultSet.getString("mota");
                    float dongia = resultSet.getFloat("dongia");

                    monan = new Monan232(monanId, ten, mota, dongia);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý lỗi nếu cần
        }

        return monan; // Trả về đối tượng Monan232, có thể là null nếu không tìm thấy
    }
}
