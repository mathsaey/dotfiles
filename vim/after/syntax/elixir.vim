syntax match elixirCustomOperators "<-" conceal cchar=←
syntax match elixirCustomOperators "->" conceal cchar=→

syntax match elixirCustomOperators "==" conceal cchar=≡
syntax match elixirCustomOperators "!=" conceal cchar=≠
syntax match elixirCustomOperators "<=" conceal cchar=≤
syntax match elixirCustomOperators ">=" conceal cchar=≥

highlight  link elixirCustomOperators Operator
highlight! link Conceal Operator

" Docstrings are causing some issues, try to fix with this.
syntax sync fromstart

" Skitter support
syntax match skitterOperator "\~>"
syntax match skitterOperator "\~>>"
syntax match skitterOperator "<\~"

syntax keyword skitterDefine defcomponent defworkflow defstrategy
syntax keyword skitterDefine defcb defhook

highlight default link skitterDefine            elixirDefine
highlight default link skitterOperator          elixirOperator
