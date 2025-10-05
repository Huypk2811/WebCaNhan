# Hướng dẫn Setup Database cho Website Cá Nhân

## Bước 1: Setup Database trong SQL Server Management Studio (SSMS)

1. **Mở SSMS và kết nối với SQL Server**
2. **Chạy script `database_setup.sql`:**
   - Mở file `database_setup.sql` trong SSMS
   - Thực thi toàn bộ script (F5)
   - Script sẽ tạo database `PersonalWebsite` và bảng `contacts`

## Bước 2: Thông tin kết nối đã được cấu hình

- **Database:** PersonalWebsite
- **Username:** sa
- **Password:** 123456
- **Server:** localhost:1433

## Bước 3: Chức năng đã được thêm vào

### 1. Form liên hệ sẽ lưu vào database
- Khi người dùng gửi form liên hệ, dữ liệu sẽ được lưu vào bảng `contacts`
- Hiển thị thông báo thành công khi lưu thành công

### 2. Trang quản lý tin nhắn (Admin)
- **URL:** `/admin/contacts`
- Xem tất cả tin nhắn đã gửi
- Đánh dấu tin nhắn đã đọc/chưa đọc
- Thống kê số lượng tin nhắn
- Trả lời qua email

## Bước 4: Cách sử dụng

### Cho người dùng thông thường:
1. Truy cập trang Liên hệ
2. Điền thông tin và gửi
3. Dữ liệu sẽ được lưu vào database

### Cho admin:
1. Truy cập: `http://localhost:9090/admin/contacts`
2. Xem tất cả tin nhắn
3. Đánh dấu đã đọc
4. Trả lời qua email

## Bước 5: Các câu lệnh SQL hữu ích

```sql
-- Xem tất cả tin nhắn
SELECT * FROM contacts ORDER BY created_date DESC;

-- Xem tin nhắn chưa đọc
SELECT * FROM contacts WHERE is_read = 0;

-- Đánh dấu tin nhắn đã đọc
UPDATE contacts SET is_read = 1 WHERE id = [ID];

-- Đếm tổng số tin nhắn
SELECT COUNT(*) as total FROM contacts;

-- Xóa tin nhắn cũ (hơn 6 tháng)
DELETE FROM contacts WHERE created_date < DATEADD(MONTH, -6, GETDATE());
```

## Bước 6: Cấu trúc bảng contacts

| Cột | Kiểu dữ liệu | Mô tả |
|-----|-------------|-------|
| id | INT IDENTITY | Khóa chính, tự tăng |
| name | NVARCHAR(255) | Tên người gửi |
| email | NVARCHAR(255) | Email người gửi |
| subject | NVARCHAR(500) | Chủ đề tin nhắn |
| message | NTEXT | Nội dung tin nhắn |
| created_date | DATETIME | Thời gian tạo |
| is_read | BIT | Đã đọc hay chưa |
| reply_sent | BIT | Đã trả lời hay chưa |

## Bước 7: Chạy ứng dụng

```bash
mvn clean compile
mvn jetty:run
```

Sau đó truy cập: `http://localhost:9090`

## Lưu ý:
- Đảm bảo SQL Server đang chạy
- Đảm bảo tài khoản `sa` với mật khẩu `123456` có quyền truy cập
- Nếu thay đổi thông tin kết nối, cập nhật trong file `DatabaseConnection.java`