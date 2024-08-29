set smartindent
set ruler
set shiftwidth=4
set number
set encoding=utf-8
set tenc=utf-8
set tabstop=4
set expandtab
set ts=4
au Bufenter *.\(py\) set et

set mouse=an
set hlsearch

syntax enable
"se t_Co=16
"let g:solarized_termcolors=256  
set background=dark  
colorscheme solarized

set viewoptions=cursor
au BufWinLeave *.c,*.cc,*.h,Makefile,*.py,*.md mkview
au BufWinEnter *.c,*.cc,*.h,Makefile,*.py,*.md silent loadview

set makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
set errorformat=%f:%l:\ %m

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'https://github.com/nvie/vim-flake8'
Plugin 'https://github.com/vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'shime/vim-livedown'
Plugin 'psf/black'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " requiredet autoindent

" Show 80 char overlength
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = {'mode': 'passive'}
nnoremap <C-w>l :SyntasticCheck<CR>
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_quiet_messages = {"regex": [
    \ 'invalid-name',
    \ 'too-many-instance-attributes',
    \ 'too-few-public-methods',
    \ 'missing-docstring',
    \ 'missing-module-docstring',
    \ 'missing-class-docstring',
    \ 'missing-function-docstring',
    \ 'consider-using-from-import',
    \ 'bad-continuation',
    \ 'too-many-statements',
    \ 'too-many-arguments',
    \ 'too-many-locals',
    \ 'chained-comparison',
    \ 'too-many-branches',
    \ 'no-member',
    \ 'import-error',
    \ 'arguments-differ',
    \ 'redefined-outer-name',
    \ 'attribute-defined-outside-init',
    \ ]}

let g:vimtex_quickfix_mode = 0

"markdown preview keymap
nnoremap <Leader>mm :LivedownToggle<CR>

"vimtex keymap
nnoremap \lc :VimtexStop<cr>:VimtexClean<cr>

" see :h syntastic-loclist-callback
function! SyntasticCheckHook(errors)
    if !empty(a:errors)
        let g:syntastic_loc_list_height = min([len(a:errors), 10])
    endif
endfunction

set noshowmode
