" TODO doesn't work well for several tags on a single line
function! sj#html#SplitTags()
  let line = getline('.')
  let tag_regex = '\(<.\{-}>\)\(.*\)\(<\/.\{-}>\)'

  if line =~ tag_regex
    call sj#ReplaceMotion('V', substitute(line, tag_regex, '\1\n\2\n\3', ''))
    return 1
  else
    return 0
  endif
endfunction

" Needs to be called with the cursor on a starting or ending tag to work.
function! sj#html#JoinTags()
  if searchpair('<', '', '>', 'cb', '', line('.')) <= 0
        \ && searchpair('<', '', '>', 'c', '', line('.')) <= 0
    " then we're pretty sure there's no tag under the cursor
    return 0
  endif

  let body = sj#GetMotion('vit')

  if line("'<") == line("'>")
    " then it's just one line, ignore
    return 0
  endif

  let body = sj#Trim(body)
  let body = join(map(split(body, "\n"), 'sj#Trim(v:val)'), ' ')

  call sj#ReplaceMotion('vit', body)

  return 1
endfunction
