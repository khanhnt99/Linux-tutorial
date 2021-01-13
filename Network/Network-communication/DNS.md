# DNS - Domain Name System
## 1. Kiến trúc 
![](https://i.ibb.co/KwdkY2Z/dns-hierarchy.gif)

- Hệ thống DNS có cấu trúc phân cấp theo kiểu hình cây
- Máy chủ DNS gốc **(root name server)** là máy chủ DNS có đặc quyền cao nhất chứa toàn bộ tên miền của mạng Internet.
- Máy chủ tên miền mức cao **Top Level Domains (TLDs)**:
    + Là server cho đuôi `.com`, `orf`, `net`,..
    + Tất cả tên miền cấp quốc gia.
- Máy chủ DNS thẩm quyền: là server của các tổ chức cung cấp ánh xạ tên trạm được cấp quyền tới địa chỉ của server của các tổ chức.

## 2. Hoạt động
- Khi một máy khách sử dụng 1 dịch vụ (trình duyệt trang web truy cập theo tên miền).
- Lúc này máy khách sẽ khởi tạo bản tin truy vấn dưới dạng **UDP** cổng `53` đến máy chủ **DNS cục bộ** để hỏi ánh xạ địa chỉ IP của tên miền.
- Sau thời gian trễ ms máy chủ DNS sẽ trả lời và `máy khách sẽ nhận được bản tin ánh xạ ra địa chỉ IP`.
- Nếu trong máy chủ DNS cục bộ `có sẵn` địa chỉ của tên miền thì máy chủ DNS sẽ trả kết quả ngay cho máy khách.
- Trong trường hợp không có sẵn địa chỉ tên miền thì quá trình tìm tên miền diễn ra theo những bước sau (ví dụ openstack.com.vn):
  + **B1**: Máy chủ DNS sẽ gửi bản tin truy vấn đến máy chủ tên miền **Root**. Máy chủ này sẽ **chỉ ra địa chỉ máy chủ quản lí tên miền** `.vn`.
  + **B2**: Máy chủ DNS sẽ gửi bản tin truy vấn về máy chủ quản lí tên miền `.vn`. Máy chủ quản lí tên miền `.vn` sẽ chỉ ra **địa chỉ máy chủ quản lí tên miền** `.com`.
  + **B3**: máy chủ DNS truy vấn đến máy chủ quản lí tên miền `.com`. Máy chủ này **chứa thông tin về tên miền** `openstack.com.vn` sẽ trả lại địa chỉ IP của tên miền đó cho máy chủ DNS cục bộ.
  + **B4**: Máy chủ DNS cục bộ trả lại địa chỉ IP cho máy khách tên miền `openstack.com.vn`.

## 3. Phân bố cơ sở dữ liệu
- DNS sử dụng nhiều máy chủ, tổ chức theo kiểu phân cấp và phan tán trên toàn cầu.
- DNS được phân cấp thành 3 lớp chính:
  + **Máy chủ DNS gốc `(Root)`**: bao gồm 13 máy chủ nằm trên toàn thế giới, nó quản lí toàn bộ hệ thống tên miền trên mạng Internet.
  + **Máy chủ DNS miền mức cao `(Top-levels-domain)`**: chịu trách nhiệm về các miền mức cao như `.com`, `.org`,..
  + **Máy chủ DNS thẩm quyền**: Bất cứ tổ chức nào có các máy truy nhập công cộng `(máy chủ Web)` trên Internet phải cung cấp bản ghi DNS có khả năng truy cập public, `với ánh xạ tên trạm này ra địa chỉ IP`. Máy chủ **DNS thẩm quyền** của tổ chức sẽ chứa các bản ghi này.
