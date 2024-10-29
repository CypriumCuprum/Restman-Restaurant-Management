/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

/**
 *
 * @author Cuprum
 */
public class NhanvienDAO232 extends DAO232 {

    public NhanvienDAO232() throws SQLException {
        super();
    }

    // Phương thức lấy vị trí của nhân viên dựa trên id
    public String getVitri(int id) throws SQLException {
        String vitri = null;
        Connection conn = null;
        CallableStatement callableStatement = null;

        try {
            // Lấy kết nối từ DAO232
            conn = this.getConnection();

            // Gọi stored procedure sp_kiemtra_vitri_nhanvien232
            String sql = "{CALL sp_kiemtra_vitri_nhanvien232(?, ?)}";  // Tham số: in_nhanvien_id, out_vitri

            callableStatement = conn.prepareCall(sql);

            // Đặt giá trị cho tham số đầu vào (in_nhanvien_id)
            callableStatement.setInt(1, id);

            // Đăng ký tham số đầu ra (out_vitri)
            callableStatement.registerOutParameter(2, Types.VARCHAR);

            // Thực thi stored procedure
            callableStatement.execute();

            // Lấy kết quả từ tham số đầu ra
            vitri = callableStatement.getString(2);

        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Lỗi khi gọi stored procedure: " + e.getMessage());
        } finally {
            // Đóng các kết nối
            if (callableStatement != null) {
                callableStatement.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return vitri;  // Trả về vị trí của nhân viên hoặc thông báo lỗi từ stored procedure
    }
}
