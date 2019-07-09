runtime! syntax/elixir.vim

syntax match skitterOperator "\~>"
syntax match skitterOperator "<\~"

syntax keyword skitterDefine defcomponent defworkflow defhandler
syntax keyword skitterDefine handler fields

highlight default link skitterDefine            elixirDefine
highlight default link skitterOperator          elixirOperator
highlight default link skitterPseudoVariable    elixirPseudoVariable
