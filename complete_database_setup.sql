-- ================================================================
-- SCRIPT SETUP HOÀN CHỈNH CHO WEBSITE CÁ NHÂN
-- Chạy script này một lần trong SQL Server Management Studio (SSMS)
-- ================================================================

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

-- 3. Kiểm tra và backup dữ liệu cũ (nếu bảng contacts đã tồn tại)
IF EXISTS (SELECT * FROM sysobjects WHERE name='contacts' AND xtype='U')
BEGIN
    PRINT 'Phát hiện bảng contacts cũ. Đang backup dữ liệu...';
    
    -- Tạo bảng backup với timestamp
    DECLARE @BackupTableName NVARCHAR(128);
    SET @BackupTableName = 'contacts_backup_' + FORMAT(GETDATE(), 'yyyyMMdd_HHmmss');
    
    DECLARE @SQL NVARCHAR(MAX);
    SET @SQL = 'SELECT * INTO ' + @BackupTableName + ' FROM contacts';
    EXEC sp_executesql @SQL;
    
    PRINT 'Đã backup dữ liệu vào bảng: ' + @BackupTableName;
    
    -- Xóa bảng cũ
    DROP TABLE contacts;
    PRINT 'Đã xóa bảng contacts cũ';
END
ELSE
BEGIN
    PRINT 'Không tìm thấy bảng contacts cũ. Sẽ tạo mới.';
END

-- 4. Tạo bảng contacts mới với cấu trúc đúng
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

PRINT 'Đã tạo bảng contacts mới với cấu trúc đúng!';
GO

-- 5. Khôi phục dữ liệu từ backup (nếu có)
DECLARE @BackupExists BIT = 0;
DECLARE @BackupTableName NVARCHAR(128) = '';

-- Tìm bảng backup mới nhất
SELECT TOP 1 @BackupTableName = name, @BackupExists = 1
FROM sys.tables 
WHERE name LIKE 'contacts_backup_%'
ORDER BY name DESC;

IF @BackupExists = 1
BEGIN
    PRINT 'Đang khôi phục dữ liệu từ backup: ' + @BackupTableName;
    
    SET IDENTITY_INSERT contacts ON;
    
    DECLARE @RestoreSQL NVARCHAR(MAX);
    SET @RestoreSQL = '
    INSERT INTO contacts (id, name, email, subject, message, created_date, is_read, reply_sent)
    SELECT 
        id, 
        name, 
        email, 
        subject, 
        CAST(message AS NVARCHAR(MAX)),
        created_date, 
        ISNULL(is_read, 0), 
        ISNULL(reply_sent, 0)
    FROM ' + @BackupTableName;
    
    EXEC sp_executesql @RestoreSQL;
    
    SET IDENTITY_INSERT contacts OFF;
    
    PRINT 'Đã khôi phục dữ liệu thành công từ: ' + @BackupTableName;
    PRINT 'Bạn có thể xóa bảng backup sau khi kiểm tra: DROP TABLE ' + @BackupTableName + ';';
END
ELSE
BEGIN
    PRINT 'Không có dữ liệu backup để khôi phục.';
END
GO

-- 6. Tạo index để tăng hiệu suất truy vấn
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_contacts_email' AND object_id = OBJECT_ID('contacts'))
BEGIN
    CREATE INDEX IX_contacts_email ON contacts(email);
    PRINT 'Index IX_contacts_email đã được tạo!';
END
ELSE
BEGIN
    PRINT 'Index IX_contacts_email đã tồn tại!';
END

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_contacts_created_date' AND object_id = OBJECT_ID('contacts'))
BEGIN
    CREATE INDEX IX_contacts_created_date ON contacts(created_date DESC);
    PRINT 'Index IX_contacts_created_date đã được tạo!';
END
ELSE
BEGIN
    PRINT 'Index IX_contacts_created_date đã tồn tại!';
END
GO

-- 7. Thêm dữ liệu mẫu nếu bảng trống
IF NOT EXISTS (SELECT * FROM contacts)
BEGIN
    INSERT INTO contacts (name, email, subject, message) VALUES 
    (N'Nguyễn Văn An', 'nguyenvana@example.com', N'Tư vấn dự án', N'Tôi muốn tư vấn về dự án phát triển website. Dự án của chúng tôi cần một website hiện đại với giao diện đẹp mắt.'),
    (N'Trần Thị Bình', 'tranthib@example.com', N'Hợp tác', N'Chúng tôi muốn hợp tác trong dự án sắp tới. Công ty chúng tôi đang tìm kiếm đối tác phát triển ứng dụng web.'),
    (N'Lê Văn Cường', 'levanc@example.com', N'Thực tập', N'Em là sinh viên năm cuối và muốn tìm hiểu về cơ hội thực tập tại công ty.');
    
    PRINT 'Đã thêm dữ liệu mẫu (3 records)';
END
ELSE
BEGIN
    PRINT 'Bảng đã có dữ liệu, không thêm dữ liệu mẫu.';
END
GO

-- 8. Kiểm tra và hiển thị dữ liệu cuối cùng
PRINT '=== KIỂM TRA DỮ LIỆU ===';

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

-- 9. Thống kê tổng quan
DECLARE @TotalContacts INT;
DECLARE @UnreadContacts INT;
DECLARE @ReadContacts INT;

SELECT @TotalContacts = COUNT(*) FROM contacts;
SELECT @UnreadContacts = COUNT(*) FROM contacts WHERE is_read = 0;
SELECT @ReadContacts = COUNT(*) FROM contacts WHERE is_read = 1;

PRINT '=== THỐNG KÊ ===';
PRINT 'Tổng số tin nhắn: ' + CAST(@TotalContacts AS NVARCHAR(10));
PRINT 'Tin nhắn chưa đọc: ' + CAST(@UnreadContacts AS NVARCHAR(10));
PRINT 'Tin nhắn đã đọc: ' + CAST(@ReadContacts AS NVARCHAR(10));

-- 10. Hiển thị các bảng backup (nếu có)
IF EXISTS (SELECT * FROM sys.tables WHERE name LIKE 'contacts_backup_%')
BEGIN
    PRINT '=== CÁC BẢNG BACKUP ===';
    SELECT 
        name as backup_table_name,
        create_date,
        modify_date
    FROM sys.tables 
    WHERE name LIKE 'contacts_backup_%'
    ORDER BY create_date DESC;
END

PRINT '';
PRINT '================================================================';
PRINT '                    SETUP HOÀN TẤT!';
PRINT '================================================================';
PRINT 'Database: PersonalWebsite';
PRINT 'Bảng: contacts (với cấu trúc mới)';
PRINT 'Indexes: IX_contacts_email, IX_contacts_created_date';
PRINT 'Dữ liệu mẫu: ' + CAST(@TotalContacts AS NVARCHAR(10)) + ' records';
PRINT '';
PRINT 'CÁC LỆNH HỮU ÍCH:';
PRINT '- SELECT * FROM contacts; -- Xem tất cả tin nhắn';
PRINT '- UPDATE contacts SET is_read = 1 WHERE id = [ID]; -- Đánh dấu đã đọc';
PRINT '- DELETE FROM contacts WHERE id = [ID]; -- Xóa tin nhắn';
PRINT '- SELECT COUNT(*) FROM contacts WHERE is_read = 0; -- Đếm tin nhắn chưa đọc';
PRINT '';
PRINT 'Website có thể kết nối với database này bằng:';
PRINT 'Server: localhost:1433';
PRINT 'Database: PersonalWebsite';
PRINT 'Table: contacts';
PRINT '================================================================';