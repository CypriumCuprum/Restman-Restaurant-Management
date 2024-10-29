/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.banan.Banan232;
import model.banan.Bandat232;
import model.nguoidung.Khachhang232;
import model.nguoidung.Nhanvienbanhang232;

/**
 *
 * @author Cuprum
 */
public class BandatDAO232 extends DAO232 {

    public BandatDAO232() throws SQLException {
        super();
    }

    public List<Bandat232> getBandattheoten(String tenban) throws SQLException {
        List<Bandat232> bandatList = new ArrayList<>();

        String sql = "{CALL get_bandat_by_tenban(?)}";

        try {
            Connection connection = this.getConnection();
            CallableStatement stmt = connection.prepareCall(sql);
            stmt.setString(1, tenban);  // Truyền tham số tenban vào procedure

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    Date thoigiandat = rs.getDate("thoigiandat");
                    boolean confirmdat = rs.getBoolean("confirmdat");
                    String mota = rs.getString("mota");
                    int khachhangId = rs.getInt("tblkhachhang232id");
                    int nhanvienId = rs.getInt("tblnhanvienbanhang232id");
                    int bananId = rs.getInt("tblbanan232id");

                    Khachhang232 khachhang232 = (new KHDAO232()).getkhachhangbyId(khachhangId);
                    Nhanvienbanhang232 nhanvienbanhang232 = (new NhanvienbanhangDAO232()).getNVBHbyID(nhanvienId);
                    Banan232 banan232 = (new BananDAO232()).get_banan_by_id(bananId);
                    // Tạo đối tượng Bandat232 và thêm vào danh sách
                    Bandat232 bandat = new Bandat232(id, thoigiandat, confirmdat, mota, khachhang232, nhanvienbanhang232, banan232);
                    bandatList.add(bandat);

                    // Thêm các chi tiết khác như Khachhang232, Nhanvienbanhang232 sau khi load các bảng tương ứng
                    // bandat.setKhachhang232(getKhachhangById(khachhangId));
                    // bandat.setNhanvienbanhang232(getNhanvienbanhangById(nhanvienId));
                    // bandat.setBanan232(getBananById(bananId));
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
        }

        return bandatList;
    }
}