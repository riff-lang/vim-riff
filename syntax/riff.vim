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

" Shebang (first line)
syn match   riffComment     "\%^#!.*$"

" Special characters
syn match   riffSpecialChar display contained "\\[\\abefmnrtv'"]\|\\x\x\{,2}\|\\\d\{,3}"
syn match   riffSpecialChar display contained "\\u\x\{,4}\|\\U\x\{,8}"

" Format modifiers and specifiers in strings
syn match   riffFormat      display contained "%[-+ 0]*\(\*\|\d*\)\=\(\.\(\d*\|\*\)\=\)\=[aAbcdeEfFgGiosxX]"
syn match   riffFormat      display contained "%%"

" Strings
syn region  riffString      start=+"+ end=+"+ contains=riffFormat,riffSpecialChar

" Character literals
syn match   riffCharacter   "'[^\\]'"
syn match   riffCharacter   "'[^']*'" contains=riffSpecialChar

" Decimal, hex integers
syn match   riffNumber      "\<\d[[:digit:]_]*"
syn match   riffNumber      "\<0[xX][[:xdigit:]_]*"

" Floats
syn match   riffFloat       "\.\=\d[[:digit:]_]*\([eE][+-]\=\d[[:digit:]_]*\)\="
syn match   riffFloat       "\<\(\d[[:digit:]_]*\)\=\.\d[[:digit:]_]*\([eE][+-]\=\d[[:digit:]_]*\)\="
syn match   riffFloat       "\<0[xX][[:xdigit:]_]*\.\=\x[[:xdigit:]_]*\([pP][+-]\=\d[[:digit:]_]*\)\="

" Binary integers
syn match   riffNumber      "\<0[bB][01_]*"

" Identifiers
" Hack to allow reserved keywords and functions to override this rule,
" which allows greater control than just using keyword.
syn match   riffIdentifier  "\a\w*\>"

" null
syn match   riffConstant    "null\>"

" Predefined variables
syn match   riffConstant    "stdin\>\|stdout\>\|stderr\>"
syn match   riffConstant    "arg\>"

" Hack to prevent something like `.5` in `1..5` from being highlighted
" as a float. Using Special instead of Operator avoids having to
" define every single operator, which is what every other syntax file
" also seems to avoid.
syn match   riffSpecial     "\.\."

" Library functions
syn match   riffFunction    "abs\>\|atan\>\|ceil\>\|cos\>\|exp\>\|int\>\|log\>\|sin\>\|sqrt\>\|tan\>"
syn match   riffFunction    "close\>\|eof\>\|eval\>\|flush\>\|get\>\|getc\>\|open\>\|print\>\|printf\>\|putc\>\|read\>\|write\>"
syn match   riffFunction    "rand\>\|srand\>"
syn match   riffFunction    "byte\>\|char\>\|fmt\>\|gsub\>\|hex\>\|lower\>\|num\>\|split\>\|sub\>\|type\>\|upper\>"
syn match   riffFunction    "clock\>\|exit\>"

" Keywords
syn match   riffStatement   "break\>\|continue\>\|fn\>\|local\>\|return\>"
syn match   riffConditional "elif\>\|else\>\|if\>"
syn match   riffRepeat      "do\>\|for\>\|loop\>\|while\>"
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
