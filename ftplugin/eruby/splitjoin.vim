if !exists('b:splitjoin_split_callbacks')
  let b:splitjoin_split_callbacks = [
        \ 'sj#html#SplitTags',
        \ 'sj#eruby#SplitIfClause',
        \ 'sj#ruby#SplitOptions',
        \ ]
endif


if !exists('b:splitjoin_join_callbacks')
  let b:splitjoin_join_callbacks = [
        \ 'sj#eruby#JoinIfClause',
        \ 'sj#ruby#JoinHash',
        \ 'sj#html#JoinTags',
        \ ]
endif
