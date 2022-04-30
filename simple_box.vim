func! TestMe() range
  let l:newfirst = a:firstline + 1
  let l:newlast = a:lastline + 1
  set ve=all
  call setpos('.', [0, a:firstline, 1, 0])
  norm 0O#  +
  norm lv77|r-A+
  exec l:newfirst . "," . l:newlast . " norm 0i#  | \<esc>78|i|"
  call setpos('.', [0, l:newlast, 1, 0])
  exec "norm o\<esc>0i#  +"
  norm lv77|r-A+
  set ve=
endfunc

func! DrawBox() range
  let l:upperleft = getpos("'<")
  let l:lowerright = getpos("'>")
  let l:toprow = l:upperleft[1]
  let l:leftcol = l:upperleft[2] + l:upperleft[3]
  let l:bottomrow = l:lowerright[1]
  let l:rightcol = l:lowerright[2] + l:lowerright[3]
  exec "norm " . l:toprow . "G"
  exec "norm " . l:leftcol . "|"
  norm r+
  exec "norm lv" . l:rightcol . "|r-"
  exec "norm " . l:rightcol . "|r+"
  exec "norm " . l:bottomrow . "G"
  exec "norm " . l:leftcol . "|"
  norm r+
  exec "norm lv" . l:rightcol . "|r-"
  exec "norm " . l:rightcol . "|r+"
  exec (l:toprow + 1) . "," (l:bottomrow -1) . " norm " . l:leftcol . "|r|" . l:rightcol ."|r|"
endfunc
vnoremap <silent> _db :call DrawBox()<cr>
