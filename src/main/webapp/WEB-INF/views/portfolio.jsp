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
                            <i class="fas fa-book"></i> Bài tập của tôi
                        </h1>
                    </div>
                </div>
            </div>
        </section>

        <!-- Portfolio Grid -->
        <section class="py-5">
            <div class="container">
                <!-- Projects Grid -->
                <div class="row">
                    <c:choose>
                        <c:when test="${empty projects}">
                            <div class="col-12 text-center py-5">
                                <div class="empty-state">
                                    <i class="fas fa-folder-open fa-5x text-muted mb-4"></i>
                                    <h3 class="text-muted">Chưa có bài tập nào</h3>
                                    <p class="text-muted">Các bài tập sẽ được cập nhật trong thời gian tới</p>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${projects}" var="project" varStatus="status">
                        <div class="col-lg-4 col-md-6 mb-4 portfolio-item web">
                            <c:choose>
                                <c:when test="${not empty project.demoLink}">
                                    <a href="${project.demoLink}" target="_blank" class="text-decoration-none">
                                </c:when>
                                <c:when test="${not empty project.sourceLink}">
                                    <a href="${project.sourceLink}" target="_blank" class="text-decoration-none">
                                </c:when>
                                <c:otherwise>
                                    <div>
                                </c:otherwise>
                            </c:choose>
                            <div class="card project-card h-100 shadow-sm" style="transition: transform 0.2s; cursor: pointer;">
                                <div class="card-body">
                                    <h5 class="card-title fw-bold">${project.title}</h5>
                                    <div class="d-flex justify-content-end">
                                        <c:if test="${not empty project.sourceLink}">
                                            <i class="fab fa-github fa-lg text-muted me-2"></i>
                                        </c:if>
                                        <c:if test="${not empty project.demoLink}">
                                            <i class="fas fa-external-link-alt text-primary"></i>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <c:choose>
                                <c:when test="${not empty project.demoLink or not empty project.sourceLink}">
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </c:forEach>
                        </c:otherwise>
                    </c:choose>
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