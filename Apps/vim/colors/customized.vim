" CUSTOMIZED colorscheme

" Supporting code -------------------------------------------------------------
" Initialization {{{

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "customized"

" }}}
" Palette {{{

let s:C = {}

let s:C.none    = ['NONE', 'NONE']

let s:C.background  = ['#262626', '235']
let s:C.currentline = ['#303030', '236']

let s:C.foreground  = ['#9e9e9e', '247']
let s:C.comment     = ['#5e6c70', '241']
let s:C.selection   = ['#425054', '238']

let s:C.Yellow      = ['#af8700', '136']
let s:C.Orange      = ['#d75f00', '166']
let s:C.Red         = ['#af0000', '124']
let s:C.Purple      = ['#6c81c4', '125']
let s:C.Violet      = ['#6c71c4', '61']
let s:C.Blue        = ['#0087af', '31']
let s:C.Cyan        = ['#2aa198', '37']
let s:C.Green       = ['#87af00', '106']

" }}}
" Highlighting function {{{

function! s:HL(group, ...)
  " Arguments: group, guifg, guibg, gui, guisp
  let histring = 'hi! ' . a:group . ' '

  if a:0 >=1 && strlen(a:1)
    let color = get(s:C, a:1)
    let histring .= 'guifg=' . color[0] . ' ctermfg=' . color[1] . ' '
  endif

  if a:0 >=2 && strlen(a:2)
    let color = get(s:C, a:2)
    let histring .= 'guibg=' . color[0] . ' ctermbg=' . color[1] . ' '
  endif

  if a:0 >=3 && strlen(a:3)
    let histring .= 'gui=' . a:3 . ' cterm=' . a:3 . ' '
  endif

  if a:0 >=4 && strlen(a:4)
    let color = get(s:C, a:4)
    let histring .= 'guisp=' . color[0]
  endif

  execute histring
endfunction

" }}}

" Actual colorscheme ----------------------------------------------------------
" General/UI {{{

call s:HL('Normal'       , 'foreground'  , 'background'  , 'none')

call s:HL('Folded'       , 'selection'   , 'none'        , 'none')

call s:HL('VertSplit'    , 'comment'     , 'currentline' , 'none')

call s:HL('CursorLine'   , 'none'        , 'currentline' , 'none')
call s:HL('CursorColumn' , 'none'        , 'currentline' , 'none')
call s:HL('ColorColumn'  , 'none'        , 'currentline' , 'none')

call s:HL('TabLine'      , 'comment'     , 'background'  , 'underline')
call s:HL('TabLineFill'  , 'comment'     , 'background'  , 'underline')
call s:HL('TabLineSel'   , 'foreground'  , 'none'        , 'none')

call s:HL('MatchParen'   , 'Blue'        , 'currentline' , 'bold')

call s:HL('NonText'      , 'selection'   , 'none'        , 'none')
call s:HL('SpecialKey'   , 'selection'   , 'none'        , 'none')

call s:HL('Visual'       , 'foreground'  , 'selection'   , 'none')
call s:HL('VisualNOS'    , 'foreground'  , 'selection'   , 'none')

call s:HL('Search'       , 'Yellow'      , 'none'        , 'reverse')
call s:HL('IncSearch'    , 'Orange'      , 'none'        , 'none')

call s:HL('StatusLine'   , 'selection'   , 'background'  , 'reverse')
call s:HL('StatusLineNC' , 'currentline' , 'foreground'  , 'reverse')

call s:HL('WildMenu'     , 'Green'       , 'background'  , 'underline')

call s:HL('Directory'    , 'Blue'        , 'none'        , 'none')
hi! link Directory Identifier

call s:HL('Title'        , 'Green'       , 'none'        , 'none')

"call s:HL('ErrorMsg', 'Red', 'none', 'reverse')
"call s:HL('MoreMsg', 'st Bold')
"call s:HL('MoreMsg')
"call s:HL("ModeMsg")
"call s:HL("Question")
"call s:HL('WarningMsg')

