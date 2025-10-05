# Multi-stage build for Java Web Application
# Stage 1: Build with Maven
FROM maven:3.9.4-eclipse-temurin-11 AS build

# Set working directory
WORKDIR /app

# Copy pom.xml first for better layer caching
COPY pom.xml .

# Download dependencies (this layer will be cached if pom.xml doesn't change)
RUN mvn dependency:resolve

# Copy source code
COPY src ./src

# Build project and create WAR file
RUN mvn clean package -DskipTests

# Stage 2: Runtime with Tomcat
FROM tomcat:9.0.82-jdk11-temurin

# Thông tin tác giả
LABEL maintainer="Vương Đức Huy <huypk2811@gmail.com>"
LABEL description="Personal Website - Java Servlet Application"

# Set environment variables for database connection
ENV DB_HOST=localhost
ENV DB_PORT=1433
ENV DB_NAME=PersonalWebsite
ENV DB_USERNAME=sa
ENV DB_PASSWORD=123456

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file from build stage
COPY --from=build /app/target/personal-website.war /usr/local/tomcat/webapps/ROOT.war

# Copy custom tomcat configuration
COPY tomcat.properties /usr/local/tomcat/conf/

# Create logs directory
RUN mkdir -p /usr/local/tomcat/logs

# Set proper permissions
RUN chmod +x /usr/local/tomcat/bin/catalina.sh

# Expose port for Render
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]