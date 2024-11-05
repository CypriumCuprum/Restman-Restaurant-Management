/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.monan.BandatMonan232;
import model.monan.Monan232;

/**
 *
 * @author Cuprum
 */
public class BandatMonanDAO232 extends DAO232 {

    public BandatMonanDAO232() throws SQLException {
        super();
    }

    public List<BandatMonan232> getBandatMonanbyBandatid(int bandatid) {
        List<BandatMonan232> danhSachMondat = new ArrayList<>();
        String sql = "{CALL getinforbandatmonan_by_bandatid(?)}";
        try {
            Connection connection = this.getConnection();
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, bandatid); // Thiết lập tham số đầu vào
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int soluong = resultSet.getInt("soluong");
                float dongia = resultSet.getFloat("dongia");
                int monanId = resultSet.getInt("tblmonan232id");
                Monan232 monan = (new MonanDAO232()).getMonanbyId(monanId);
                boolean is_onl = resultSet.getBoolean("is_onl");
                danhSachMondat.add(new BandatMonan232(id, soluong, dongia, monan, is_onl));
            }
        } catch (Exception e) {
        }
        return danhSachMondat;
    }
}
