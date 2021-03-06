"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""Installing plugins""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.local/share/nvim/plugged')

"Nice layout
Plug 'vim-airline/vim-airline'

"Side pannel for code tree (functions, classes, variables,..)
Plug 'majutsushi/tagbar'
"
"Ctag managers, reguires a ctag program
Plug 'ludovicchabant/vim-gutentags'

"Requires Python3 client interface to be set up and a clang complete manager
"(i.e. rip-rip)
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"Requires an installation of Clang for completion
Plug 'Rip-Rip/clang_complete' 

"ag grepper
Plug 'numkil/ag.nvim'

" Syntax highlighter
Plug 'KeitaNakamura/highlighter.nvim', { 'do': ':UpdateRemotePlugins' }

" Buffer manager
Plug 'qpkorr/vim-bufkill'

call plug#end()
"
"""""""""""""""""""""""""""
"Configuring vim as an IDE"
"""""""""""""""""""""""""""
set mouse=a
set number  "This turns on line numbering
set background=light
syntax on

hi Normal ctermbg=white ctermfg=black

"setting tabs
set tabstop=4
set expandtab

"set tags
set tags=./tags,tags;

"Use this command with gutentag otherwise it will generate humongus ctags.tmp file and it will take long while
"let g:gutentags_file_list_command = 'find . -type f  -not -path "*deps/*" -not -path "*output*/*"  \( -name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name "*.hpp" \)'

"Ag command line parameters
let g:ag_prg="ag -U --cpp --cc --ignore-dir=output_ct --ignore-dir=.git"
let g:ag_highlight=1

"Disable automatic code completion
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1

"Configuring c/c++ clang autocomplete
let g:clang_library_path='/opt/toolchain/llvm6/lib'
let g:clang_library_path='/opt/toolchain/llvm6/lib/libclang.so.6.0'

"To close automatically the preview window after cautocomplete is done
autocmd CompleteDone * pclose

"configuring netrw
let g:netrw_liststyle = 3
let Tlist_Use_Right_Window=1

""""""""""""""""""""""""""
""""""""""MACROS""""""""""
""""""""""""""""""""""""""

"highlight spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

map <F2> <ESC>:exec &mouse!=""? "set mouse=" : "set mouse=nv"<CR>
map <F3> :Lex<cr>
nmap <F4> :TagbarToggle<CR>

:nnoremap <C-Right> :bnext<CR>
:nnoremap <C-Left> :bprevious<CR>
:nnoremap <C-X> :bdelete<CR>


"Autocomplete macro
inoremap <expr> <C-n> deoplete#mappings#manual_complete()

"Open definition in a new tab
:nmap <c-\> :tab tag <c-r><c-w><cr>

