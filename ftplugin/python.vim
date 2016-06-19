set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

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
map <leader>A :!autopep8 --in-place %<CR>

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
set tw=79
let g:pymode_options_max_line_length = 79
