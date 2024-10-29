package dao;

import java.sql.*;

public class DAO232 {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/btl_restman?useSSL=false&serverTimezone=UTC";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "131103";
    private static Connection connection;

    public DAO232() throws SQLException {
        try {
            // Tải driver MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Thiết lập kết nối
            connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("Không tìm thấy driver MySQL.");
        }
    }

    public Connection getConnection() {
        return connection;
    }

    public static void main(String[] args) {
        try {
            DAO232 dao232 = new DAO232();
            Connection connection = dao232.getConnection();
            if (connection != null) {
                System.out.println("Connect successfully!");
            } else {
                System.out.println("Connect Fail!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
