<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pageTitle}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                <i class="fas fa-user-circle"></i> Website Cá Nhân
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link ${currentPage == 'home' ? 'active' : ''}" href="${pageContext.request.contextPath}/">
                            <i class="fas fa-home"></i> Trang chủ
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link ${currentPage == 'about' ? 'active' : ''}" href="${pageContext.request.contextPath}/about">
                            <i class="fas fa-user"></i> Giới thiệu
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link ${currentPage == 'portfolio' ? 'active' : ''}" href="${pageContext.request.contextPath}/portfolio">
                            <i class="fas fa-briefcase"></i> Dự án
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link ${currentPage == 'blog' ? 'active' : ''}" href="${pageContext.request.contextPath}/blog">
                            <i class="fas fa-blog"></i> Blog
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link ${currentPage == 'contact' ? 'active' : ''}" href="${pageContext.request.contextPath}/contact">
                            <i class="fas fa-envelope"></i> Liên hệ
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <main class="main-content">
        <!-- Header Section -->
        <section class="page-header bg-primary text-white">
            <div class="container">
                <div class="row align-items-center py-5">
                    <div class="col-lg-12 text-center">
                        <h1 class="display-4 fw-bold mb-3">
                            <i class="fas fa-blog"></i> Blog cá nhân
                        </h1>
                        <p class="lead">Chia sẻ kiến thức và kinh nghiệm lập trình</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Blog Posts -->
        <section class="py-5">
            <div class="container">
                <div class="row">
                    <!-- Main Content -->
                    <div class="col-lg-8">
                        <!-- Blog Posts List -->
                        <c:forEach items="${posts}" var="post" varStatus="status">
                            <article class="blog-post mb-5">
                                <div class="card shadow-sm">
                                    <div class="card-body p-4">
                                        <div class="d-flex justify-content-between align-items-start mb-3">
                                            <div class="blog-meta">
                                                <small class="text-muted">
                                                    <i class="fas fa-calendar"></i> 
                                                    <fmt:formatDate value="${post.date}" pattern="dd/MM/yyyy"/>
                                                </small>
                                                <small class="text-muted ms-3">
                                                    <i class="fas fa-user"></i> ${post.author}
                                                </small>
                                                <small class="text-muted ms-3">
                                                    <i class="fas fa-eye"></i> 1,234 lượt xem
                                                </small>
                                            </div>
                                        </div>
                                        
                                        <h2 class="card-title fw-bold mb-3">
                                            <a href="#" class="text-decoration-none text-dark">
                                                ${post.title}
                                            </a>
                                        </h2>
                                        
                                        <p class="card-text text-muted mb-3">
                                            ${post.excerpt}
                                        </p>
                                        
                                        <!-- Tags -->
                                        <div class="blog-tags mb-3">
                                            <c:forEach items="${post.tags}" var="tag">
                                                <span class="badge bg-secondary me-1">
                                                    <i class="fas fa-tag"></i> ${tag}
                                                </span>
                                            </c:forEach>
                                        </div>
                                        
                                        <div class="d-flex justify-content-between align-items-center">
                                            <a href="#" class="btn btn-primary">
                                                <i class="fas fa-arrow-right"></i> Đọc tiếp
                                            </a>
                                            <div class="blog-actions">
                                                <button class="btn btn-outline-danger btn-sm me-2">
                                                    <i class="fas fa-heart"></i> 45
                                                </button>
                                                <button class="btn btn-outline-primary btn-sm me-2">
                                                    <i class="fas fa-comment"></i> 12
                                                </button>
                                                <button class="btn btn-outline-success btn-sm">
                                                    <i class="fas fa-share"></i> Chia sẻ
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                        </c:forEach>

                        <!-- Featured Post -->
                        <article class="blog-post mb-5">
                            <div class="card shadow-sm border-warning">
                                <div class="card-header bg-warning">
                                    <h6 class="mb-0 fw-bold">
                                        <i class="fas fa-star"></i> Bài viết nổi bật
                                    </h6>
                                </div>
                                <div class="card-body p-4">
                                    <div class="row">
                                        <div class="col-md-4 mb-3">
                                            <img src="/images/featured-post.jpg" class="img-fluid rounded" alt="Featured Post">
                                        </div>
                                        <div class="col-md-8">
                                            <div class="blog-meta mb-2">
                                                <small class="text-muted">
                                                    <i class="fas fa-calendar"></i> 01/12/2024
                                                </small>
                                                <small class="text-muted ms-3">
                                                    <i class="fas fa-user"></i> Admin
                                                </small>
                                                <small class="text-muted ms-3">
                                                    <i class="fas fa-fire text-danger"></i> Hot
                                                </small>
                                            </div>
                                            
                                            <h3 class="fw-bold mb-3">
                                                <a href="#" class="text-decoration-none text-dark">
                                                    Microservices vs Monolithic: Lựa chọn nào phù hợp?
                                                </a>
                                            </h3>
                                            
                                            <p class="text-muted mb-3">
                                                So sánh chi tiết giữa kiến trúc Microservices và Monolithic, 
                                                ưu nhược điểm của từng loại và cách lựa chọn phù hợp với dự án của bạn.
                                            </p>
                                            
                                            <div class="blog-tags mb-3">
                                                <span class="badge bg-primary me-1">
                                                    <i class="fas fa-tag"></i> Architecture
                                                </span>
                                                <span class="badge bg-success me-1">
                                                    <i class="fas fa-tag"></i> Microservices
                                                </span>
                                                <span class="badge bg-info me-1">
                                                    <i class="fas fa-tag"></i> Best Practices
                                                </span>
                                            </div>
                                            
                                            <a href="#" class="btn btn-warning">
                                                <i class="fas fa-arrow-right"></i> Đọc ngay
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </article>

                        <!-- Pagination -->
                        <nav aria-label="Blog pagination">
                            <ul class="pagination justify-content-center">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#" tabindex="-1">
                                        <i class="fas fa-chevron-left"></i> Trước
                                    </a>
                                </li>
                                <li class="page-item active">
                                    <a class="page-link" href="#">1</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">2</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">3</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">
                                        Sau <i class="fas fa-chevron-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>

                    <!-- Sidebar -->
                    <div class="col-lg-4">
                        <div class="blog-sidebar">
                            <!-- Search -->
                            <div class="card shadow-sm mb-4">
                                <div class="card-header">
                                    <h6 class="mb-0 fw-bold">
                                        <i class="fas fa-search"></i> Tìm kiếm
                                    </h6>
                                </div>
                                <div class="card-body">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Nhập từ khóa...">
                                        <button class="btn btn-outline-primary" type="button">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <!-- Categories -->
                            <div class="card shadow-sm mb-4">
                                <div class="card-header">
                                    <h6 class="mb-0 fw-bold">
                                        <i class="fas fa-folder"></i> Danh mục
                                    </h6>
                                </div>
                                <div class="card-body">
                                    <ul class="list-unstyled mb-0">
                                        <li class="mb-2">
                                            <a href="#" class="text-decoration-none d-flex justify-content-between">
                                                <span>Java Programming</span>
                                                <span class="badge bg-primary">8</span>
                                            </a>
                                        </li>
                                        <li class="mb-2">
                                            <a href="#" class="text-decoration-none d-flex justify-content-between">
                                                <span>Web Development</span>
                                                <span class="badge bg-success">6</span>
                                            </a>
                                        </li>
                                        <li class="mb-2">
                                            <a href="#" class="text-decoration-none d-flex justify-content-between">
                                                <span>Database</span>
                                                <span class="badge bg-info">4</span>
                                            </a>
                                        </li>
                                        <li class="mb-2">
                                            <a href="#" class="text-decoration-none d-flex justify-content-between">
                                                <span>DevOps</span>
                                                <span class="badge bg-warning">3</span>
                                            </a>
                                        </li>
                                        <li class="mb-0">
                                            <a href="#" class="text-decoration-none d-flex justify-content-between">
                                                <span>Career Tips</span>
                                                <span class="badge bg-secondary">2</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <!-- Recent Posts -->
                            <div class="card shadow-sm mb-4">
                                <div class="card-header">
                                    <h6 class="mb-0 fw-bold">
                                        <i class="fas fa-clock"></i> Bài viết gần đây
                                    </h6>
                                </div>
                                <div class="card-body">
                                    <div class="recent-post d-flex mb-3">
                                        <img src="/images/recent1.jpg" class="recent-post-img me-3" alt="">
                                        <div>
                                            <h6 class="mb-1">
                                                <a href="#" class="text-decoration-none">
                                                    Docker Best Practices
                                                </a>
                                            </h6>
                                            <small class="text-muted">28/11/2024</small>
                                        </div>
                                    </div>
                                    <div class="recent-post d-flex mb-3">
                                        <img src="/images/recent2.jpg" class="recent-post-img me-3" alt="">
                                        <div>
                                            <h6 class="mb-1">
                                                <a href="#" class="text-decoration-none">
                                                    Spring Security Fundamentals
                                                </a>
                                            </h6>
                                            <small class="text-muted">25/11/2024</small>
                                        </div>
                                    </div>
                                    <div class="recent-post d-flex mb-0">
                                        <img src="/images/recent3.jpg" class="recent-post-img me-3" alt="">
                                        <div>
                                            <h6 class="mb-1">
                                                <a href="#" class="text-decoration-none">
                                                    Clean Code Principles
                                                </a>
                                            </h6>
                                            <small class="text-muted">22/11/2024</small>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Popular Tags -->
                            <div class="card shadow-sm mb-4">
                                <div class="card-header">
                                    <h6 class="mb-0 fw-bold">
                                        <i class="fas fa-tags"></i> Tags phổ biến
                                    </h6>
                                </div>
                                <div class="card-body">
                                    <div class="tag-cloud">
                                        <a href="#" class="badge bg-primary me-1 mb-2 text-decoration-none">Java</a>
                                        <a href="#" class="badge bg-success me-1 mb-2 text-decoration-none">Spring Boot</a>
                                        <a href="#" class="badge bg-info me-1 mb-2 text-decoration-none">JavaScript</a>
                                        <a href="#" class="badge bg-warning me-1 mb-2 text-decoration-none">React</a>
                                        <a href="#" class="badge bg-danger me-1 mb-2 text-decoration-none">MySQL</a>
                                        <a href="#" class="badge bg-secondary me-1 mb-2 text-decoration-none">Docker</a>
                                        <a href="#" class="badge bg-dark me-1 mb-2 text-decoration-none">AWS</a>
                                        <a href="#" class="badge bg-primary me-1 mb-2 text-decoration-none">API</a>
                                        <a href="#" class="badge bg-success me-1 mb-2 text-decoration-none">REST</a>
                                        <a href="#" class="badge bg-info me-1 mb-2 text-decoration-none">Microservices</a>
                                    </div>
                                </div>
                            </div>

                            <!-- Newsletter -->
                            <div class="card shadow-sm">
                                <div class="card-header bg-primary text-white">
                                    <h6 class="mb-0 fw-bold">
                                        <i class="fas fa-envelope"></i> Đăng ký nhận thông báo
                                    </h6>
                                </div>
                                <div class="card-body">
                                    <p class="small text-muted mb-3">
                                        Nhận thông báo về các bài viết mới nhất qua email.
                                    </p>
                                    <form>
                                        <div class="mb-3">
                                            <input type="email" class="form-control" placeholder="Email của bạn">
                                        </div>
                                        <button type="submit" class="btn btn-primary w-100">
                                            <i class="fas fa-paper-plane"></i> Đăng ký
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer class="bg-dark text-white py-4">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <p class="mb-0">&copy; 2024 Website Cá Nhân. All rights reserved.</p>
                </div>
                <div class="col-md-6 text-end">
                    <p class="mb-0">Được xây dựng với <i class="fas fa-heart text-danger"></i> bằng Java Servlet</p>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/script.js"></script>
</body>
</html>