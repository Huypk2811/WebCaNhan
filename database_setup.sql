-- Script để tạo database và bảng cho website cá nhân
-- Chạy script này trong SQL Server Management Studio (SSMS)

-- 1. Tạo database (nếu chưa có)
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'PersonalWebsite')
BEGIN
    CREATE DATABASE PersonalWebsite;
    PRINT 'Database PersonalWebsite đã được tạo thành công!';
END
ELSE
BEGIN
    PRINT 'Database PersonalWebsite đã tồn tại!';
END
GO

-- 2. Sử dụng database vừa tạo
USE PersonalWebsite;
GO

-- 3. Tạo bảng contacts để lưu thông tin liên hệ
-- Kiểm tra và xóa bảng cũ nếu có để tạo lại với cấu trúc mới
IF EXISTS (SELECT * FROM sysobjects WHERE name='contacts' AND xtype='U')
BEGIN
    DROP TABLE contacts;
    PRINT 'Đã xóa bảng contacts cũ để tạo lại!';
END

CREATE TABLE contacts (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    email NVARCHAR(255) NOT NULL,
    subject NVARCHAR(500),
    message NVARCHAR(MAX) NOT NULL,
    created_date DATETIME DEFAULT GETDATE(),
    is_read BIT DEFAULT 0,
    reply_sent BIT DEFAULT 0
);

PRINT 'Bảng contacts đã được tạo thành công với cấu trúc mới!';
GO

-- 4. Tạo index để tăng hiệu suất truy vấn
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_contacts_email')
BEGIN
    CREATE INDEX IX_contacts_email ON contacts(email);
    PRINT 'Index IX_contacts_email đã được tạo!';
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_contacts_created_date')
BEGIN
    CREATE INDEX IX_contacts_created_date ON contacts(created_date DESC);
    PRINT 'Index IX_contacts_created_date đã được tạo!';
END
GO

-- 5. Thêm một số dữ liệu mẫu (tùy chọn)
INSERT INTO contacts (name, email, subject, message) VALUES 
(N'Nguyễn Văn An', 'nguyenvana@example.com', N'Tư vấn dự án', N'Tôi muốn tư vấn về dự án phát triển website.'),
(N'Trần Thị Bình', 'tranthib@example.com', N'Hợp tác', N'Chúng tôi muốn hợp tác trong dự án sắp tới.');

-- 6. Kiểm tra dữ liệu
SELECT 
    id,
    name,
    email,
    subject,
    CASE 
        WHEN LEN(message) > 50 
        THEN LEFT(message, 50) + '...' 
        ELSE message
    END as message_preview,
    created_date,
    CASE WHEN is_read = 1 THEN N'Đã đọc' ELSE N'Chưa đọc' END as read_status
FROM contacts
ORDER BY created_date DESC;

PRINT 'Setup database hoàn tất!';
PRINT 'Bạn có thể sử dụng các câu lệnh sau để quản lý:';
PRINT '- SELECT * FROM contacts; -- Xem tất cả tin nhắn';
PRINT '- UPDATE contacts SET is_read = 1 WHERE id = [ID]; -- Đánh dấu đã đọc';
PRINT '- DELETE FROM contacts WHERE id = [ID]; -- Xóa tin nhắn';