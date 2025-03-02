# Hướng Dẫn Tạo Project Python với Môi Trường Ảo 🐍

## Giới Thiệu 📖

Đây là hướng dẫn dành cho người mới bắt đầu để tạo một dự án Python sử dụng môi trường ảo (virtual environment).

## Cài Đặt Python 🛠️

### 1. Tải và Cài Đặt Python 📥

- 🔗 Truy cập [python.org](https://www.python.org/) để tải Python mới nhất.
- ▶️ Chạy trình cài đặt và chọn **Add Python to PATH** trước khi cài đặt.

### 2. Kiểm Tra Cài Đặt ✅

Mở terminal hoặc command prompt và nhập:

```sh
python --version
```

✔️ Nếu hiển thị phiên bản Python, bạn đã cài đặt thành công.

## Tạo Project Python với Môi Trường Ảo 🏗️

### 1. Tạo Thư Mục Dự Án 📂

```sh
mkdir my_project
cd my_project
```

### 2. Tạo Môi Trường Ảo 🏕️

```sh
python -m venv venv
```

### 3. Kích Hoạt Môi Trường Ảo ⚡

- **Windows (Command Prompt):**
  ```sh
  venv\Scripts\activate
  ```
- **Windows (PowerShell):**
  ```sh
  venv\Scripts\Activate.ps1
  ```
- **Linux / macOS:**
  ```sh
  source venv/bin/activate
  ```

✅ Sau khi kích hoạt, bạn sẽ thấy `(venv)` xuất hiện trước dòng lệnh.

### 4. Cài Đặt Các Thư Viện Cần Thiết 📦

```sh
pip install -r requirements.txt
```

📌 Nếu chưa có `requirements.txt`, bạn có thể tạo bằng cách:

```sh
pip freeze > requirements.txt
```

### 5. Chạy Ứng Dụng 🚀

```sh
python main.py
```

### 6. Thoát Môi Trường Ảo 🔚

Khi không cần sử dụng nữa, bạn có thể thoát môi trường ảo bằng lệnh:

```sh
deactivate
```

## Cấu Trúc Dự Án Mẫu 📁

```
my_project/
│── venv/               # Môi trường ảo 🏕️
│── main.py             # File chính của ứng dụng 📜
│── requirements.txt    # Danh sách thư viện cần thiết 📦
└── README.md           # Tài liệu hướng dẫn 📖
```

## Kết Luận 🎯

Hướng dẫn này giúp bạn thiết lập môi trường phát triển Python một cách dễ dàng. Hãy thực hành để làm quen với môi trường ảo và quản lý thư viện hiệu quả! 🚀