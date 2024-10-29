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

    public List<Monan232> getMonAn(String tenMonAn) throws SQLException {
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
}
