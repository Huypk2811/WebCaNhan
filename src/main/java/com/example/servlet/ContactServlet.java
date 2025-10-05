package com.example.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.dao.ContactDAO;
import com.example.model.Contact;
import com.example.util.DatabaseConnection;

public class ContactServlet extends HttpServlet {
    
    private ContactDAO contactDAO;
    
    @Override
    public void init() throws ServletException {
        super.init();
        this.contactDAO = new ContactDAO();
        
        // Test database connection khi khởi động servlet
        if (DatabaseConnection.testConnection()) {
            System.out.println("ContactServlet: Database connection successful!");
        } else {
            System.err.println("ContactServlet: Database connection failed!");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setAttribute("pageTitle", "Liên hệ - Website cá nhân");
        request.setAttribute("currentPage", "contact");
        
        request.getRequestDispatcher("/WEB-INF/views/contact.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Set encoding for Vietnamese
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        // Get form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        
        // Simple validation
        if (name == null || name.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            message == null || message.trim().isEmpty()) {
            
            request.setAttribute("error", "Vui lòng điền đầy đủ thông tin bắt buộc.");
            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("subject", subject);
            request.setAttribute("message", message);
        } else {
            // Tạo đối tượng Contact và lưu vào database
            Contact contact = new Contact(name.trim(), email.trim(), 
                                        subject != null ? subject.trim() : "", 
                                        message.trim());
            
            try {
                boolean saved = contactDAO.saveContact(contact);
                
                if (saved) {
                    request.setAttribute("success", 
                        "Cảm ơn bạn đã liên hệ! Tin nhắn của bạn đã được gửi thành công. " +
                        "Tôi sẽ phản hồi qua email trong thời gian sớm nhất.");
                    
                    // Clear form data sau khi gửi thành công
                    request.removeAttribute("name");
                    request.removeAttribute("email");
                    request.removeAttribute("subject");
                    request.removeAttribute("message");
                    
                    System.out.println("New contact saved: " + name + " (" + email + ")");
                } else {
                    request.setAttribute("error", 
                        "Có lỗi xảy ra khi gửi tin nhắn. Vui lòng thử lại sau hoặc liên hệ trực tiếp qua email.");
                    
                    // Giữ lại dữ liệu form khi có lỗi
                    request.setAttribute("name", name);
                    request.setAttribute("email", email);
                    request.setAttribute("subject", subject);
                    request.setAttribute("message", message);
                }
                
            } catch (Exception e) {
                System.err.println("Error processing contact form: " + e.getMessage());
                e.printStackTrace();
                
                request.setAttribute("error", 
                    "Có lỗi kỹ thuật xảy ra. Vui lòng thử lại sau hoặc liên hệ trực tiếp qua email.");
                
                // Giữ lại dữ liệu form khi có lỗi
                request.setAttribute("name", name);
                request.setAttribute("email", email);
                request.setAttribute("subject", subject);
                request.setAttribute("message", message);
            }
        }
        
        request.setAttribute("pageTitle", "Liên hệ - Website cá nhân");
        request.setAttribute("currentPage", "contact");
        
        request.getRequestDispatcher("/WEB-INF/views/contact.jsp").forward(request, response);
    }
}