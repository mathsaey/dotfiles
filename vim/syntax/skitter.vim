runtime! syntax/elixir.vim

syntax match skitterOperator "\~>"
syntax match skitterOperator "<\~"

syntax keyword skitterDefine defcomponent defworkflow defstrategy
syntax keyword skitterDefine strategy fields

highlight default link skitterDefine            elixirDefine
highlight default link skitterOperator          elixirOperator
highlight default link skitterPseudoVariable    elixirPseudoVariable
