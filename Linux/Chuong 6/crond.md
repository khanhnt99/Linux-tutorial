# Tự động hóa các thao tác trên Linux
## 1. Cơ chế tự động hóa 
![](https://i.ibb.co/FbDyDQs/Screenshot-from-2020-12-05-18-56-51.png)

## 2. Cron - Configuration file of `cron`
![](https://i.ibb.co/1dFV9xX/Screenshot-from-2020-12-05-18-58-32.png)

- **Cron** thực hiện các thao tác `tự động` tuân thủ cấu hình trong các tệp:
  - `/etc/crontab`
  - `/etc/crontab.hourly`
  - `/etc/cron.daily`
  - `/etc/cron.weekly`
  - `/etc/cron.monthly`
  - `/var/spool/cron`

- **crontab**
  + Câu lệnh thay đổi nội dung file `crontab` của mỗi người dùng (`spool file)`
  + Người quản trị có thể quản lí file crotab của mỗi người dùng.
     - `crontab [option][user_name]`
  + **options**:
    - `-e`: tạo và chỉnh sửa
    - `-r`: xóa
    - `-l`: xem

![](https://i.ibb.co/BgtpL95/Screenshot-from-2020-12-05-19-17-02.png)

```
0: CNhat
...
6: T7
```

#### Các kí tự đặc biệt
|Kí tự|Nội dung|
|-----|--------|
|`*`|Mỗi phút, giờ, ngày, tháng, ngày trong tuần|
|`*/[number]`|Mỗi number phút, giờ, ngày, tháng, ngày trong tuần|
|`[number1]-[number2]`|Khoảng thời gian|
|`[number1],[number2]`|Các giá trị được liệt kê|

- Giới hạn sử dụng `cron`
![](https://i.ibb.co/KN2RG8H/
Screenshot-from-2020-12-05-19-28-15.png)

## 3. at
- Lệnh `at` thay thế cho bộ lập lịch `cron`, ta có thể chạy 1 lần tại 1 thời điểm nhất định mà không cần chỉnh sửa tệp cấu hình.

-  `at [-q queue] [-f file] [-m] TIME`
  + `-q`: Hàng đợi các công việc với các mức ưu tiên khác nhau.
  + `-f`: đọc câu lệnh thực hiện từ tệp.
  + `-m`: thông báo bằng mail kết quả

- Sử dụng `atq` để kiểm tra các tác vụ được đăng kí bởi `at`
  + `atq [-q queue] [-v]`
- Sử dụng `atrm` để loại bỏ tác vụ đã được đăng kí bởi câu lệnh `at`
  + `atrm job [job...]`



__Docs__
- https://users.soict.hust.edu.vn/anhth/Courses/Linux/Slides/06-crond.pdf
- https://viblo.asia/p/cron-trong-linux-cho-newbie-znVGLY93vZOe
- https://blogd.net/linux/quan-ly-cron-tren-linux/