# Deploy lên Render

## Bước 1: Tạo tài khoản Render
- Truy cập: https://render.com/
- Đăng ký/Đăng nhập bằng GitHub

## Bước 2: Tạo Web Service mới
1. Click "New +" → "Web Service"
2. Connect GitHub repository: `Huypk2811/WebCaNhan`
3. Cấu hình:
   - **Name**: `personal-website`
   - **Region**: Singapore (gần nhất)
   - **Branch**: `main`
   - **Runtime**: Docker
   - **Build Command**: để trống (build sẽ thực hiện trong Docker)
   - **Start Command**: để trống (sử dụng CMD từ Dockerfile)

## Bước 3: Environment Variables (nếu cần)
```
PORT=8080
JAVA_OPTS=-Xmx512m -Xms256m
```

## Bước 4: Deploy
- Click "Create Web Service"
- Chờ build và deploy (khoảng 5-10 phút)
- Website sẽ có URL: `https://personal-website-xxxx.onrender.com`

## Lưu ý:
- Plan Free có giới hạn 750 giờ/tháng
- Service sẽ sleep sau 15 phút không hoạt động
- Lần đầu truy cập sau khi sleep có thể mất 30-60 giây để wake up

## Cấu hình tự động deploy:
- Mỗi lần push code lên GitHub branch `main` sẽ tự động trigger deploy mới trên Render