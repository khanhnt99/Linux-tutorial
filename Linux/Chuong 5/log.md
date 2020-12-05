# Quản lí nhật kí trong Linux
## 1. Khái niệm
- **Log** là tâp hợp các thông báo được hệ thống sinh ra, lưu trong các tệp nhật kí-`log file`.
- Các thông báo đó có thể là:
  + Thông báo của hệ thống
  + Lỗi trong các thao tác của hệ thống
  + Quá trình đăng nhập, đăng xuất
  + Thông báo từ 1 số ứng dụng

## 2. Nhật kí trong Linux
### 2.1 Cơ chế ghi nhật kí 
![](https://i.ibb.co/s21h83D/Screenshot-from-2020-12-04-11-31-17.png)

### 2.2 syslogd
- Chương trình quản lí các thông báo từ các thành phần của hệ thống.
- Được thực hiện bằng **syslogd daemon**
- Khởi động cùng hệ thống
  + `/etc/init.d/syslog {start | stop | reload}`
- Cấu hình **syslog** được lưu trong tệp 
  + `/etc/syslog.conf`
- Trên Ubuntu sử dụng **rsyslog**, file cấu hình:
  + `/etc/rsyslog.d/50-default.conf`

```
khanhnt@Inspiron3521:/etc/rsyslog.d$ cat 50-default.conf 
#  Default rules for rsyslog.
#
#			For more information see rsyslog.conf(5) and /etc/rsyslog.conf

```

### 2.3 File cấu hình `/etc/rsyslogd/50-default.conf`
- Các dòng của tệp cấu hình có dạng
![](https://i.ibb.co/nqGhmy1/Screenshot-from-2020-12-04-11-37-07.png)

- **Facility** là nguồn gốc sinh ra thông báo.
- **Priority** là mức độ quan trọng của thông báo.
- **Action** là thao tác thực hiện khi nhận được thông báo (`ghi vào tệp`)
- Các loại **Facility**

|Facility|Ý nghĩa|
|-------|-------|
|auth|Thông báo liên quan đến việc xác thực|
|authpriv|Thông báo liên quan đến quyền truy cập|
|cron|Thông báo của crond|
|kern|Thông báo của nhân hệ điều hành|
|news|Thông báo liên quan đến new service|
|syslog|Thông báo của syslog|
|daemon|Thông báo chung các daemon|

- Các loại **Priority**

|Priority|Ý nghĩa|
|--------|-------|
|emerg|Thông báo khẩn|
|alert|Báo động|
|crit|Lỗi phần cứng không thể khắc phục|
|err|Lỗi thông thường|
|warning|Cảnh báo|
|notice|Nhắc nhở|
|info|Thông tin|
|debug|Thông tin kĩ thuật|

- Các thao tác

|Kí hiệu|Thao tác|
|-------|--------|
|/file_name|Ghi vào tệp file_name|
|@hostname|Chuyển đến máy `hostname`|
|user_name|Ghi thông báo cho `username`|
|*|Thông báo cho tất cả các user đang đăng nhập vào hệ thống|

### 2.4 Các tệp log quan trọng
- Thư mục **/var/log/syslog**
  + Lưu trữ tất cả dữ liệu hoạt động trên toàn hệ thống 
  + Xem file log này để theo dõi các lỗi khởi động (trừ Kernel), lỗi dịch vụ liên quan đến ứng dụng, các thông báo được ghi lại trong quá trình khởi động hệ thống.

- Thư mục **/var/log/auth.log** `(Ubuntu)`
  + Chứa thông tin xác thực trong hệ thống máy chủ.
  + Liên quan đến vấn đề ủy quyền người dùng.

- Thư mục **/var/log/boot.log**
  + Thông tin liên quan đến quá trình `khởi động` hệ thống.
  + Liên quan đến quá trình lỗi tắt máy không đúng cách, thời gian ngừng hoạt động khi tắt máy đột xuất.

## 3. Tối ưu hóa quá trình ghi nhật kí
### 3.1 Logrotate
- Xoay vòng các tệp `log`.
- Sao lưu và nén các dữ liệu log đã cũ.
- Có thể kích hoạt theo thời gian hoặc theo kích thước.
- Cấu hình trong file `/etc/logrotate.d/`

### 3.2 Các tùy biến của `logrotate`

```
khanhnt@Inspiron3521:/etc/logrotate.d$ cat libvirtd
/var/log/libvirt/libvirtd.log {
        weekly
        missingok
        rotate 4
        compress
        delaycompress
        copytruncate
        minsize 100k
}
```

- **weekly**: mỗi tuần
- **missingok**: Nếu `file log bị mất đi` hoặc `không có tồn tại` ***.log** thì logrotate sẽ di chuyển tới phần file log khác mà không phải xuất ra thông báo lỗi.
- **rotate 4**: số lượng file log cũ đã được lưu lại sau khi rotate (4).
- **compress**: Logrotate sẽ nén tất cả các file log lại sau khi được rotate mặc định bằng gzip.
- **delaycompress**: Sử dụng khi không muốn file log cũ phải nén sau khi vừa được rotate.
- **copytruncate**: File log cũ được sao chép vào 1 tệp lưu trữ, và sau đó xóa các dòng log cũ.


__Docs__
- https://users.soict.hust.edu.vn/anhth/Courses/Linux/Slides/05-log.pdf
- https://blogd.net/linux/cac-file-log-quan-trong-tren-linux/
- https://blogd.net/linux/cau-hinh-logrotate-trong-linux/
 
