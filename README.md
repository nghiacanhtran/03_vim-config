# Các ghi chú về Vim

- Di chuyển trong Vim
  - Để thực hiện di chuyển trong Vim, bạn cần chuyển sang chế độ command bằng phím ESC.
    - Di chuyển sang trái: **`h`**
    - Di chuyển sang phải: **`l`**
    - Di chuyển lên trên một dòng: **`k`**
    - Di chuyển xuống dưới một dòng: **`j`**
    - Di chuyển đến đầu dòng: **`0`**
    - Di chuyển đến cuối dòng: **`$`**
    - Di chuyển đến một chữ cái trong dòng
      - Trước con trỏ: `Shift + f` -> `ký tự cần nhảy`
      - Sau con trỏ: `f` -> `ký tự cần nhảy`
  - Nhảy n + k dòng lên trên
    - Cách 1: `nj(10j)`
    - Cách 2: `:+nj(:+10j)`
  - Nhảy n + k dòng xuống dưới
    - Cách 1: `nj(10j)`
    - Cách 2: `:+nj(:+10j)`
  - Nhảy xuống cuối file: `Shift g`
- Tìm kiếm và thay thế
  - Tìm kiếm:
    - Cú pháp: `/kytucantim`
    - Nhảy đến từ kế tiếp: `n`
    - Nhảy đến từ đằng trước: 'N'
  - Thay thế:
    - Bấm phím `:`
    - Cú pháp: `%s/old_string/new_string/g`
- Chỉnh sửa văn bản
  - Upper case
    - huyển ký tự viết thường thành viết hoa tại vị trí con trỏ: `~`
    - Bôi đen và viết hoa
      - Chuyển chế độ select: `v`
      - Bôi đen đoạn ký tự cần viết hoa
      - Bấm phím: `shift u`
  - Lower case
    - Chuyển ký tự viết hoa thành viết thường tại vị trí con trỏ: `~`
    - Bôi đen và viết hoa
      - Chuyển chế độ select: `v`
      - Bôi đen đoạn ký tự cần viết hoa
      - Bấm phím: `u`
  - Undo
    - Bấm phím: `u`
  - Redo
    - Bấm phím: `Ctrl r`
  - Xoá
    - Xoá một ký tự tại con trỏ: `x
    - Xoá một từ: `dw`
    - Xoá toàn bộ dòng hoặc toàn bộ ký tự tại vị trí con trỏ: `0` -> `dd` hoặc `0` -> `Shift d`
    - Xoá n dòng tính từ dòng đặt con trỏ
      - Xoá dưới: `d(số dòng)j`
      - Xoá trên: `d(số dòng)k`
    - Xóa dòng và chuyển con trỏ lên dòng trước: `d0kJx`
  - Copy,Cut
    - Chuyển sang visual mode: `v`
    - Bôi đen đoạn cần copy,cut
    - Copy: `y`
    - Cut: `d`
  - Paste
    - Paste trước con trỏ: 'Shift P`
    - Paste sau con trỏ: `p`
  - Thêm một dòng mới
    - Thêm trên: 'Shift o`
    - Thêm dưới: `o`
  - Mutil cursor
- Vim easymotion
