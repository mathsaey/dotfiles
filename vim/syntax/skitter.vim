runtime! syntax/elixir.vim

syntax match skitterOperator "\~>"
syntax match skitterOperator "<\~"

syntax keyword skitterDefine defcomponent defworkflow defhandler
syntax keyword skitterDefine handler fields

highlight default link skitterDefine   Define
highlight default link skitterOperator Operator
