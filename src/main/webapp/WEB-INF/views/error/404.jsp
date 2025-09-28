<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lỗi 404 - Không tìm thấy trang</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>
    <div class="d-flex align-items-center justify-content-center min-vh-100">
        <div class="text-center">
            <div class="error-404 mb-4">
                <i class="fas fa-exclamation-triangle text-warning" style="font-size: 8rem;"></i>
            </div>
            <h1 class="display-1 fw-bold text-primary">404</h1>
            <h2 class="fs-3 text-dark mb-3">
                <i class="fas fa-search"></i> Không tìm thấy trang
            </h2>
            <p class="mb-4 text-muted">
                Xin lỗi, trang bạn tìm kiếm không tồn tại hoặc đã bị di chuyển.
            </p>
            <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                <a href="/" class="btn btn-primary btn-lg">
                    <i class="fas fa-home"></i> Về trang chủ
                </a>
                <a href="/contact" class="btn btn-outline-primary btn-lg">
                    <i class="fas fa-envelope"></i> Liên hệ
                </a>
            </div>
        </div>
    </div>
</body>
</html>