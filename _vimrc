" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'itchyny/lightline.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
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

set clipboard=unnamed "allow vim copy to clipboard
:set mouse=a          "allow mouse

set autoindent
set smartindent

set foldmethod=indent "folding
set nofoldenable
set laststatus=2 " Always display the status line
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
set autochdir
let g:rg_derive_root='true'
" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "
" important!!
set termguicolors

" for dark version
set background=dark

colorscheme gruvbox "set scheme
set guifont=consolas:h11

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "

command! -nargs=0 Prettier :CocCommand prettier.formatFile "prettier setting

"config auto open nerdtree
autocmd VimEnter * NERDTree D:\Code\ibank_git

"Focus Editor
autocmd VimEnter * wincmd p

"AutoClose NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

"lightline
let g:lightline = {
      \ 'colorscheme': 'dracula',
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
" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "

"Map toggle nerd tree
nnoremap <C-t> :NERDTreeToggle<CR>  
map <C-i> :NERDTreeFind<CR> 
nnoremap <C-n> :NERDTree D:\<CR>

"fzf find
noremap <C-f> :Files D:\<CR> 
nnoremap \ :Rg<CR>
nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>e :BLines<cr>

"Map ESC to kj
"nnoremap gh <esc>         " Remap in Normal mode
"inoremap gh <esc>         " Remap in Insert and Replace mode
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

"jsdoc
nmap <silent> ;j <Plug>(jsdoc)

nnoremap <Leader>\ :vsplit<CR>
nnoremap <Leader>/ :split<CR>

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" ripgrep command to search in multiple files
autocmd fzf VimEnter * command! -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
  
" ripgrep - ignore the files defined in ignore files (.gitignore...) and doesn't ignore case
autocmd fzf VimEnter * command! -nargs=* Rgir
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

