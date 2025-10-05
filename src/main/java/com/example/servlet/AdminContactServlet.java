package com.example.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.dao.ContactDAO;
import com.example.model.Contact;

@WebServlet("/admin/contacts")
public class AdminContactServlet extends HttpServlet {
    
    private ContactDAO contactDAO;
    
    @Override
    public void init() throws ServletException {
        super.init();
        this.contactDAO = new ContactDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get all contacts from database
        List<Contact> contacts = contactDAO.getAllContacts();
        int unreadCount = contactDAO.getUnreadCount();
        
        request.setAttribute("contacts", contacts);
        request.setAttribute("unreadCount", unreadCount);
        request.setAttribute("pageTitle", "Quản lý tin nhắn liên hệ");
        
        request.getRequestDispatcher("/WEB-INF/views/admin/contacts.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        String contactIdStr = request.getParameter("contactId");
        
        if ("markAsRead".equals(action) && contactIdStr != null) {
            try {
                int contactId = Integer.parseInt(contactIdStr);
                boolean success = contactDAO.markAsRead(contactId);
                
                if (success) {
                    request.setAttribute("success", "Đã đánh dấu tin nhắn là đã đọc.");
                } else {
                    request.setAttribute("error", "Có lỗi khi cập nhật trạng thái tin nhắn.");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "ID tin nhắn không hợp lệ.");
            }
        }
        
        // Redirect to GET to refresh the page
        response.sendRedirect(request.getContextPath() + "/admin/contacts");
    }
}