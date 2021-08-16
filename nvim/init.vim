set softtabstop=2
set shiftwidth=2
set expandtab
set number
set laststatus=2

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-prettier'
      \]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }

syntax on
colorscheme onedark

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
