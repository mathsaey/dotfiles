syntax match elixirCustomOperators "<-" conceal cchar=←
syntax match elixirCustomOperators "->" conceal cchar=→

syntax match elixirCustomOperators "==" conceal cchar=≡
syntax match elixirCustomOperators "!=" conceal cchar=≠
syntax match elixirCustomOperators "<=" conceal cchar=≤
syntax match elixirCustomOperators ">=" conceal cchar=≥

highlight  link elixirCustomOperators Operator
highlight! link Conceal Operator
