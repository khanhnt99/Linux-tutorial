# Cloud computing 
## Quy tắc 5-4-3 Cloud computing 
 
+ Tự phục vụ (On-demand)
+ Truy cập ở khắp mọi nơi (Broad network access)
+ Khả năng quản lí và cấp phát tài nguyên linh hoạt (Resource pooling)
+ Khả năng co dãn ? (Rapid Es)
+ Khả năng đo lường (Measured service)

## 4 mô hình triển khai
+ Public Cloud
+ Private Cloud
+ Community Cloud (dịch vụ cloud cho tổ chức chính phủ bao gồm rất nhiều tổ chức bên trong)
+ Hybrid Cloud (lai giữa public và private cloud): 1 phần dữ liệu nằm ở private, 1 phần nằm trên public.

## 3 mô hình cung cấp dịch vụ
+ IaaS: giống kiểu VPS
+ PaaS: Middleware: nền tảng có sẵn database, python, development platform
+ SaaS:  

### Cloud computing khác gì ảo hóa:
- Technical: nền tảng công nghệ được implement trong cloud computing 
- Cloud computing cung cấp môi trường
- Ảo hóa chỉ là resource pool, cloud computing cung cấp cho người sử dụng, tự khởi động tài nguyên ảo hóa, cung cấp service hoàn chỉnh cho khách hàng.

Quản lí tài khoản khách hàng, thuê bao:
- Đóng gói và chuyển giao dịch vụ cho khách hàng

### Devops
- Văn hóa

React
.Net
Git
Jenkins
sonarqube: scale code, báo lỗi về convention
Selenium: Test tự động
ELK: monitoring code
Jira + Confluence: Chia sẻ tài liệu và cách sử dụng

###CEPH: software define storage

---------------------------------------------------------------------------------------------------------------

### Openstack
- Hệ điều hành cho cloud, điều khiển về network, storage, compute
- Message queue
- GUI, CLI, SDK
- Keystone - RBAC
- Các project tương tác với nhau qua Restful API
- Trong 1 project kết nối với nhau qua RPC

### Keystone
- RBAC
- Who, role, assignment
- Assignment: gán quyền và được sử dụng quyền đấy ở đâu
- Role: quyền
- Apache
- Xác thực, cung cấp token để các service khác mang đi để sử dụng các dịch vụ khác.
- Tận dụng từng project triển khai 1 cách độc lập
- Lưu catalog lưu các danh mục của hệ thống

### Glance
- Quản lí các image
- image được lưu trong Swift, File system, Ceph (RBD), Cinder
- Lưu trong DB: đường dẫn tải các máy ảo, thông tin, địa chỉ như 1 cái danh bạ
- Store Adapter: cổng giao tiếp tới nơi chứa các image

### Nova
- Tạo, xóa, sửa tính toán thông tin liên quan đến VM
- Quản lí và điều độ với máy ảo còn việc tạo máy ảo là thuộc về Hypervisor
- Hypervisor: trực tiếp tạo ra VM
- nova-api: nhận về request, giao tiếp với người dùng ở trên
- Cần để xử lí giao tiếp với các thành phần các qua message queue
- nova-scheduler: lập lịch => tìm ra máy thỏa mãn về RAM và CPU tốt nhất
- nova-compute tương tác với hypervisor qua libvirt

### Placement 
- Tách ra từ Nova
- Nova hỏi Placement tìm thông tin lưu trữ
- Tracking resource
- Toàn bộ thông tin thay vì lưu vào Nova thì lưu về Placement
- Chạy qua (WSGI ?)

- nova-conductor: nova compute muốn tương tác với database phải qua nova-conductor

### Neutron
- Agent: Quản lí các thành phần network bên trong
- Neutron L2 Agent: Tương tác với công nghệ switch ảo, linux bridge, ovs
- Neutron L3 Agent: router(namespace), firewall, VPN
- Neutron DHCP Agent: cấp phát IP 
- Các thành phần tương tác với nhau qua Queue

### Cinder
- Cấp các block => volume gắn ngoài 1 VM
- Object => Lưu image
- Heat => Tạo template phân tích thực hiện các quá trình khác

### Octavia
- Tự động việc tạo Load-Balancer

Message queue: Active-standby

------------------------------------------------------------------------------------------

## Ceph
- Software Define Storage
  + Phần mềm quản lí lưu trữ phụ thuộc vào hệ thông phần cứng bên dưới
- Đặc điểm
  + Cơ chế lưu trữ phân tán
  + Lưu trữ Object, Block, File
  + HA built-in: Dữ liệu được nhân bản 
- Kiến trúc của Ceph
- Cung cấp các volume cho Openstack, cung cấp các thành phần lưu trữ cho Openstack 
 + LVM - Block storage: ổ cứng -> lưu thẳng dạng raw device -> Cài OS đắp filesystem lên (NFS)-> Đắp lên trên filesystem (Object storage) (API)
- Cốt lõi là Object storage

OSD: service dưới Linux quản lí các ổ đĩa
MON: Quản lí 
MGR: cung cấp dashboard để quản lí
Auto recovery

- Có cơ chế ACK 

- Cinder sử dụng Ceph

