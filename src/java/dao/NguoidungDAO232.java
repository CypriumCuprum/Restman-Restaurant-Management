package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.nguoidung.Nguoidung232;

/**
 *
 * @author Cuprum
 */
public class NguoidungDAO232 extends DAO232 {

    public NguoidungDAO232() throws SQLException {
        super();
    }

    public Nguoidung232 getLogin(String username, String password) {
        String sql = "{ CALL CheckUserCredentials(?, ?) }";
        Nguoidung232 nguoidung = null;

        try {
            Connection connection = this.getConnection();
            CallableStatement callableStatement = connection.prepareCall(sql);
            // Đặt các tham số cho stored procedure
            callableStatement.setString(1, username);
            callableStatement.setString(2, password);

            // Thực thi stored procedure và lấy kết quả
            ResultSet resultSet = callableStatement.executeQuery();

            // Kiểm tra nếu có kết quả trả về
            if (resultSet.next()) {
                // Khởi tạo đối tượng Nguoidung232 với dữ liệu từ result set
                nguoidung = new Nguoidung232(
                        resultSet.getInt("id"),
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("hovaten"),
                        resultSet.getString("diachi"),
                        resultSet.getString("sdt"),
                        resultSet.getString("ghichu"),
                        resultSet.getString("vaitro")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý lỗi kết nối hoặc truy vấn
        }
        return nguoidung; // Trả về đối tượng Nguoidung232 hoặc null nếu không tìm thấy
    }
}
