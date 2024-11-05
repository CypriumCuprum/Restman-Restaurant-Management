/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.Date;
import model.banan.Bandat232;
import model.hoadon.Hoadon232;
import model.nguoidung.Nhanvienbanhang232;

/**
 *
 * @author Cuprum
 */
public class HoadonDAO232 extends DAO232 {

    public HoadonDAO232() throws SQLException {
        super();
    }

    public Hoadon232 getHoadon(Bandat232 bandat, Nhanvienbanhang232 nhanvienbanhang) {
        Hoadon232 hoadon232 = new Hoadon232(bandat.getId(), new Date(), nhanvienbanhang, bandat);
        return hoadon232;
    }

    public boolean savehoadontodb(Hoadon232 hoadon232) {
        String sql = "{CALL savehoadon232(?, ?, ?)}";

        try {
            Connection connection = this.getConnection();
            CallableStatement callableStatement = connection.prepareCall(sql);
            callableStatement.setInt(1, hoadon232.getNvbhtaohoadon().getId());

            callableStatement.setDate(2, new java.sql.Date(hoadon232.getThoigiantao().getTime()));
            callableStatement.setInt(3, hoadon232.getId());
            // Thực thi procedure
            int rowsAffected = callableStatement.executeUpdate();

            return rowsAffected > 0; // Kiểm tra nếu có dòng nào được thêm vào
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean checkexistshoadon(int id) {
        String sql = "{CALL timhoadonbyid(?)}";

        try {
            Connection connection = this.getConnection();
            CallableStatement callableStatement = connection.prepareCall(sql);
            callableStatement.setInt(1, id);

            ResultSet resultSet = callableStatement.executeQuery();
            // Kiểm tra nếu có kết quả trả về (hóa đơn tồn tại)
            if (resultSet.next()) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;

    }

    public Hoadon232 getHoadonbyid(int id) {
        String sql = "{CALL timhoadonbyid(?)}";
        Hoadon232 hoadon232 = null;
        try {
            Connection connection = this.getConnection();
            CallableStatement callableStatement = connection.prepareCall(sql);
            callableStatement.setInt(1, id);

            ResultSet resultSet = callableStatement.executeQuery();
            // Kiểm tra nếu có kết quả trả về (hóa đơn tồn tại)
            if (resultSet.next()) {
                int idbandat = resultSet.getInt("tblbandat232id");
                Date ngaythanhtoan = resultSet.getDate("thoigian");
                int idnvthanhtoan = resultSet.getInt("tblnhanvienbanhang232id");

                Nhanvienbanhang232 nhanvienthanhtoan232 = (new NhanvienbanhangDAO232()).getNVBHbyID(idnvthanhtoan);
                Bandat232 bandat232 = (new BandatDAO232()).getBandatbyId(idbandat);
                hoadon232 = new Hoadon232(idbandat, ngaythanhtoan, nhanvienthanhtoan232, bandat232);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return hoadon232;
    }

}
