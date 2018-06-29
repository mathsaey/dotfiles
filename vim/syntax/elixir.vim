syntax match elixirCustomOperators "<-" conceal cchar=←
syntax match elixirCustomOperators "->" conceal cchar=→

syntax match elixirCustomOperators "==" conceal cchar=≡
syntax match elixirCustomOperators "!=" conceal cchar=≠
syntax match elixirCustomOperators "<=" conceal cchar=≤
syntax match elixirCustomOperators ">=" conceal cchar=≥

highlight  link elixirCustomOperators Operator
highlight! link Conceal Operator

" Special highlighting for skitter
syntax match elixirCustomSkitterOperator "\~>"
syntax match elixirCustomSkitterOperator "<\~"

syntax keyword elixirCustomSkitterDefine  effect fields
syntax keyword elixirCustomSkitterDefine  init terminate react helper
syntax keyword elixirCustomSkitterDefine  create_checkpoint restore_checkpoint clean_checkpoint

highlight default link elixirCustomSkitterDefine   Define
highlight default link elixirCustomSkitterOperator Operator

