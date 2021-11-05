call plug#begin('~/AppData/Local/nvim/plugged')
" below are some vim plugins for demonstration purpose.
" add the plugin you want to use here.
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'easymotion/vim-easymotion'
Plug 'itchyny/lightline.vim'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
Plug 'huyvohcmc/atlas.vim'
Plug 'mhinz/vim-startify'
Plug 'dracula/vim', { 'as': 'dracula' } 
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()


" ============================================================================ "
" ===                           EDITING OPTIONS                            === "
" ============================================================================ "
augroup fzf
  autocmd!
augroup END

" Leader
let mapleader = " "

set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

" We have VCS -- we don't need this stuff.
set nobackup      " We have vcs, we don't need backups.
set nowritebackup " We have vcs, we don't need backups.
set noswapfile    " They're just annoying. Who likes them?
:set noundofile

set number "set number
set relativenumber

set clipboard=unnamed "allow vim copy to clipboard
:set mouse=a          "allow mouse

:set hidden
set autoindent
set smartindent

set nofoldenable
set foldmethod=indent "folding

set laststatus=2 " Always display the status line
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
set autochdir
let g:rg_derive_root='true'
set ruler " show the cursor position all the time

" Softtabs, 2 spaces
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab
set guifont=raleway

" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "
set termguicolors
"colorscheme atlas
" for dark version
set background=dark


" set contrast
" this configuration option should be placed before `colorscheme gruvbox-material`
" available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'soft'

colorscheme gruvbox-material


" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "
"lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox_material',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo', 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
" vim auto close tag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'    
" Indent Guide
"let g:indentLine_char = '┆'
"let g:indentLine_color_gui = '#a08787' 


command! -nargs=0 Prettier :CocCommand prettier.formatFile "prettier setting

" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "
"Map ESC to kj
"nnoremap gh <esc>         " Remap in Normal mode
 inoremap <CTRL-[> <esc>   " Remap in Insert and Replace mode
"vnoremap gh <esc>         " Remap in Visual and Select mode
"xnoremap gh <esc>         " Remap in Visual mode
"snoremap gh <esc>         " Remap in Select mode


" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Vim easymotion
nmap <silent> ;; <Plug>(easymotion-overwin-f)
nmap <silent> ;l <Plug>(easymotion-overwin-line)

let g:user_emmet_leader_key=','

"fast save
noremap <Leader>s :update<CR>

nnoremap <Leader>\ :vsplit<CR>
nnoremap <Leader>/ :split<CR>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"------------------------------------
" Floating Term
let s:float_term_border_win = 0
let s:float_term_win = 0
function! FloatTerm(...)
  " Configuration
  let height = float2nr((&lines - 2) * 0.6)
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns * 0.6)
  let col = float2nr((&columns - width) / 2)
  " Border Window
  let border_opts = {
        \ 'relative': 'editor',
        \ 'row': row - 1,
        \ 'col': col - 2,
        \ 'width': width + 4,
        \ 'height': height + 2,
        \ 'style': 'minimal'
        \ }
  " Terminal Window
  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
  let top = "╭" . repeat("─", width + 2) . "╮"
  let mid = "│" . repeat(" ", width + 2) . "│"
  let bot = "╰" . repeat("─", width + 2) . "╯"
  let lines = [top] + repeat([mid], height) + [bot]
  let bbuf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(bbuf, 0, -1, v:true, lines)
  let s:float_term_border_win = nvim_open_win(bbuf, v:true, border_opts)
  let buf = nvim_create_buf(v:false, v:true)
  let s:float_term_win = nvim_open_win(buf, v:true, opts)
  " Styling
  hi FloatWinBorder guifg=#87bb7c
  call setwinvar(s:float_term_border_win, '&winhl', 'Normal:FloatWinBorder')
  call setwinvar(s:float_term_win, '&winhl', 'Normal:Normal')
  if a:0 == 0
    terminal
  else
    call termopen(a:1)
  endif
  startinsert
  " Close border window when terminal window close
  autocmd TermClose * ++once :bd! | call nvim_win_close(s:float_term_border_win, v:true)
endfunction

" Open terminal
nnoremap <Leader>at :call FloatTerm()<CR>

" allow paste from buffer to fzf'
tnoremap <expr> <C-v> '<C-\><C-N>pi'

" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
