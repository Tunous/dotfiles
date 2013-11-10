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
set background=dark

let s:C = {}

let s:C.none    = ['NONE', 'NONE']

" Dark backgrounds
let s:C.base03  = ['#262626', '235']
let s:C.base02  = ['#303030', '236']

" Dark folds
let s:C.base01  = ['#425054', '238']

" Normal text | Dark ▾ Light /\
let s:C.base00  = ['#5E6C70', '241']
let s:C.base0   = ['#829496', '245']
  let s:C.base0  = ['#c4c8c6', '247']

" Light folds
let s:C.base1   = ['#93A1A1', '250']

" Light backgrounds
let s:C.base2   = ['#FDF6E3', '254']
let s:C.base3   = ['#EEE8D5', '253']

if &background == "dark"
  let s:C.bgN = s:C.base03
  let s:C.bgH = s:C.base02

  let s:C.fgN = s:C.base0
  let s:C.fgD = s:C.base00
  let s:C.fgV = s:C.base01
elseif &background == "light"
  " TODO: Need to find better colors. I don't like these
  let s:C.bgN = s:C.base3
  let s:C.bgH = s:C.base2

  " TODO: Basic text needs to be darker
  let s:C.fgN = s:C.base00
  let s:C.fgD = s:C.base0
  let s:C.fgV = s:C.base1
endif

let s:C.Yellow      = ['#af8700', '136']
let s:C.Orange      = ['#d75f00', '166']
let s:C.Red         = ['#af0000', '124']
let s:C.Magenta     = ['#d33682', '125']
let s:C.Violet      = ['#6c71c4', '61']
let s:C.Blue        = ['#0087af', '31']
let s:C.Cyan        = ['#2aa198', '37']
let s:C.Green       = ['#719e07', '??']
let s:C.Green       = ['#87af00', '106']

let s:C.DarkRed     = ['#420f0e', '0']
let s:C.DarkGreen   = ['#212f02', '0']
let s:C.DarkYellow  = ['#362900', '0']
let s:C.DarkBlue    = ['#0b293f', '0']

" }}}
" Highlighting function {{{

function! s:HL(group, ...)
  " Arguments: group, guifg, guibg, gui, guisp
  let histring = 'hi ' . a:group . ' '

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

call s:HL('Normal'            , 'fgN'    , 'bgN'  , 'none')

call s:HL('Folded'            , 'fgV'    , 'none' , 'none')

call s:HL('VertSplit'         , 'fgD'    , 'bgH'  , 'none')

call s:HL('CursorLine'        , 'none'   , 'bgH'  , 'none')
call s:HL('CursorColumn'      , 'none'   , 'bgH'  , 'none')
call s:HL('ColorColumn'       , 'none'   , 'bgH'  , 'none')

call s:HL('TabLine'           , 'fgD'    , 'bgN'  , 'underline')
call s:HL('TabLineFill'       , 'fgD'    , 'bgN'  , 'underline')
call s:HL('TabLineSel'        , 'fgN'    , 'none' , 'none')

call s:HL('MatchParen'        , 'Blue'   , 'bgH'  , 'bold')

call s:HL('NonText'           , 'fgV'    , 'none' , 'none')
call s:HL('SpecialKey'        , 'fgV'    , 'none' , 'none')

call s:HL('Visual'            , 'fgN'    , 'fgV'  , 'none')
call s:HL('VisualNOS'         , 'fgN'    , 'fgV'  , 'none')

call s:HL('Search'            , 'Yellow' , 'none' , 'reverse')
call s:HL('IncSearch'         , 'Orange' , 'none' , 'none')

call s:HL('StatusLine'        , 'fgV'    , 'bgN'  , 'reverse')
call s:HL('StatusLineNC'      , 'bgH'    , 'fgN'  , 'reverse')

call s:HL('WildMenu'          , 'Green'  , 'bgN'  , 'underline')

call s:HL('Directory'         , 'Blue'   , 'none' , 'none')
hi! link Directory Identifier

call s:HL('Title'             , 'Green'  , 'none' , 'none')

"call s:HL('ErrorMsg', 'Red', 'none', 'reverse')
"call s:HL('MoreMsg', 'st Bold')
"call s:HL('MoreMsg')
"call s:HL("ModeMsg")
"call s:HL("Question")
"call s:HL('WarningMsg')

"call s:HL('Tag')

"}}}
" Gutter {{{

call s:HL('LineNr'      , 'fgD' , 'none')
call s:HL('CursorLineNr', 'fgD' , 'bgH', 'none')
call s:HL('SignColumn'  , 'fgD' , 'bgH')
call s:HL('FoldColumn'  , 'fgD' , 'bgH')

" }}}
" Cursor {{{

call s:HL('Cursor', 'fgN', 'bgN', 'reverse')
"call s:hl('vcursor', 'coal', 'tardis', 'bold')
"call s:HL('iCursor', 'coal', 'tardis', 'none')

" }}}
" Syntax highlighting {{{

call s:HL('Comment',      'fgD')
"       *Comment          any comment

call s:HL('Constant',     'Green')
"       *Constant         any constant
"        String           a string constant "this is a string"
"        Character        a character constant: 'c', '\n'
"        Number           a number constant: 234, 0xff
"        Boolean          a boolean constant: TRUE, false
"        Float            a floating point constant: 2.3e10

call s:HL('Identifier',   'Blue')
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

call s:HL('Underlined',   'Violet'   , 'none', 'underline')
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

call s:HL('Pmenu'      , 'fgN' , 'bgH'     , 'none')
call s:HL('PmenuSel'   , 'bgN' , 'Green'   , 'bold')
call s:HL('PmenuSbar'  , 'none'    , 'bgN')
call s:HL('PmenuThumb' , 'none'    , 'bgH')
" }}}
" Diffs {{{

call s:HL('DiffDelete' , 'Red'    , 'DarkRed' , 'none')
call s:HL('DiffAdd'    , 'Green'  , 'DarkGreen' , 'none')
call s:HL('DiffChange' , 'Yellow' , 'DarkYellow' , 'none')
call s:HL('DiffText'   , 'Blue'   , 'DarkBlue' , 'none')

" }}}
" Spelling {{{

if has("spell")
  call s:HL('SpellCap'   , 'none' , 'none' , 'undercurl', 'Blue')
  call s:HL('SpellBad'   , 'none' , 'none' , 'undercurl', 'Red')
  call s:HL('SpellLocal' , 'none' , 'none' , 'undercurl', 'Cyan')
  call s:HL('SpellRare'  , 'none' , 'none' , 'undercurl', 'Magenta')
endif

" }}}

" vim:foldmethod=marker: foldlevel=0
