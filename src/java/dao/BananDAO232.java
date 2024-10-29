/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import model.banan.Banan232;

/**
 *
 * @author Cuprum
 */
public class BananDAO232 extends DAO232 {

    public BananDAO232() throws SQLException {
        super();
    }

    public Banan232 get_banan_by_id(int id) {
        String sql = "{CALL get_banan_by_id(?)}";
        Banan232 banan232 = null;
        try {
            Connection connection = this.getConnection();

            CallableStatement statement = connection.prepareCall(sql);
            statement.setInt(1, id);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                banan232 = new Banan232(
                        resultSet.getInt("id"),
                        resultSet.getString("tenban"),
                        resultSet.getInt("soban"),
                        resultSet.getString("mota")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return banan232;
    }

}
