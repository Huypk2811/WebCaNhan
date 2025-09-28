<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pageTitle}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
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
                            <i class="fas fa-book"></i> Bài tập
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
        <!-- Hero Section -->
        <section class="hero-section bg-primary text-white">
            <div class="container">
                <div class="row align-items-center min-vh-100">
                    <div class="col-lg-6">
                        <h1 class="display-4 fw-bold mb-4">
                            Xin chào! Tôi là <span class="text-warning">Vương Đức Huy</span>
                        </h1>
                        <h2 class="h4 mb-4">Sinh viên Kỹ Thuật Dữ liệu</h2>
                        <p class="lead mb-3">
                            <strong>MSSV:</strong> <span class="text-warning">23133029</span>
                        </p>
                        <p class="lead mb-4">
                            Tôi là sinh viên năm ba ngành Kỹ Thuật dữ liệu. Hiện đang học tại trường Đại học Sư Phạm Kỹ Thuật thành phố Hồ Chí Minh.
                        </p>
                        <div class="mb-4">
                            <a href="${pageContext.request.contextPath}/portfolio" class="btn btn-warning btn-lg me-3">
                                <i class="fas fa-eye"></i> Xem bài tập
                            </a>
                            <a href="${pageContext.request.contextPath}/contact" class="btn btn-outline-light btn-lg">
                                <i class="fas fa-envelope"></i> Liên hệ
                            </a>
                        </div>
                        <div class="social-links">
                            <a href="https://www.facebook.com/huy.vuong.903642" target="_blank" class="text-white me-3"><i class="fab fa-facebook fa-2x"></i></a>
                            <a href="https://www.instagram.com/harry_281105/" target="_blank" class="text-white me-3"><i class="fab fa-instagram fa-2x"></i></a>
                            <a href="mailto:huypk2811@gmail.com" class="text-white"><i class="fas fa-envelope fa-2x"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-6 text-center">
                        <img src="${pageContext.request.contextPath}/images/profile.jpg" alt="Profile" class="img-fluid rounded-circle shadow-lg" 
                             style="max-width: 400px; width: 100%;">
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer class="bg-dark text-white py-4">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <p class="mb-0">Liên hệ: huypk2811@gmail.com | SDT: 0925280168</p>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>