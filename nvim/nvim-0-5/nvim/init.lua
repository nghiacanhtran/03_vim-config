-------------------------------------------------- load config ag --------------------------
require("ag")
--------------------------------------------------Helpers------------------------------------
local opt = vim.opt -- set option

---------------------options------------------------
opt.number = true           -- set line number
opt.relativenumber = true   -- set relative line number
opt.swapfile = false        -- no swap files
opt.encoding = 'UTF-8'      -- set encoding to utf-8
opt.fileencoding = 'UTF-8'  -- encoding write to file
opt.ignorecase = true
opt.list = true             -- show some invisible characters
opt.scrolloff = 4           -- lines of context
opt.shiftround = true       -- round indent
opt.shiftwidth = 2          -- size of indent
opt.sidescrolloff = 8       -- colums of context
opt.smartcase = true        -- do not ignore case with capitals
opt.smartindent = true      -- insert indents automatically
opt.tabstop = 2             -- number of spaces tabs count for
opt.termguicolors = true     -- true color support
opt.wrap = false            -- disable line wrap
opt.laststatus=2            -- always display the status bar

