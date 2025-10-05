package com.example.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HeadRequestFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("HeadRequestFilter initialized");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        String method = httpRequest.getMethod();
        String uri = httpRequest.getRequestURI();
        
        // Log để debug
        System.out.println("HeadRequestFilter: Method=" + method + ", URI=" + uri);
        
        // Xử lý HEAD requests để tránh warnings trong logs
        if ("HEAD".equalsIgnoreCase(method)) {
            System.out.println("HeadRequestFilter: Handling HEAD request for " + uri);
            
            // Đối với HEAD request, chỉ trả về headers, không có body
            httpResponse.setStatus(HttpServletResponse.SC_OK);
            httpResponse.setContentType("text/html");
            httpResponse.setCharacterEncoding("UTF-8");
            httpResponse.setHeader("Content-Length", "0");
            
            return; // Không tiếp tục filter chain
        }
        
        // Tiếp tục với các request khác
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        System.out.println("HeadRequestFilter destroyed");
    }
}