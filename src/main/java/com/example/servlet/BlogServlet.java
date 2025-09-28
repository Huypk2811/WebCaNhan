package com.example.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BlogServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Create sample blog posts
        List<Map<String, Object>> posts = new ArrayList<>();
        
        Map<String, Object> post1 = new HashMap<>();
        post1.put("id", 1);
        post1.put("title", "Hướng dẫn Java Servlet cho người mới bắt đầu");
        post1.put("excerpt", "Servlet là một trong những công nghệ cơ bản trong Java web development. Bài viết này sẽ hướng dẫn các bạn từ cơ bản đến nâng cao.");
        post1.put("date", LocalDate.of(2024, 12, 15));
        post1.put("author", "Admin");
        post1.put("tags", new String[]{"Java", "Servlet", "Web Development"});
        posts.add(post1);
        
        Map<String, Object> post2 = new HashMap<>();
        post2.put("id", 2);
        post2.put("title", "Xây dựng REST API với Java");
        post2.put("excerpt", "REST API là kiến trúc phổ biến nhất hiện nay. Cùng tìm hiểu cách xây dựng REST API hiệu quả với Java.");
        post2.put("date", LocalDate.of(2024, 12, 10));
        post2.put("author", "Admin");
        post2.put("tags", new String[]{"Java", "REST API", "Backend"});
        posts.add(post2);
        
        Map<String, Object> post3 = new HashMap<>();
        post3.put("id", 3);
        post3.put("title", "Tối ưu hóa hiệu suất ứng dụng Java");
        post3.put("excerpt", "Những kỹ thuật và best practices để tối ưu hóa hiệu suất ứng dụng Java trong môi trường production.");
        post3.put("date", LocalDate.of(2024, 12, 5));
        post3.put("author", "Admin");
        post3.put("tags", new String[]{"Java", "Performance", "Optimization"});
        posts.add(post3);
        
        request.setAttribute("pageTitle", "Blog - Website cá nhân");
        request.setAttribute("currentPage", "blog");
        request.setAttribute("posts", posts);
        request.setAttribute("dateFormatter", DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        
        request.getRequestDispatcher("/WEB-INF/views/blog.jsp").forward(request, response);
    }
}