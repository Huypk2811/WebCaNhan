# Multi-stage build
# Stage 1: Build với Maven
FROM maven:3.8.6-openjdk-11 AS build

# Set working directory
WORKDIR /app

# Copy pom.xml và source code
COPY pom.xml .
COPY src ./src

# Build project và tạo WAR file
RUN mvn clean package -DskipTests

# Stage 2: Runtime với Tomcat
FROM tomcat:9-jdk11-openjdk

# Thông tin tác giả
LABEL maintainer="Vương Đức Huy <huypk2811@gmail.com>"

# Xóa các ứng dụng mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR từ build stage
COPY --from=build /app/target/personal-website.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Khởi động Tomcat
CMD ["catalina.sh", "run"]