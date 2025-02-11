## 🎭 **Tạo file LNK giả mạo file PDF nhưng thực tế là một shortcut chạy lệnh tùy chỉnh**  

### 📌 **Mục tiêu**
- Tạo một **file shortcut (.LNK)** nhưng giả mạo là một file PDF.  
- Khi mở, nó sẽ chạy một lệnh đơn giản như mở **Notepad** (hoặc có thể thay đổi thành một hành động khác).  

---  

## 📝 **1. Tạo file shortcut giả dạng PDF**  
Dưới đây là cách tạo một **file .LNK giả dạng PDF** bằng PowerShell.  

### 🔹 **Bước 1: Tạo shortcut bằng PowerShell**
Mở **Notepad**, sao chép đoạn mã sau, và lưu thành **`create_fake_pdf.ps1`**:  

```powershell
$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$env:USERPROFILE\Desktop\document.pdf.lnk")
$Shortcut.TargetPath = "C:\Windows\System32\cmd.exe"
$Shortcut.Arguments = "/c start notepad.exe"
$Shortcut.IconLocation = "C:\Program Files\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe, 0"
$Shortcut.Save()
```

### 🔹 **Bước 2: Chạy script**
Mở **PowerShell** và chạy lệnh:  

```powershell
powershell -ExecutionPolicy Bypass -File create_fake_pdf.ps1
```

🔹 **Kết quả:**  
- Một file **`document.pdf.lnk`** sẽ xuất hiện trên Desktop.  
- Nó có **biểu tượng giống file PDF** (Adobe Acrobat).  
- Khi người dùng mở file này, nó **không mở PDF** mà thay vào đó mở **Notepad**.  

---

## 🧐 **📌 Giải thích**
- **`document.pdf.lnk`**: Đây thực chất là một file shortcut `.LNK`, nhưng kẻ tấn công có thể đặt tên là `.pdf` để đánh lừa người dùng.  
- **`TargetPath = cmd.exe`**: Shortcut sẽ gọi **Command Prompt**.  
- **`Arguments = "/c start notepad.exe"`**: Khi mở, nó chạy lệnh `start notepad.exe`.  
- **`IconLocation`**: Shortcut lấy icon của **Adobe Acrobat**, làm nó trông như một file PDF thực sự.  

---

## 🚨 **Cách phòng tránh**
✅ **Bật hiển thị phần mở rộng file** trong Windows để dễ phát hiện `.lnk`.  
✅ **Không mở file PDF từ nguồn không tin cậy**, đặc biệt nếu kích thước quá nhỏ.  
✅ **Kiểm tra file bằng Notepad**: Nếu mở bằng Notepad mà thấy đường dẫn đến `cmd.exe`, có thể là shortcut giả mạo.  
✅ **Sử dụng phần mềm diệt virus** để kiểm tra shortcut đáng ngờ.  

---

💡 **Tóm lại:** Đây là một ví dụ **không độc hại**, chỉ giúp bạn hiểu cách shortcut `.LNK` có thể giả dạng file PDF. Nếu bạn muốn thử nghiệm thêm với các loại lệnh khác hoặc cách phát hiện shortcut giả, mình có thể hướng dẫn tiếp! 🚀