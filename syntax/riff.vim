" Riff syntax file
" match is used instead of keyword in many places since the language
" allows numeric literals to precede keywords/identifiers with no
" whitespace in-between.

if exists("b:current_syntax")
    finish
endif

let b:current_syntax = "riff"

let s:cpo_save = &cpo
set cpo&vim

" Generic todo just because
syn keyword riffTodo        contained TODO

" Comments
syn match   riffComment     "//.*$" contains=riffTodo
syn region  riffComment     start="/\*" end="\*/" contains=riffTodo

" null
syn match   riffConstant    "null\>"

" Special characters
syn match   riffSpecialChar display contained #\\[\\abefnrtv'"]\|\\x[[:xdigit:]]\{2}\|\\[[:digit:]]\{,3}#

" Format modifiers and specifiers in strings
syn match   riffFormat      display contained "%[- 0]*\(\*\|\d*\)\=\(\.\(\d*\|\*\)\=\)\=[aAcdeEfgiosxX]"
syn match   riffFormat      display contained "%%"

" Strings
syn region  riffString      start=+"+ end=+"+ contains=riffFormat,riffSpecialChar

" Character literals
syn match   riffCharacter   "'[^\\]'"
syn match   riffCharacter   "'[^']*'" contains=riffSpecialChar

" Numbers
syn match   riffNumber      "\<\d\+"
syn match   riffNumber      "\<0[xX]\x*"
syn match   riffNumber      "\<0[bB][01]*"

" Floats
syn match   riffFloat       "\<\d\+\.\d\+"
syn match   riffFloat       "\.\d\+"
syn match   riffFloat       "\<0[xX]\x\+\.\x\+"
syn match   riffFloat       "\<0[xX].\x\+"

" Identifiers
" Hack to allow reserved keywords and functions to override this rule,
" which allows greater control than just using keyword.
syn match   riffIdentifier  "[a-zA-Z]\+\w*\>"

" Hack to prevent something like `.5` in `1..5` from being highlighted
" as a float. Using Special instead of Operator avoids having to
" define every single operator, which is what every other syntax file
" also seems to avoid.
syn match   riffSpecial     "\.\."

" Library functions
syn match   riffFunction    "abs\>\|atan\>\|ceil\>\|cos\>\|exp\>\|int\>\|log\>\|sin\>\|sqrt\>\|tan\>"
syn match   riffFunction    "rand\>\|srand\>"
syn match   riffFunction    "byte\>\|char\>\|fmt\>\|hex\>\|lower\>\|num\>\|split\>\|upper/>"

" Keywords
syn match   riffStatement   "break\>\|continue\>\|exit\>\|fn\>\|local\>\|print\>\|return\>"
syn match   riffConditional "if\>\|else\>"
syn match   riffRepeat      "do\>\|for\>\|while\>"
syn match   riffOperator    "in\>"

hi def link riffComment     Comment
hi def link riffConstant    Constant
hi def link riffFormat      SpecialChar
hi def link riffString      String
hi def link riffCharacter   Character
hi def link riffNumber      Number
hi def link riffFloat       Float
hi def link riffIdentifier  Identifier
hi def link riffFunction    Function
hi def link riffStatement   Statement
hi def link riffConditional Conditional
hi def link riffRepeat      Repeat
hi def link riffOperator    Operator
hi def link riffSpecial     Special
hi def link riffSpecialChar SpecialChar
hi def link riffTodo        Todo
