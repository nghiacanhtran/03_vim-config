# Thông tin thiết kế hệ thống Neovim

## Kiến trúc tổng quan
├── init.lua              -- Điểm bắt đầu của cấu hình Neovim
├── lua/
│   ├── plugins/          -- Cấu hình plugin
│   │   ├── init.lua      -- Quản lý plugin (Packer hoặc khác)
│   │   ├── lsp.lua       -- Cấu hình LSP
│   │   ├── telescope.lua -- Cấu hình Telescope
│   │   ├── treesitter.lua-- Cấu hình Treesitter
│   │   ├── nvimtree.lua  -- Cấu hình Nvim-Tree
│   │   └── lualine.lua   -- Cấu hình Lualine
│   ├── core/
│   │   ├── options.lua   -- Cấu hình chung (options)
│   │   ├── keymaps.lua   -- Cấu hình phím tắt
│   │   └── autocmds.lua  -- Cấu hình tự động lệnh
│   └── utils.lua         -- Các tiện ích (nếu cần)
