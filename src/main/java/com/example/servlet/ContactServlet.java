package com.example.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContactServlet extends HttpServlet {
    
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
            // Success message
            request.setAttribute("success", 
                "Cảm ơn bạn đã liên hệ! Tin nhắn của bạn đã được gửi thành công. " +
                "Tôi sẽ phản hồi qua email trong thời gian sớm nhất.");
            
            // Log to console (for development purposes)
            System.out.println("=== CONTACT FORM SUBMISSION ===");
            System.out.println("Name: " + name);
            System.out.println("Email: " + email);
            System.out.println("Subject: " + (subject != null ? subject : "No subject"));
            System.out.println("Message: " + message);
            System.out.println("================================");
        }
        
        request.setAttribute("pageTitle", "Liên hệ - Website cá nhân");
        request.setAttribute("currentPage", "contact");
        
        request.getRequestDispatcher("/WEB-INF/views/contact.jsp").forward(request, response);
    }
}