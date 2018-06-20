syntax match elixirCustomOperators "<-" conceal cchar=←
syntax match elixirCustomOperators "->" conceal cchar=→

syntax match elixirCustomOperators "==" conceal cchar=≡
syntax match elixirCustomOperators "!=" conceal cchar=≠
syntax match elixirCustomOperators "<=" conceal cchar=≤
syntax match elixirCustomOperators ">=" conceal cchar=≥

highlight  link elixirCustomOperators Operator
highlight! link Conceal Operator

" Special highlighting for skitter
syntax keyword elixirCustomSkitterKeyword state
syntax keyword elixirCustomSkitterDefine  effect fields

highlight default link elixirCustomSkitterKeyword Identifier
highlight default link elixirCustomSkitterDefine  Define

