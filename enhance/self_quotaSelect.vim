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

" nnoremap <space>s :<C-U>call
      " \ QuotesSelect(v:count)<CR>
" function! QuotesSelect(n)
  " let buf=getline(".")
  " let c=buf[col(".")-1]
  " if( c is "'" || c is "\"" )
    " if( a:n==1 )
      " call execute("normal! vF".c)
    " else
      " call execute("normal! vf".c)
    " endif
  " else
    " normal %
  " endif
" endfunction
"

noremap <expr>s Mat()
function! Mat()
  let buf=getline(".")
  let q1=0
  let q2=0
  let p1=0
  let p2=0
  let n=0
  let qlist=[]
  while 1
    let c=buf[n]
    if c is ''
      break
    endif
    if c is '"'
      let q1+=1
      if q1%2==0
        call add(qlist,p1)
        call add(qlist,n)
        if p2>p1
          let q2=0
        endif
      endif
      let p1=n
    elseif c is "'"
      let q2+=1
      if q2%2==0
        call add(qlist,p2)
        call add(qlist,n)
        if p1>p2
          let q1=0
        endif
      endif
      let p2=n
    endif
    let n+=1
  endwhile
  let md=mode()
  if md is# 'v'
    let mf=''
    let oft=1
  elseif md is# 'n'
    let mf='v'
    let oft=0
  else
    return ''
  endif
  let bpos=col("v")-1
  let epos=col(".")-1
  let endl=col("$")-2
  let f1=0
  let f2=0
  let f3=0
  let f4=0
  let n=oft
  while bpos-n>=0
    let c=buf[bpos-n]
    if c is ')' && n>0
      let f1-=1
    elseif c is '('
      let f1+=1
      if f1==1
        let m=oft
        while m+epos<=endl
          let s=buf[m+epos]
          if s is '(' && m>0
            let f1+=1
          elseif s is ')'
            let f1-=1
            if f1==0
              if m==0
                return printf("v%dho",n)
              elseif n==0
                return printf("v%dl",m)
              else
                return printf(mf."%dlo%dho",m,n)
              endif
            endif
          elseif s is '"' || s is "'"
            let k=0
            for item in qlist
              if epos+m==item
                if k%2
                  return printf(mf."%dlo%dho",item-epos,bpos-qlist[k-1])
                else
                  let m+=qlist[k+1]-item
                endif
                break
              endif
              let k+=1
            endfor
          endif
          let m+=1
        endwhile
      endif
    elseif c is ']' && n>0
      let f2-=1
    elseif c is '['
      let f2+=1
      if f2==1
        let m=oft
        while m+epos<=endl
          let s=buf[m+epos]
          if s is '[' && m>0
            let f2+=1
          elseif s is ']'
            let f2-=1
            if f2==0
              if m==0
                return printf("v%dho",n)
              elseif n==0
                return printf("v%dl",m)
              else
                return printf(mf."%dlo%dho",m,n)
              endif
            endif
          elseif s is '"' || s is "'"
            let k=0
            for item in qlist
              if epos+m==item
                if k%2
                  return printf(mf."%dlo%dho",item-epos,bpos-qlist[k-1])
                else
                  let m+=qlist[k+1]-item
                endif
                break
              endif
              let k+=1
            endfor
          endif
          let m+=1
        endwhile
      endif
    elseif c is '}' && n>0
      let f3-=1
    elseif c is '{'
      let f3+=1
      if f3==1
        let m=oft
        while m+epos<=endl
          let s=buf[m+epos]
          if s is '{' && m>0
            let f3+=1
          elseif s is '}'
            let f3-=1
            if f3==0
              if m==0
                return printf("v%dho",n)
              elseif n==0
                return printf("v%dl",m)
              else
                return printf(mf."%dlo%dho",m,n)
              endif
            endif
          elseif s is '"' || s is "'"
            let k=0
            for item in qlist
              if epos+m==item
                if k%2
                  return printf(mf."%dlo%dho",item-epos,bpos-qlist[k-1])
                else
                  let m+=qlist[k+1]-item
                endif
                break
              endif
              let k+=1
            endfor
          endif
          let m+=1
        endwhile
      endif
    elseif c is '>' && n>0
      let f4-=1
    elseif c is '<'
      let f4+=1
      if f4==1
        let m=oft
        while m+epos<=endl
          let s=buf[m+epos]
          if s is '<' && m>0
            let f4+=1
          elseif s is '>'
            let f4-=1
            if f4==0
              if m==0
                return printf("v%dho",n)
              elseif n==0
                return printf("v%dl",m)
              else
                return printf(mf."%dlo%dho",m,n)
              endif
            endif
          elseif s is '"' || s is "'"
            let k=0
            for item in qlist
              if epos+m==item
                if k%2
                  return printf(mf."%dlo%dho",item-epos,bpos-qlist[k-1])
                else
                  let m+=qlist[k+1]-item
                endif
                break
              endif
              let k+=1
            endfor
          endif
          let m+=1
        endwhile
      endif
    elseif c is '"' || c is "'"
      if n==0
        let k=0
        for item in qlist
          if epos==item
            if k%2
              return printf("v%dho",epos-qlist[k-1])
            else
              return printf("v%dl",qlist[k+1]-epos)
            endif
          endif
          let k+=1
        endfor
      else
        let k=0
        for item in qlist
          if bpos-n==item
            if k%2
              let n+=item-qlist[k-1]
            else
              return printf(mf."%dlo%dho",qlist[k+1]-epos,bpos-item)
            endif
            break
          endif
          let k+=1
        endfor
      endif
    endif
    let n+=1
  endwhile
  return ''
endfunction
