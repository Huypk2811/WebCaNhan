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
                            <i class="fas fa-envelope"></i> Liên hệ
                        </h1>
                    </div>
                </div>
            </div>
        </section>

        <!-- Contact Content -->
        <section class="py-5">
            <div class="container">
                <div class="row">
                    <!-- Contact Form -->
                    <div class="col-lg-8 mb-5">
                        <div class="card shadow-lg">
                            <div class="card-header bg-primary text-white">
                                <h3 class="mb-0">
                                    <i class="fas fa-paper-plane"></i> Gửi tin nhắn
                                </h3>
                            </div>
                            <div class="card-body p-4">
                                <!-- Success/Error Messages -->
                                <c:if test="${not empty success}">
                                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                                        <i class="fas fa-check-circle"></i> ${success}
                                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                                    </div>
                                </c:if>
                                
                                <c:if test="${not empty error}">
                                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                        <i class="fas fa-exclamation-circle"></i> ${error}
                                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                                    </div>
                                </c:if>

                                <form method="post" action="/contact" novalidate>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label for="name" class="form-label">
                                                Họ và tên <span class="text-danger">*</span>
                                            </label>
                                            <input type="text" class="form-control" id="name" name="name" 
                                                   value="${param.name}" required>
                                            <div class="invalid-feedback">
                                                Vui lòng nhập họ và tên của bạn.
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label for="email" class="form-label">
                                                Email <span class="text-danger">*</span>
                                            </label>
                                            <input type="email" class="form-control" id="email" name="email" 
                                                   value="${param.email}" required>
                                            <div class="invalid-feedback">
                                                Vui lòng nhập địa chỉ email hợp lệ.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="subject" class="form-label">Chủ đề</label>
                                        <input type="text" class="form-control" id="subject" name="subject" 
                                               value="${param.subject}" placeholder="Ví dụ: Hợp tác dự án, Tư vấn kỹ thuật...">
                                    </div>
                                    <div class="mb-4">
                                        <label for="message" class="form-label">
                                            Nội dung tin nhắn <span class="text-danger">*</span>
                                        </label>
                                        <textarea class="form-control" id="message" name="message" rows="6" 
                                                  required placeholder="Hãy mô tả chi tiết về dự án hoặc câu hỏi của bạn...">${param.message}</textarea>
                                        <div class="invalid-feedback">
                                            Vui lòng nhập nội dung tin nhắn.
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-lg">
                                        <i class="fas fa-paper-plane"></i> Gửi tin nhắn
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- Contact Info -->
                    <div class="col-lg-4">
                        <div class="contact-info">
                            <!-- Personal Info Card -->
                            <div class="card shadow-sm mb-4">
                                <div class="card-body text-center">
                                    <img src="${pageContext.request.contextPath}/images/profile.jpg" alt="Profile" 
                                         class="img-fluid rounded-circle mb-3" style="width: 100px; height: 100px; object-fit: cover;">
                                    <h5 class="fw-bold">Vương Đức Huy</h5>
                                    <p class="text-muted mb-3">Sinh viên Kỹ Thuật Dữ liệu</p>
                                    <p class="small mb-0">
                                        <i class="fas fa-clock text-primary"></i> 
                                        Thường phản hồi trong vòng 24 giờ
                                    </p>
                                </div>
                            </div>

                            <!-- Contact Details -->
                            <div class="card shadow-sm mb-4">
                                <div class="card-header bg-light">
                                    <h6 class="mb-0 fw-bold">
                                        <i class="fas fa-address-book text-primary"></i> Thông tin liên hệ
                                    </h6>
                                </div>
                                <div class="card-body">
                                    <ul class="list-unstyled mb-0">
                                        <li class="mb-3">
                                            <i class="fas fa-envelope text-primary me-2"></i>
                                            <strong>Email:</strong><br>
                                            <a href="mailto:huypk2811@gmail.com" class="text-decoration-none">
                                                huypk2811@gmail.com
                                            </a>
                                        </li>
                                        <li class="mb-3">
                                            <i class="fas fa-phone text-primary me-2"></i>
                                            <strong>Điện thoại:</strong><br>
                                            <a href="tel:+84925280168" class="text-decoration-none">
                                                (+84) 0925280168
                                            </a>
                                        </li>
                                        <li class="mb-3">
                                            <i class="fas fa-map-marker-alt text-primary me-2"></i>
                                            <strong>Địa chỉ:</strong><br>
                                            Thành phố Pleiku, tỉnh Gia Lai
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <!-- Social Links -->
                            <div class="card shadow-sm mb-4">
                                <div class="card-header bg-light">
                                    <h6 class="mb-0 fw-bold">
                                        <i class="fas fa-share-alt text-primary"></i> Kết nối với tôi
                                    </h6>
                                </div>
                                <div class="card-body">
                                    <div class="row text-center">
                                        <div class="col-6 mb-3">
                                            <a href="https://www.facebook.com/huy.vuong.903642" target="_blank" class="btn btn-outline-primary btn-sm w-100">
                                                <i class="fab fa-facebook"></i> Facebook
                                            </a>
                                        </div>
                                        <div class="col-6 mb-3">
                                            <a href="https://www.instagram.com/harry_281105/" target="_blank" class="btn btn-outline-danger btn-sm w-100">
                                                <i class="fab fa-instagram"></i> Instagram
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Programming Languages -->
                            <div class="card shadow-sm">
                                <div class="card-header bg-light">
                                    <h6 class="mb-0 fw-bold">
                                        <i class="fas fa-code text-primary"></i> Ngôn ngữ lập trình đã học
                                    </h6>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-6 mb-3">
                                            <div class="d-flex align-items-center">
                                                <i class="fab fa-python fa-2x text-primary me-2"></i>
                                                <span class="fw-bold">Python</span>
                                            </div>
                                        </div>
                                        <div class="col-6 mb-3">
                                            <div class="d-flex align-items-center">
                                                <i class="fab fa-java fa-2x text-danger me-2"></i>
                                                <span class="fw-bold">Java</span>
                                            </div>
                                        </div>
                                        <div class="col-6 mb-3">
                                            <div class="d-flex align-items-center">
                                                <i class="fab fa-microsoft fa-2x text-info me-2"></i>
                                                <span class="fw-bold">C#</span>
                                            </div>
                                        </div>
                                        <div class="col-6 mb-3">
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-database fa-2x text-warning me-2"></i>
                                                <span class="fw-bold">SQL</span>
                                            </div>
                                        </div>
                                    </div>
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
                <div class="col-md-12 text-center">
                    <p class="mb-0">Liên hệ: huypk2811@gmail.com | SDT: 0925280168</p>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/script.js"></script>
    
    <!-- Form Validation Script -->
    <script>
        // Bootstrap form validation
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                var forms = document.getElementsByClassName('needs-validation');
                var validation = Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
</body>
</html>