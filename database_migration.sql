-- Script migration an toàn để cập nhật bảng contacts
-- Chạy script này trong SQL Server Management Studio (SSMS)

USE PersonalWebsite;
GO

-- Kiểm tra và backup dữ liệu cũ
IF EXISTS (SELECT * FROM sysobjects WHERE name='contacts' AND xtype='U')
BEGIN
    PRINT 'Đang backup dữ liệu cũ...';
    
    -- Tạo bảng backup
    SELECT * INTO contacts_backup FROM contacts;
    PRINT 'Đã backup dữ liệu vào bảng contacts_backup';
    
    -- Xóa bảng cũ
    DROP TABLE contacts;
    PRINT 'Đã xóa bảng contacts cũ';
END

-- Tạo bảng mới với cấu trúc đúng
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

PRINT 'Đã tạo bảng contacts mới với cấu trúc đúng';

-- Khôi phục dữ liệu từ backup (nếu có)
IF EXISTS (SELECT * FROM sysobjects WHERE name='contacts_backup' AND xtype='U')
BEGIN
    PRINT 'Đang khôi phục dữ liệu từ backup...';
    
    SET IDENTITY_INSERT contacts ON;
    
    INSERT INTO contacts (id, name, email, subject, message, created_date, is_read, reply_sent)
    SELECT 
        id, 
        name, 
        email, 
        subject, 
        CAST(message AS NVARCHAR(MAX)), -- Convert NTEXT to NVARCHAR(MAX)
        created_date, 
        is_read, 
        reply_sent
    FROM contacts_backup;
    
    SET IDENTITY_INSERT contacts OFF;
    
    PRINT 'Đã khôi phục dữ liệu thành công';
    
    -- Xóa bảng backup
    -- DROP TABLE contacts_backup;
    -- PRINT 'Đã xóa bảng backup (uncomment dòng trên nếu muốn xóa)';
END

-- Tạo index
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_contacts_email')
BEGIN
    CREATE INDEX IX_contacts_email ON contacts(email);
    PRINT 'Index IX_contacts_email đã được tạo!';
END

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_contacts_created_date')
BEGIN
    CREATE INDEX IX_contacts_created_date ON contacts(created_date DESC);
    PRINT 'Index IX_contacts_created_date đã được tạo!';
END

-- Thêm dữ liệu mẫu nếu bảng trống
IF NOT EXISTS (SELECT * FROM contacts)
BEGIN
    INSERT INTO contacts (name, email, subject, message) VALUES 
    (N'Nguyễn Văn An', 'nguyenvana@example.com', N'Tư vấn dự án', N'Tôi muốn tư vấn về dự án phát triển website.'),
    (N'Trần Thị Bình', 'tranthib@example.com', N'Hợp tác', N'Chúng tôi muốn hợp tác trong dự án sắp tới.');
    
    PRINT 'Đã thêm dữ liệu mẫu';
END

-- Kiểm tra dữ liệu cuối cùng
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

PRINT '=== MIGRATION HOÀN TẤT ===';
PRINT 'Bảng contacts đã được cập nhật thành công!';
PRINT 'Dữ liệu cũ đã được backup vào contacts_backup (nếu có)';
PRINT 'Bạn có thể xóa bảng backup sau khi kiểm tra: DROP TABLE contacts_backup;';