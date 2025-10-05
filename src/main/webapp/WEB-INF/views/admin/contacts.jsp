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
    <style>
        .contact-card {
            border-left: 4px solid #007bff;
            transition: all 0.3s ease;
        }
        .contact-card.unread {
            border-left-color: #dc3545;
            background-color: #fff5f5;
        }
        .contact-card:hover {
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .message-preview {
            max-height: 100px;
            overflow: hidden;
            text-overflow: ellipsis;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                <i class="fas fa-home"></i> Về trang chủ
            </a>
            <span class="navbar-text text-white">
                <i class="fas fa-envelope"></i> Quản lý tin nhắn liên hệ
                <c:if test="${unreadCount > 0}">
                    <span class="badge bg-danger ms-2">${unreadCount} chưa đọc</span>
                </c:if>
            </span>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <h1 class="mb-4">
                    <i class="fas fa-envelope text-primary"></i> 
                    Tin nhắn liên hệ (${contacts.size()})
                </h1>

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

                <!-- Statistics -->
                <div class="row mb-4">
                    <div class="col-md-3">
                        <div class="card bg-primary text-white">
                            <div class="card-body">
                                <h5 class="card-title">
                                    <i class="fas fa-envelope"></i> Tổng tin nhắn
                                </h5>
                                <h2>${contacts.size()}</h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card bg-danger text-white">
                            <div class="card-body">
                                <h5 class="card-title">
                                    <i class="fas fa-envelope-open"></i> Chưa đọc
                                </h5>
                                <h2>${unreadCount}</h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card bg-success text-white">
                            <div class="card-body">
                                <h5 class="card-title">
                                    <i class="fas fa-check"></i> Đã đọc
                                </h5>
                                <h2>${contacts.size() - unreadCount}</h2>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Contacts List -->
                <c:choose>
                    <c:when test="${empty contacts}">
                        <div class="alert alert-info">
                            <i class="fas fa-info-circle"></i> 
                            Chưa có tin nhắn liên hệ nào.
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="contact" items="${contacts}">
                            <div class="card contact-card mb-3 ${!contact.read ? 'unread' : ''}">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <div>
                                        <h6 class="mb-0">
                                            <i class="fas fa-user text-primary"></i> 
                                            ${contact.name}
                                            <c:if test="${!contact.read}">
                                                <span class="badge bg-danger ms-2">Mới</span>
                                            </c:if>
                                        </h6>
                                        <small class="text-muted">
                                            <i class="fas fa-envelope"></i> ${contact.email} | 
                                            <i class="fas fa-calendar"></i> 
                                            <fmt:formatDate value="${contact.createdDate}" pattern="dd/MM/yyyy HH:mm" />
                                        </small>
                                    </div>
                                    <c:if test="${!contact.read}">
                                        <form method="post" style="display: inline;">
                                            <input type="hidden" name="action" value="markAsRead">
                                            <input type="hidden" name="contactId" value="${contact.id}">
                                            <button type="submit" class="btn btn-sm btn-outline-primary">
                                                <i class="fas fa-check"></i> Đánh dấu đã đọc
                                            </button>
                                        </form>
                                    </c:if>
                                </div>
                                <div class="card-body">
                                    <c:if test="${not empty contact.subject}">
                                        <h6 class="text-primary">
                                            <i class="fas fa-tag"></i> ${contact.subject}
                                        </h6>
                                    </c:if>
                                    <div class="message-content">
                                        <strong>Nội dung:</strong>
                                        <p class="mt-2">${contact.message}</p>
                                    </div>
                                    <div class="mt-3">
                                        <a href="mailto:${contact.email}?subject=Re: ${contact.subject}&body=Chào ${contact.name},%0D%0A%0D%0ACảm ơn bạn đã liên hệ..." 
                                           class="btn btn-success btn-sm">
                                            <i class="fas fa-reply"></i> Trả lời qua Email
                                        </a>
                                        <span class="text-muted ms-3">
                                            <small>ID: #${contact.id}</small>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>