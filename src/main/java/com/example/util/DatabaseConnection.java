package com.example.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    // Thông tin kết nối database từ environment variables hoặc default values
    private static final String DB_HOST = System.getenv("DB_HOST") != null ? System.getenv("DB_HOST") : "localhost";
    private static final String DB_PORT = System.getenv("DB_PORT") != null ? System.getenv("DB_PORT") : "1433";
    private static final String DB_NAME = System.getenv("DB_NAME") != null ? System.getenv("DB_NAME") : "PersonalWebsite";
    private static final String USERNAME = System.getenv("DB_USERNAME") != null ? System.getenv("DB_USERNAME") : "sa";
    private static final String PASSWORD = System.getenv("DB_PASSWORD") != null ? System.getenv("DB_PASSWORD") : "123456";
    
    private static final String URL = String.format(
        "jdbc:sqlserver://%s:%s;databaseName=%s;encrypt=false;trustServerCertificate=true;loginTimeout=30",
        DB_HOST, DB_PORT, DB_NAME
    );
    
    // Static block để load driver
    static {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            System.out.println("SQL Server JDBC Driver loaded successfully!");
            System.out.println("Database URL: " + URL);
        } catch (ClassNotFoundException e) {
            System.err.println("SQL Server JDBC Driver not found!");
            e.printStackTrace();
        }
    }
    
    /**
     * Tạo kết nối đến database
     * @return Connection object
     * @throws SQLException nếu không thể kết nối
     */
    public static Connection getConnection() throws SQLException {
        try {
            Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            System.out.println("Connected to SQL Server successfully!");
            return connection;
        } catch (SQLException e) {
            System.err.println("Failed to connect to SQL Server!");
            System.err.println("Error: " + e.getMessage());
            System.err.println("Database URL: " + URL);
            System.err.println("Username: " + USERNAME);
            throw e;
        }
    }
    
    /**
     * Đóng kết nối database
     * @param connection Connection cần đóng
     */
    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("Database connection closed.");
            } catch (SQLException e) {
                System.err.println("Error closing connection: " + e.getMessage());
            }
        }
    }
    
    /**
     * Test kết nối database
     * @return true nếu kết nối thành công, false nếu thất bại
     */
    public static boolean testConnection() {
        try (Connection connection = getConnection()) {
            return connection != null && !connection.isClosed();
        } catch (SQLException e) {
            System.err.println("Database connection test failed: " + e.getMessage());
            return false;
        }
    }
}