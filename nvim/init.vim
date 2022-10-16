set softtabstop=2
set shiftwidth=2
set expandtab
set number
set laststatus=2
set mouse=a
set termguicolors

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'rafi/awesome-vim-colorschemes'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-pairs'
      \]

" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

syntax on
colorscheme onedark
let g:lightline = { 'colorscheme': 'onedark' }

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

