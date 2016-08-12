set term=builtin_xterm
set modeline
set modelines=2
set mouse=a
set smarttab
set ai
"set cursorline
set t_Co=256
set complete=.,b,u,]
set completeopt=menu,preview
set number
set vb
set ruler
set laststatus=2
set list!
set listchars=tab:»⋅
set scrolloff=2
"set statusline=%F%m%r%h%w\ [%l,%c]\ [%L,%p%%]

let g:airline_powerline_fonts = 1

highlight LineNr ctermfg=red ctermbg=black gui=bold
"highlight StatusLine ctermbg=7 ctermfg=238
"highlight StatusLineNC ctermbg=7 ctermfg=238
filetype plugin indent on
syntax on


function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d ft=%s %set :", &tabstop, &shiftwidth, &textwidth, &filetype, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction

nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

" vim: set ts=2 sw=2 ft=vim et :
