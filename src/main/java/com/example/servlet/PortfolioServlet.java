package com.example.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PortfolioServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Create assignments list
        List<Map<String, String>> projects = new ArrayList<>();
        
        Map<String, String> assignment1 = new HashMap<>();
        assignment1.put("title", "Bài tập 1");
        assignment1.put("demoLink", "https://nhom6ltw.odoo.com/");
        assignment1.put("sourceLink", "");
        projects.add(assignment1);
        
        Map<String, String> assignment2 = new HashMap<>();
        assignment2.put("title", "Bài tập 2");
        assignment2.put("demoLink", "");
        assignment2.put("sourceLink", "https://github.com/Huypk2811/New_web_project");
        projects.add(assignment2);
        
        Map<String, String> assignment3 = new HashMap<>();
        assignment3.put("title", "Bài tập 3");
        assignment3.put("demoLink", "");
        assignment3.put("sourceLink", "https://github.com/Huypk2811/survey-app");
        projects.add(assignment3);
        
        Map<String, String> assignment61 = new HashMap<>();
        assignment61.put("title", "Bài tập 6.1");
        assignment61.put("demoLink", "https://ch6-01web.onrender.com");
        assignment61.put("sourceLink", "");
        projects.add(assignment61);
        
        Map<String, String> assignment62 = new HashMap<>();
        assignment62.put("title", "Bài tập 6.2");
        assignment62.put("demoLink", "https://vuongduchuych6-02web.onrender.com");
        assignment62.put("sourceLink", "");
        projects.add(assignment62);
        
        Map<String, String> assignment8 = new HashMap<>();
        assignment8.put("title", "Bài tập 8");
        assignment8.put("demoLink", "https://vuongduchuych08web.onrender.com/");
        assignment8.put("sourceLink", "");
        projects.add(assignment8);
        
        Map<String, String> assignment14 = new HashMap<>();
        assignment14.put("title", "Bài tập 14");
        assignment14.put("demoLink", "https://ch14-web.onrender.com");
        assignment14.put("sourceLink", "");
        projects.add(assignment14);
        
        request.setAttribute("pageTitle", "Bài tập - Website cá nhân");
        request.setAttribute("currentPage", "portfolio");
        request.setAttribute("projects", projects);
        
        request.getRequestDispatcher("/WEB-INF/views/portfolio.jsp").forward(request, response);
    }
}