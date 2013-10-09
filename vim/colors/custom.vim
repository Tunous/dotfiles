" Name:     ...
" Author:   ...
" URL:      ...
" License:  ...
" Created:  ...
" Modified: ...

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "custom"

" Normal:     #829496
" Background: #192224
" Grey0:      #5E6C70
" Yellow:     #A1A6A8
" Blue:       #43b3e0
" LightBack:  #222E30

"{{{
"hi Constant       guifg=#A1A6A8     guibg=NONE     guisp=NONE     gui=NONE
  "hi link String Constant
  "hi link Character Constant
  "hi link Number Constant
  "hi link Boolean Constant
  "hi link Float Constant
  "hi String       guifg=     guibg=     guisp=     gui=NONE
  "hi Character    guifg=     guibg=     guisp=     gui=NONE
  "hi Number       guifg=     guibg=     guisp=     gui=NONE
  "hi Boolean      guifg=     guibg=     guisp=     gui=NONE
  "hi Float        guifg=     guibg=     guisp=     gui=NONE
"hi Identifier     guifg=     guibg=     guisp=     gui=NONE
  "hi Function     guifg=     guibg=     guisp=     gui=NONE
"hi Statement      guifg=     guibg=     guisp=     gui=NONE
  "hi Conditional  guifg=     guibg=     guisp=     gui=NONE
  "hi Repeat       guifg=     guibg=     guisp=     gui=NONE
  "hi Label        guifg=     guibg=     guisp=     gui=NONE
  "hi Operator     guifg=     guibg=     guisp=     gui=NONE
  "hi Keyword      guifg=     guibg=     guisp=     gui=NONE
  "hi Exception    guifg=     guibg=     guisp=     gui=NONE
"hi PreProc        guifg=     guibg=     guisp=     gui=NONE
  "hi Include      guifg=     guibg=     guisp=     gui=NONE
  "hi Define       guifg=     guibg=     guisp=     gui=NONE
  "hi Macro        guifg=     guibg=     guisp=     gui=NONE
  "hi Precondit    guifg=     guibg=     guisp=     gui=NONE
"hi Type           guifg=     guibg=     guisp=     gui=NONE
  "hi StorageClass guifg=     guibg=     guisp=     gui=NONE
  "hi Structure    guifg=     guibg=     guisp=     gui=NONE
  "hi Typedef      guifg=     guibg=     guisp=     gui=NONE
"hi Special        guifg=     guibg=     guisp=     gui=NONE
  "hi SpecialChar  guifg=     guibg=     guisp=     gui=NONE
  "hi Tag          guifg=     guibg=     guisp=     gui=NONE
  "hi Delimiter    guifg=     guibg=     guisp=     gui=NONE
  "hi SpecialComment guifg=   guibg=     guisp=     gui=NONE
  "hi Debug        guifg=     guibg=     guisp=     gui=NONE
"hi Underlined     guifg=     guibg=     guisp=     gui=NONE
"hi Ignore         guifg=     guibg=     guisp=     gui=NONE
"hi Error          guifg=     guibg=     guisp=     gui=NONE
"hi Todo           guifg=     guibg=     guisp=     gui=NONE
"}}}

" General colors
hi! Normal         guifg=#829496     guibg=#192224     guisp=NONE        gui=NONE
hi! Cursor         guifg=#192224     guibg=#829496     guisp=#829496     gui=NONE
hi! CursorLine     guifg=NONE        guibg=#222E30     guisp=#222E30     gui=NONE
hi! LineNr         guifg=#5E6C70     guibg=#222E30     guisp=NONE        gui=NONE
hi! StatusLine     guifg=grey        guibg=#192224     guisp=#192224     gui=Reverse
hi! VertSplit      guifg=#222E30     guibg=NONE        guisp=NONE        gui=Bold
hi! Folded         guifg=#829496     guibg=#222E30     guisp=#222E30     gui=Bold,Underline
hi! Title          guifg=NONE        guibg=NONE        guisp=NONE        gui=Bold
hi! Visual         guifg=#192224     guibg=#5E6C70     guisp=#5E6C70     gui=NONE

hi! link           SpecialKey        Special
hi! link           NonText           Comment
hi! link           CursorColumn      CursorLine
hi! link           CursorLineNr      Normal
hi! link           CursorIM          Cursor
hi! link           StatusLineNC      WildMenu

" Syntax highlighting
hi! Comment        guifg=#5E6C70     guibg=NONE     guisp=NONE     gui=Italic
hi! Todo           guifg=#87d787     guibg=NONE     guisp=NONE     gui=Bold
hi! Boolean        guifg=#A1A6A8     guibg=NONE     guisp=NONE     gui=NONE
hi! String         guifg=#43b3e0     guibg=NONE     guisp=NONE     gui=NONE
hi! Identifier     guifg=Yellow      guibg=NONE     guisp=NONE     gui=NONE
hi! Function       guifg=#536991     guibg=NONE     guisp=NONE     gui=Bold
hi! Type           guifg=#536991     guibg=NONE     guisp=NONE     gui=Bold
hi! Statement      guifg=#c27023     guibg=NONE     guisp=NONE     gui=Bold
hi! Keyword        guifg=#BD9800     guibg=NONE     guisp=NONE     gui=Bold
hi! Constant       guifg=#A1A6A8     guibg=NONE     guisp=NONE     gui=NONE
hi! Number         guifg=#48a858     guibg=NONE     guisp=NONE     gui=NONE
hi! Special        guifg=#194a54     guibg=NONE     guisp=NONE     gui=Bold
hi! PreProc        guifg=#BD9800     guibg=NONE     guisp=NONE     gui=NONE

" Poup-up menu
hi! link           PMenu             LineNr
hi! link           PMenuSel          Cursor
hi! link           PMenuThumb        PMenuSel
hi! link           PMenuSbar         PMenu

" Diff mode
hi! DiffAdd        guifg=#719e07     guibg=NONE     guisp=#719e07     gui=Bold
hi! DiffChange     guifg=#b58900     guibg=NONE     guisp=#b58900     gui=Bold
hi! DiffDelete     guifg=#dc322f     guibg=NONE     guisp=#dc322f     gui=Bold
hi! DiffText       guifg=#268bd2     guibg=NONE     guisp=#268bd2     gui=Bold

" Spelling errors
hi! SpellBad       guifg=#829496     guibg=NONE        guisp=#dc322f     gui=Undercurl
hi! SpellCap       guifg=#829496     guibg=NONE        guisp=#6c71c4     gui=Undercurl
hi! SpellRare      guifg=#829496     guibg=NONE        guisp=#2aa198     gui=Undercurl
hi! SpellLocal     guifg=#829496     guibg=NONE        guisp=#b58900     gui=Undercurl
hi! WildMenu       guifg=#5E6C70     guibg=#192224     guisp=#192224     gui=Reverse,Bold

hi! Question       guifg=#2aa198     guibg=NONE        guisp=NONE        gui=NONE
hi! ErrorMsg      guifg=#dc322f     guibg=NONE     guisp=#dc322f     gui=NONE
