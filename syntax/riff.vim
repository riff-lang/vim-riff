if exists("b:current_syntax")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

" Generic todo just because
syn keyword riffTodo        TODO

" Comments
syn match   riffComment     "//.*$" contains=riffTodo
syn region  riffComment     start="/\*" end="\*/" contains=riffTodo

" null
syn keyword riffConstant    null

" Special characters
syn match   riffSpecial     display contained #\\[\\abefnrtv'"]\|\\x[[:xdigit:]]\{2}\|\\[[:digit:]]\{,3}#

" Strings
syn region  riffString      start=+"+ end=+"+ contains=riffSpecial

" Character literals
syn match   riffCharacter   "'[^\\]'"
syn match   riffCharacter   "'[^']*'" contains=riffSpecial

" Numbers
syn match   riffNumber      "\<\d\+\>"
syn match   riffNumber      "\<0[xX]\x\+\>"
syn match   riffNumber      "\<0[bB][01]\+\>"

" Floats
syn match   riffFloat       "\<\d\+\.\d*\>"
syn match   riffFloat       "\.\d\+\>"
syn match   riffFloat       "\<0[xX]\x\+\.\x*\>"
syn match   riffFloat       "\<0[xX].\x\+\>"

" Library functions
syn keyword riffFunction    abs atan ceil cos exp int log sin sqrt tan
syn keyword riffFunction    rand srand
syn keyword riffFunction    byte char hex lower split upper

" Keywords
syn keyword riffStatement   break continue exit fn local print return
syn keyword riffConditional if else
syn keyword riffRepeat      do for while
syn keyword riffOperator    in

hi def link riffComment     Comment
hi def link riffConstant    Constant
hi def link riffString      String
hi def link riffCharacter   Character
hi def link riffNumber      Number
hi def link riffFloat       Float
hi def link riffFunction    Function
hi def link riffStatement   Statement
hi def link riffConditional Conditional
hi def link riffRepeat      Repeat
hi def link riffOperator    Operator
hi def link riffSpecial     SpecialChar
hi def link riffTodo        Todo
