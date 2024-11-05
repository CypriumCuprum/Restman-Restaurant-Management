/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.monan.Combo232;

/**
 *
 * @author Cuprum
 */
public class ComboDAO232 extends DAO232 {

    public ComboDAO232() throws SQLException {
        super();
    }

    public Combo232 getCombobyId(int id) {
        Combo232 Combo = null;
        String query = "CALL getCombobyId(?)"; // Giả sử bạn đã tạo stored procedure như đã nêu

        try {
            Connection connection = this.getConnection();
            CallableStatement statement = connection.prepareCall(query);

            statement.setInt(1, id); // Gán giá trị id vào tham số của procedure

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    // Lấy thông tin từ ResultSet và tạo đối tượng Combo232
                    int ComboId = resultSet.getInt("id");
                    String ten = resultSet.getString("ten");
                    String mota = resultSet.getString("mota");
                    float dongia = resultSet.getFloat("dongia");

                    Combo = new Combo232(ComboId, ten, mota, dongia);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý lỗi nếu cần
        }

        return Combo; // Trả về đối tượng Combo232, có thể là null nếu không tìm thấy
    }

    public List<Combo232> getCombobyname(String tenCombo) {
        List<Combo232> danhSachCombo = new ArrayList<>();
        String sql = "{CALL timkiemcombotheoten(?)}";

        try {
            Connection connection = this.getConnection();
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, tenCombo); // Thiết lập tham số đầu vào
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String ten = resultSet.getString("ten");
                String mota = resultSet.getString("mota");
                float dongia = resultSet.getFloat("dongia");

                Combo232 combo = new Combo232(id, ten, mota, dongia);
                danhSachCombo.add(combo);
            }
        } catch (Exception e) {
            e.getStackTrace();
        }

        return danhSachCombo;
    }

}
