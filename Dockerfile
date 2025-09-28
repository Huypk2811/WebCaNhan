# Sử dụng OpenJDK 11 với Tomcat
FROM tomcat:9-jdk11-openjdk

# Thông tin tác giả
LABEL maintainer="Vương Đức Huy <huypk2811@gmail.com>"

# Xóa các ứng dụng mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR vào webapps của Tomcat
COPY target/personal-website.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Khởi động Tomcat
CMD ["catalina.sh", "run"]