# IPTV
## 1. Overview
#### Định nghĩa
- IPTV là tên viết tắt của cụm từ Internet Protocol Television - Truyền hình qua giao thức Internet.
- IPTV được định nghĩa là các dịch vụ đa phương tiện như truyền hình, video, audio, văn bản, số liệu truyền tải trên các mạng `dựa trên IP` được kiểm soát nhằm cung cấp chất lượng dịch vụ (QoS), chất lượng trải nghiệm (QoE), tính tương tác, độ bảo mật và tin cậy theo yêu cầu.


#### Phân biệt IPTV và Internet TV
- Internet TV dựa trên mạng Internet để truyền tải nội dung video tới đối tượng sử dụng. Ngược lại IPTV sử dụng các mạng riêng bảo mật để truyền tải nội dung đến đối tượng sử dụng.

#### Các dịch vụ được cung cấp
`Dịch vụ video quảng bá`: Các kênh quảng bá bao gồm các kênh truyền hình quốc gia, địa phương và các kênh trả tiền.
- Tính năng TVoD (TV on Demand) cho phép các chương trình LiveTV được lưu lại trên server trong một khoảng thời gian nào đó. Người dùng sau đó có thể lựa chọn để xem lại các chương trình mà mình bỏ lỡ.

`Dịch vụ Video theo yêu cầu`: Nội dụng video được lưu trữ để đáp ứng được nhiều các sở thích khác nhau của người xem.
- Có thể tua nhanh, tua ngược, tạm dừng,...
- VoD lưu trữ cục bộ.
- VoD lưu trên mạng.
- VoD thuê bao.

## 2. Hệ thống IPTV
-  Bao gồm 4 thành phần 
   + Nhà cung cấp nội dung: sở hữ hoặc được cấp phép để bán nội dung hay quyền sở hữu nội dung.
   + Nhà cung cấp dịch vụ: cung cấp dịch vụ IPTV tới người sử dụng. Nhà cung cấp dịch vụ dựa trên QoS trong các mạng của nhà cung cấp mạng để đảm bảo các dịch vụ IPTV.
   + Nhà cung cấp mạng: cung cấp các dịch vụ mạng cho cả người sử dụng và nhà cung cấp dịch vụ.
   + Người sử dụng: sử dụng và trả tiền cho các dịch vụ IPTV.

- Hiện tại có 2 phương pháp chính để thu tín hiệu truyền hình từ Internet. Thứ nhất sử dụng máy tính kết nối với dịch vụ truyền hình IPTV để nhận tín hiệu đó sau đó chuyển đổi thành tín hiệu truyền hình truyền thống trên TV. Thứ hai sử dụng một bộ chuyển đổi tín hiêu (set top box).

## 3. Kiến trúc thành phần IPTV
- Tận dụng hạ tầng mạng xDSL có sẵn.
- Mạng truy nhập băng rộng (B-RAS/MSS và DSLAM) cần hỗ trợ MUlticast.
- DSLAM hỗ trợ IGMP version 2.
- DSLAM là bộ ghép kênh truy cập đường dây thuê bao số. DSLAM nhận các kết nối của các thuê bao trên đường dây cáp đồng, tập hợp chúng lại và kết nối trở lại trung tâm dữ liệu IPTV.
- B-RAS/MSS và DSLAM hỗ trợ giao tiếp Ethernet.
- Video Server: 

## 4. Các giao thức
- IGMP: đăng kí luồng phát đa hướng trực tiếp để thay đổi luồng phát đa hướng trực tiếp này sang luồng phát đa hướng trực tiếp khác.
- HTTP live streaming (HLS): chia 1 video hoặc 1 audio thành 1 file nhỏ hơn để người dùng thông qua HTTP để tải các file nhỏ này về sau đó ghép lại thành 1 video hoàn chỉnh.
- Dynamic adaptive streaming over HTTP (DASH)
- DHCP


