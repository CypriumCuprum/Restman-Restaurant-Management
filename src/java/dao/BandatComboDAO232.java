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
import model.monan.BandatCombo232;
import model.monan.Combo232;

/**
 *
 * @author Cuprum
 */
public class BandatComboDAO232 extends DAO232 {

    public BandatComboDAO232() throws SQLException {
        super();
    }

    public List<BandatCombo232> getBandatCombobyBandatid(int bandatid) {
        List<BandatCombo232> danhSachCombodat = new ArrayList<>();
        String sql = "{CALL getinforbandatcombo_by_bandatid(?)}";
        try {
            Connection connection = this.getConnection();
            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, bandatid); // Thiết lập tham số đầu vào
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int soluong = resultSet.getInt("soluong");
                float dongia = resultSet.getFloat("dongia");
                int comboId = resultSet.getInt("tblcombo232id");
                Combo232 combo = (new ComboDAO232()).getCombobyId(comboId);
                boolean is_onl = resultSet.getBoolean("is_onl");
                danhSachCombodat.add(new BandatCombo232(id, soluong, dongia, combo, is_onl));
            }
        } catch (Exception e) {
        }
        return danhSachCombodat;
    }

}
