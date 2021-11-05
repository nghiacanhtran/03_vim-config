local function map(mode,lhs,rhs,opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extends('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

---------------------Mappings--------------------------
 map('', '<leader>c', '"+y')        -- Copy to clipboard in normal, visual, select and operator models
 map('i', '<C-u>', '<C-g>u<C-u>')   -- Make <C-u> undo-friendly
 map('i', '<C-w>', '<C-g>u<C-w>')   -- Make <C-w> undo-friendly

