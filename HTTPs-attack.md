# Các kiểu tấn công Web và cách khắc phục
## 1. HTTP
- **HTTP (Hyper Text Transfer Protocol)** là giao thức nằm ở lớp Application.
- Giao thức hoạt động theo mô hình `client-server` bằng cách thực hiện các quá trình `request-response`.
- Hoạt động:
  + Người dùng sử dụng trình duyệt truy cập vào 1 website, một phiên làm việc HTTP (1 Session) sẽ được diễn ra với client là máy tính người dùng và server là máy chủ website.
  + Mặc định HTTP sẽ được thực hiện thông qua `port 80`.
- Ví dụ khi người dùng truy cập đến url: `http://abc.com/lichthi`
  + HTTP client sẽ thiết lập một kết nối TCP đến server. Nếu thiết lập thành công, client và server truyền nhận dữ liệu thông qua kết nối này => Kết nối được kết lập còn được gọi là `socket interface`, nó bao gồm: địa chỉ IP, loại giao thức vận hành (TCP), port.
  + Sau khi kết nối thành công, client gửi một `HTTP request` đến server thông qua `socket interface` vừa thiết lập => Gói tin sẽ chứa `đường dẫn yêu cầu /lichthi`.
  + Server sẽ nhận và xử lí request đó cũng thông qua socket, sau đó đóng dữ liệu tương ứng rồi gửi `HTTP response` về cho client.

## 2. HTTPs
- **HTTPs** là phiên bản bổ sung bảo mật, an toàn hơn của HTTP.
- **HTTPs** là một giao thức HTTP và có thêm bảo mật bổ sung, mã hóa dữ liệu trên đường truyền `(thêm chứng chỉ SSL)`.
- **HTTPs** sử dụng port 43.
- Hoạt động:
   + **HTTPs** thường sử dụng một trong 2 giao thức bảo mật để mã hóa thông tin liên lạc là `(SSL - Secure Sockets Layer) hoặc TLS (Transport Layer Security)`.
   + `SSL` và `TLS` đều sử dụng hạ tầng khóa công khai `PKI - Public Key Infrastructure`.
   + TLS là phiên bản SSL được nâng cấp

## 3. Hoạt động của SSL/TLS
- `SSL` không phải là một giao thức đơn lẻ mà là một tập các thủ tục đã được chuẩn hóa để thực hiện nhiệm vụ bảo mật.
- Chứng chỉ `SSL`: được ban hành bởi CA là người đóng vai trò tương đương người cấp hộ chiếu xác nhận danh tính của một người. Các tổ chức muốn cung cấp các dịch vụ được mã hóa SSL/TLS phải xin chứng chỉ từ CA. 
- **Xác thực Server:** Cho phép người sử dụng muốn xác thực server muốn kết nối. Phía browser sử dụng các kĩ thuật mã hóa công khai để chắc chắn rằng `certificate` và `public ID` của server là có giá trị và được cấp bởi `CA (certificate authority)` trong danh sách `CA` đáng tin cậy của client.
- **Xác thực client:** Cho phép server xác thực được người sử dụng muốn kết nối. Server cũng sử dụng kĩ thuật mã hóa công khai để kiểm tra xem `certificate` và `public ID` của clietn có đáng tin cậy không `(có được cấp bởi CA)`.
- **Mã hóa kết nối:** Tất cả thông tin trao đổi giữa client và server được mã hóa trên đường truyền nhằm nâng cao bảo mật.

## Quá trình bắt tay


## 4. PKI - Public Key Infrastructure
- Mục tiêu chính của PKI là cung cấp khóa công khai và xác định mối liên hệ giữa khóa và định danh người dùng.
- Để khóa công khai của mình được chứng nhận, người dùng phải tạo 1 cặp khóa bất đối xứng và gửi cặp khóa này cho tổ chức CA. CA sẽ kiểm tra tính xác thực các thông tin người dùng.

## 5. Tấn công mạng
