package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.example.model.Contact;
import com.example.util.DatabaseConnection;

public class ContactDAO {
    
    /**
     * Lưu thông tin liên hệ vào database
     * @param contact Contact object cần lưu
     * @return true nếu lưu thành công, false nếu thất bại
     */
    public boolean saveContact(Contact contact) {
        String sql = "INSERT INTO contacts (name, email, subject, message, created_date) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            statement.setString(1, contact.getName());
            statement.setString(2, contact.getEmail());
            statement.setString(3, contact.getSubject());
            statement.setString(4, contact.getMessage());
            statement.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            
            int rowsAffected = statement.executeUpdate();
            
            if (rowsAffected > 0) {
                System.out.println("Contact saved successfully: " + contact.getName());
                return true;
            }
            
        } catch (SQLException e) {
            System.err.println("Error saving contact: " + e.getMessage());
            e.printStackTrace();
        }
        
        return false;
    }
    
    /**
     * Lấy tất cả contacts từ database
     * @return List of Contact objects
     */
    public List<Contact> getAllContacts() {
        List<Contact> contacts = new ArrayList<>();
        String sql = "SELECT id, name, email, subject, message, created_date, is_read, reply_sent FROM contacts ORDER BY created_date DESC";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            
            while (resultSet.next()) {
                Contact contact = new Contact();
                contact.setId(resultSet.getInt("id"));
                contact.setName(resultSet.getString("name"));
                contact.setEmail(resultSet.getString("email"));
                contact.setSubject(resultSet.getString("subject"));
                contact.setMessage(resultSet.getString("message"));
                contact.setCreatedDate(resultSet.getTimestamp("created_date"));
                contact.setRead(resultSet.getBoolean("is_read"));
                contact.setReplySent(resultSet.getBoolean("reply_sent"));
                
                contacts.add(contact);
            }
            
        } catch (SQLException e) {
            System.err.println("Error getting contacts: " + e.getMessage());
            e.printStackTrace();
        }
        
        return contacts;
    }
    
    /**
     * Đánh dấu contact đã đọc
     * @param contactId ID của contact
     * @return true nếu thành công
     */
    public boolean markAsRead(int contactId) {
        String sql = "UPDATE contacts SET is_read = 1 WHERE id = ?";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            statement.setInt(1, contactId);
            int rowsAffected = statement.executeUpdate();
            
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.err.println("Error marking contact as read: " + e.getMessage());
            e.printStackTrace();
        }
        
        return false;
    }
    
    /**
     * Đếm số lượng contacts chưa đọc
     * @return số lượng contacts chưa đọc
     */
    public int getUnreadCount() {
        String sql = "SELECT COUNT(*) as count FROM contacts WHERE is_read = 0";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            
            if (resultSet.next()) {
                return resultSet.getInt("count");
            }
            
        } catch (SQLException e) {
            System.err.println("Error getting unread count: " + e.getMessage());
            e.printStackTrace();
        }
        
        return 0;
    }
}