"call s:HL('Tag')

"}}}
" Gutter {{{

call s:HL('LineNr'      , 'comment' , 'none')
call s:HL('CursorLineNr', 'comment' , 'currentline', 'none')
call s:HL('SignColumn'  , 'comment' , 'currentline')
call s:HL('FoldColumn'  , 'comment' , 'currentline')

" }}}
" Cursor {{{

call s:HL('Cursor', 'foreground', 'background', 'reverse')

" }}}
" Syntax highlighting {{{

call s:HL('Comment',      'comment')
"       *Comment          any comment

call s:HL('Constant',     'Green')
"       *Constant         any constant
"        String           a string constant "this is a string"
"        Character        a character constant: 'c', '\n'
"        Number           a number constant: 234, 0xff
"        Boolean          a boolean constant: TRUE, false
"        Float            a floating point constant: 2.3e10

call s:HL('Identifier',   'Blue', 'none', 'none')
"       *Identifier       any variable name
"        Function         function name (also: methods for classes)

call s:HL('Statement',    'Yellow', 'none' ,'none')
"       *Statement        any statement
"        Conditional      if, then, else, endif, switch, etc.
"        Repeat           for, do, while, etc.
"        Label            case, default, etc.
"        Operator         "sizeof", "+", "*", etc.
"        Keyword          any other keyword
"        Exception        try, catch, throw

call s:HL('PreProc',      'Orange')
"       *PreProc          generic Preprocessor
"        Include          preprocessor #include
"        Define           preprocessor #define
"        Macro            same as Define
"        PreCondit        preprocessor #if, #else, #endif, etc.

call s:HL('Type',         'Yellow', 'none', 'none', 'none')
"        StorageClass     static, register, volatile, etc.
"        Structure        struct, union, enum, etc.
"        Typedef          A typedef

call s:HL('Special',      'Red')
"       *Special          any special symbol
"        SpecialChar      special character in a constant
"        Tag              you can use CTRL-] on this
"        Delimiter        character that needs attention
"        SpecialComment   special things inside a comment
"        Debug            debugging statements

call s:HL('Underlined',   'Violet', 'none', 'underline')
"       *Underlined       text that stands out, HTML links

call s:HL('Ignore',       'none', 'none', 'none')
"       *Ignore           left blank, hidden  |hl-Ignore|

call s:HL('Error',        'Red', 'none')
"       *Error            any erroneous construct

call s:HL('Todo',         'Green'  , 'none', 'bold')
"       *Todo             anything that needs extra attention; mostly the
"                         keywords TODO FIXME and XXX

" }}}
" Completion Menu {{{

call s:HL('Pmenu'      , 'foreground' , 'currentline'  , 'none')
call s:HL('PmenuSel'   , 'background' , 'Green'        , 'bold')
call s:HL('PmenuSbar'  , 'none'       , 'background')
call s:HL('PmenuThumb' , 'none'       , 'currentline')
" }}}
" Diffs {{{

call s:HL('DiffDelete' , 'Red'    , 'currentline'    , 'none')
call s:HL('DiffAdd'    , 'Green'  , 'currentline'  , 'none')
call s:HL('DiffChange' , 'Yellow' , 'currentline' , 'none')
call s:HL('DiffText'   , 'Blue'   , 'currentline'   , 'none')

" }}}
" Spelling {{{

if has("spell")
  call s:HL('SpellCap'   , 'none' , 'none' , 'undercurl', 'Blue')
  call s:HL('SpellBad'   , 'none' , 'none' , 'undercurl', 'Red')
  call s:HL('SpellLocal' , 'none' , 'none' , 'undercurl', 'Cyan')
  call s:HL('SpellRare'  , 'none' , 'none' , 'undercurl', 'Purple')
endif

" }}}

" vim:foldmethod=marker: foldlevel=0
