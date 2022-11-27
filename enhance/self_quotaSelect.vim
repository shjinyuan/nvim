"{Vimscript} (Study) 2
"v:count,"v:event"
"v:stderr v:char
"123--->{ 40--->(
" 91--->[ 34--->"
" 39--->'
" getchar()--->number
" nr2char()--->char
function! CopyX()
  if( col("v")>col(".") )
    echo col("v")  col(".") 
    let l1=col(".")
    let l2=col("v")
  else
    echo col("v")  col(".") 
    let l1=col("v")
    let l2=col(".")
  endif
  call setreg('x',getline('.')[l1-1:l2-1])
  return ''
endfunction
" . is used to combine the commands; "c" means "change"
vnoremap <expr><C-l> CopyX()."c"
      \.AddParenthese(getchar())."<Esc>"
function! AddParenthese(n)
  if a:n==123
    return "{".getreg('x')."}"
  elseif a:n==40
    return "(".getreg('x').")"
  elseif a:n==91
    return "[".getreg('x')."]"
  elseif a:n==34
    return "\"".getreg('x')."\""
  elseif a:n== 39
    return "'".getreg('x')."'"
  endif
endfunction

nnoremap <space> :<C-U>call
      \ QuotesSelect(v:count)<CR>
function! QuotesSelect(n)
  let buf=getline(".")
  let c=buf[col(".")-1]
  if( c is "'" || c is "\"" )
    if( a:n==1 )
      call execute("normal! vF".c)
    else
      call execute("normal! vf".c)
    endif
  else
    normal %
  endif
endfunction

" autocmd InsertCharPre * call MagicInput(v:char)
" function! MagicInput(ch)
  " if a:ch is# 'f'
    " let v:char="function! MagicInput()"
  " endif
" endfunction
