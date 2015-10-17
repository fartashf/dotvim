" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
set ttymouse=xterm2
"set mouse=""

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

call pathogen#infect()
call pathogen#helptags()

set sw=4
set ts=4
set hlsearch
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
"set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=+1

" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
" nnoremap j gj
" nnoremap k gk

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

nmap <leader>a <Esc>:Ack!
map <leader>u :GundoToggle<CR>
map <leader>n :NERDTreeToggle<CR>
map <leader>td <Plug>TaskList
" To work with syntastic
let g:pymode_lint=0
" let g:pymode_lint_write=0
" map <leader>8 :PymodeLint<CR>
" map <leader>A :PymodeLintAuto<CR>

" pymode
" Don't look up if you don't find .ropeproject. Run :PymodeRopeNewProject
" autocomplete with pymode is slow and with ropevim there is a bug when you
" remove all chars until the dot.
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0
" autocmd FileType python set omnifunc=RopeCompleteFunc
" let ropevim_vim_completion=1
" let ropevim_extended_complete=1
" autocmd FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
" controls the popup window and preview of the function
set completeopt=menuone,longest,preview

"set statusline=%{fugitive#statusline()}

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
map <leader>8 :SyntasticCheck<CR>
map <leader>e :Errors<CR>
let g:syntastic_auto_jump=3
map <leader>A :!autopep8 --in-place %<CR>
map <leader>y my{v}"+y`y
map <leader>p {v}"+p
" if &diff
"     let g:pymode_folding=0
" endif

function! s:Copy2IPython()
    let l:save_cursor = getpos('.')
    normal! {
    let start_line = line(".")
    normal! }
    let end_line = line(".")
    if getline(start_line) =~ '^\s*$' && start_line != cur_line
        let start_line = start_line + 1
    endif
    if getline(end_line) =~ '^\s*$' && end_line != cur_line
        let end_line = end_line - 1
    endif
    if ! ( start_line <= cur_line && cur_line <= end_line)
        echo "Not a block"
    endif 
    " normal! 
    call setpos('.', l:save_cursor)
    " "+y`y
endfunction

" map <leader>y :Copy2IPython()<CR>
let g:syntastic_python_flake8_exec = '~/.local/bin/flake8'
let g:syntastic_python_pep8_exec = '~/.local/bin/pep8'
let g:syntastic_python_pylint_exec = '~/.local/bin/pylint'
