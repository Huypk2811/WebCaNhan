package com.example.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/health")
public class HealthCheckServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        PrintWriter out = response.getWriter();
        out.println("{");
        out.println("  \"status\": \"UP\",");
        out.println("  \"application\": \"Personal Website\",");
        out.println("  \"version\": \"1.0.0\",");
        out.println("  \"timestamp\": \"" + new java.util.Date() + "\"");
        out.println("}");
        
        response.setStatus(HttpServletResponse.SC_OK);
    }
    
    @Override
    protected void doHead(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Xử lý HEAD request để tránh warning trong logs
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_OK);
        // Không gửi body cho HEAD request
    }
}