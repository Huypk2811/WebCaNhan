package com.example.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HeadRequestFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        // Handle HEAD requests silently
        if ("HEAD".equals(httpRequest.getMethod())) {
            httpResponse.setStatus(HttpServletResponse.SC_OK);
            httpResponse.setContentType("text/html;charset=UTF-8");
            return; // Don't continue the filter chain
        }
        
        // Continue with normal processing for other methods
        chain.doFilter(request, response);
    }
}