# Backup
## 1. Quá trình sao lưu và phục hồi dữ liệu
- Các loại sao lưu:
  + Sử dụng phần cứng lưu trữ
  + Sao lưu thư mục và tệp
    + Sử dụng `command tar`
  + Sap lưu phân vùng và ổ đĩa
    + Sử dụng lệnh `dump` và `restore`

## 2. Sao lưu phân vùng ổ đĩa
### 2.1 `dd`
- Sao lưu dữ liệu thô ở mức thấp -> `block`
- Có thể copy phân vùng ổ đĩa sang tệp 
