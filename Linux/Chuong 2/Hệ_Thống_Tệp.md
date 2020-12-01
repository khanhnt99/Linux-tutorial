# Hệ thống tệp 
## 1. Cấu trúc hệ thống tệp
- Biểu diễn bởi 1 cây phân cấp thư mục và các tệp dữ liệu.
   + Một thư mục dùng để tạo nhóm 1 tập các tệp dữ liệu.
   + Một thư mục có thể chứa các thư mục con.
- Thư mục gốc (`/`) là điểm vào đầu tiên cho cả cây thư mục.

## 2. Các siêu kí tự
- __*__: dùng để thay thế cho một chuỗi các kí tự bất kì bao gồm cả xâu rỗng.
- __?__: thay thế cho 1 kí tự bất kì
- __[]__: được thay thế bởi 1 kí tự trong 1 tập kí tự cho trước.

## 3. Inode, soft link and hard link
- 1 file trong Linux
![](https://i.ibb.co/DKb0QF6/Screenshot-from-2020-11-25-00-55-28.png)
- **Thư mục**
  + 1 thư mục là 1 tệp với nội dung là một bảng liên kết
  + 1 liên kết gắn 1 `tên tệp` với 1 `inode` của hệ thống tệp.
### 3.1 Liên kết vật lí (hard link)
![](https://i.ibb.co/DKb0QF6/Screenshot-from-2020-11-25-00-55-28.png)
- 1 Liên kết vật lí là một quan hệ giữa tên tệp trong thư mục với 1 inode.
- Có thể có nhiều liên kết vật lí đến cùng 1 inode.

### 3.2 Liên kết biểu tượng (soft link)
![](https://i.ibb.co/QfvfJd5/Screenshot-from-2020-11-25-01-01-58.png)

### 3.3 Hard link vs Soft link 
- Liên kết biểu tượng cho phép tránh được hạn chế về mặt dung lượng của thiết bị lưu trữ.
- Một liên kết vật lí luôn chiếm 1 số lượng inode nhất định.

## 4. Các kiểu tệp
- `-`: tệp thông thường
- `d`: thư mục
- `b`: tệp block
- `c`: tệp kí tự
- `l`: link
