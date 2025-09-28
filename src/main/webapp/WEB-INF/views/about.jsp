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
        <!-- Header Section -->
        <section class="page-header bg-primary text-white">
            <div class="container">
                <div class="row align-items-center py-5">
                    <div class="col-lg-12 text-center">
                        <h1 class="display-4 fw-bold mb-3">
                            <i class="fas fa-user"></i> Giới thiệu về tôi
                        </h1>
                    </div>
                </div>
            </div>
        </section>

        <!-- About Content -->
        <section class="py-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 mb-5">
                        <div class="text-center">
                            <img src="${pageContext.request.contextPath}/images/profile-large.jpg" alt="Profile" 
                                 class="img-fluid rounded-circle shadow-lg mb-4" style="max-width: 300px;">
                            <h3 class="fw-bold">Vương Đức Huy</h3>
                            <p class="text-muted mb-2">Sinh viên Kỹ Thuật Dữ liệu</p>
                            <p class="text-muted mb-3"><strong>MSSV:</strong> 23133029</p>
                            <div class="social-links">
                                <a href="https://www.instagram.com/harry_281105/" class="btn btn-outline-primary me-2 mb-2" target="_blank">
                                    <i class="fab fa-instagram"></i> Instagram
                                </a>
                                <a href="https://www.facebook.com/huy.vuong.903642" class="btn btn-outline-info me-2 mb-2" target="_blank">
                                    <i class="fab fa-facebook"></i> Facebook
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="mb-5">
                            <h2 class="fw-bold mb-4">Về tôi</h2>
                            <p class="lead mb-4">
                                Xin chào! Tôi là Vương Đức Huy, sinh viên năm ba ngành Kỹ Thuật dữ liệu với MSSV 23133029. 
                                Hiện đang học tại trường Đại học Sư Phạm Kỹ Thuật thành phố Hồ Chí Minh.
                            </p>

                        </div>

                        <!-- Programming Languages -->
                        <div class="mb-5">
                            <h3 class="fw-bold mb-4">Ngôn ngữ lập trình đã học</h3>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <div class="d-flex align-items-center">
                                        <i class="fab fa-python fa-2x text-primary me-3"></i>
                                        <span class="fw-medium">Python</span>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <div class="d-flex align-items-center">
                                        <i class="fab fa-java fa-2x text-danger me-3"></i>
                                        <span class="fw-medium">Java</span>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <div class="d-flex align-items-center">
                                        <i class="fab fa-microsoft fa-2x text-info me-3"></i>
                                        <span class="fw-medium">C#</span>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <div class="d-flex align-items-center">
                                        <i class="fas fa-database fa-2x text-warning me-3"></i>
                                        <span class="fw-medium">SQL</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Education & Certifications -->
        <section class="py-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 mb-4">
                        <h3 class="fw-bold mb-4">
                            <i class="fas fa-graduation-cap text-primary"></i> Học vấn
                        </h3>
                        <div class="card h-100">
                            <div class="card-body">
                                <h5 class="card-title">Kỹ Thuật dữ liệu</h5>
                                <p class="text-muted mb-2">Đại học Sư Phạm Kỹ Thuật TP.HCM | 2023 - 2027</p>
                                <p class="card-text">
                                    Hiện đang là sinh viên năm ba<br>
                                    Chuyên về phân tích và xử lý dữ liệu<br>
                                    Tham gia học tập và làm các dự án môn học ở trường Đại học Sư Phạm Kỹ Thuật
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 mb-4">
                        <h3 class="fw-bold mb-4">
                            <i class="fas fa-certificate text-warning"></i> Chứng chỉ
                        </h3>
                        <div class="card h-100">
                            <div class="card-body">
                                <ul class="list-unstyled">
                                    <li class="mb-2">
                                        <i class="fas fa-check-circle text-success"></i>
                                        IELTS 5.5
                                    </li>
                                </ul>
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
                <div class="col-md-12 text-center">
                    <p class="mb-0">Liên hệ: huypk2811@gmail.com | SDT: 0925280168</p>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/script.js"></script>
</body>
</html>