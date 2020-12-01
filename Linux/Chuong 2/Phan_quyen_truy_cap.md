# Phân quyền truy cập
## 1.Khái niệm người sử dụng
- Tên
- Mật khẩu
- `home` của người sử dụng
- Nhóm
#### Tất cả các thông tin về nguời sử dụng được lưu trong file `/etc/passwd`

## 2. Nhóm người sử dụng
- Mỗi nguời sử dụng có thể thuộc về 1 hoặc nhiều nhóm.
- Một nhóm = tên nhóm + danh sách các thành viên
- Danh sách các nhóm được lưu trong file `/etc/group`
- `root` có khả năng tạo các nhóm ngoài các nhóm mà hệ điều hành đã ngầm định.

## 3. Các lệnh quản lí User và Group
- Thêm/Xóa user: `sudo add/deluser username`
- Khóa hoặc hủy khóa user
  + `sudo passwd -l username`
  + `sudo passwd -u username`
- Thêm/Xóa 1 nhóm:
  + `sudo add/delgroup groupname`
- Thêm 1 người vào nhóm 
  + `sudo adduser username groupname`
- Thêm 1 người vào group sudo:
  + `usermod -aG sudo username`


## 4. Các quyền
#### Mỗi file luôn thuộc về 1 người sử dụng và 1 nhóm xác định
- **r(4)**: đọc cho phép hiển thị nội dung file của thư mục
- **w(2)**: ghi 
  + Cho phép thay đổi nội dung của file
  + Cho phép thêm hoặc xóa các file trong cùng 1 thư mục
- **x(1)**: thực thi
  + Cho phép thực thi file dưới dạng 1 chương trình
  + Cho phép chuyển đến thư mục cần truy cập.

## 5. Các nhóm người sử dụng
- **u**: người sở hữu duy nhất của file
- **g**: những người thuộc nhóm chứ file
- **others**: những người sử dụng khác, không phải là người sở hữu file cũng như không thuộc nhóm chứa file.

## 6. Thay đôỉ quyền truy cập 
### 6.1 `chmod <mode> <file>`
### 6.2 `chmod <who><operation><rule> file`
- `who`: u | g | o | a(all)
- `operation`: 
  + `+`: thêm 1 số quyền vào tập các quyền file đã có
  + `-`: bỏ 1 số quyền khỏi tập quyền file đã có
  + `=`: gán mới hoặc 1 số quyền cho file
- `rule`: r | w | x | s

## 7. Thay đổi người sở hữu và nhóm 
### 7.1 Thay đổi người sở hữu file
- `chown [Option] [Owner]:[Group] file`
  + Option = `-hR`: owner cùng các tệp và các thư mục con
### 7.2 Thay đổi nhóm của file
- `chgrp <group> <files>`
  + Thay đổi nhóm của file
  + -R: thay đổi quyền sở hữ hoặc nhóm của mọi file trong thư mục.

## 8. SUID ,SGID ,Sticky bit
- Ngoài 9 bits cơ bản xác định các quyền `rwx` của `user`, `group`, `others`, Linux sử dụng 3 bit khác để định nghĩa quyền trên tệp và thư mục.
- Bao gồm:
  + **SUID**
  + **SGID**
  + **Sticky**
- Trong các lệnh, 1 số nguyên từ 0 đến 7 được dùng để xác định ba quyền này.

### 8.1 SUID (Set owner User ID up on execution)
- Thông thường, khi một chương trình tệp/lệnh chạy, nó sẽ sử dụng các quyền của người dùng hiện tại hay người dùng chạy nó.
- **SUID** được đặt, chương trình sẽ sử dụng quyền của `owner` chứ không phải quyền của người dùng hiện tại.

__Docs__
- https://viblo.asia/p/hieu-ro-ve-quyen-truy-cap-tep-trong-linux-07LKXJ8elV4
- https://users.soict.hust.edu.vn/anhth/Courses/Linux/Slides/02-hethongtep.pdf



