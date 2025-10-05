package com.example.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HomeServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Set attributes for the home page
        request.setAttribute("pageTitle", "Trang chủ - Website cá nhân");
        request.setAttribute("currentPage", "home");
        
        // Forward to home.jsp
        request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
    }
    
    @Override
    protected void doHead(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Xử lý HEAD request để tránh warning trong logs
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.setStatus(HttpServletResponse.SC_OK);
        // Không gửi body cho HEAD request
    }
}