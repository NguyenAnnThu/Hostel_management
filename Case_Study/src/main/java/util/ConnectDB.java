package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {
    private static final String URL = "jdbc:mysql://localhost:3306/cs_property_management"; // Tên cơ sở dữ liệu
    private static final String USER = "root"; // Mặc định của mysql
    private static final String PASS = "123456"; // Mật khẩu mysql của bạn

    // Mở kết nối
    public static Connection getConnectDB() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USER, PASS);
        } catch (ClassNotFoundException e) {
            System.out.println("Không tìm thấy driver MySQL!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Kết nối database thất bại!");
            e.printStackTrace();
        }
        return connection;
    }

    public static void closeConnectDB(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
