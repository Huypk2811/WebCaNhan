<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lỗi 500 - Lỗi máy chủ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>
    <div class="d-flex align-items-center justify-content-center min-vh-100">
        <div class="text-center">
            <div class="error-500 mb-4">
                <i class="fas fa-server text-danger" style="font-size: 8rem;"></i>
            </div>
            <h1 class="display-1 fw-bold text-danger">500</h1>
            <h2 class="fs-3 text-dark mb-3">
                <i class="fas fa-exclamation-circle"></i> Lỗi máy chủ nội bộ
            </h2>
            <p class="mb-4 text-muted">
                Xin lỗi, đã xảy ra lỗi trên máy chủ. Chúng tôi đang khắc phục sự cố này.
            </p>
            <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                <a href="/" class="btn btn-primary btn-lg">
                    <i class="fas fa-home"></i> Về trang chủ
                </a>
                <button onclick="location.reload()" class="btn btn-outline-primary btn-lg">
                    <i class="fas fa-redo"></i> Thử lại
                </button>
            </div>
        </div>
    </div>
</body>
</html>