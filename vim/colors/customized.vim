" CUSTOMIZED colorscheme

" Supporting code -------------------------------------------------------------
" Initialization {{{

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "customized"

" }}}
" Formatting options {{{

if (has("gui_running"))
  let s:MODE = "gui"
else
  let s:MODE = "cterm"
endif

" }}}
" Palette {{{

let s:C = {}

let s:C.none          = "NONE"

"                              " Temporary table
"                              " ---------------------------
"                              " |    Dark    |   Light    |
"                              " ---------------------------
let s:C.base03  = "#282828"    " | Background |            |
let s:C.base02  = "#303030"    " | Highlights |            |
"                              " |            |            |
let s:C.base01  = "#425054"    " | Folds      |            |
let s:C.base00  = "#5E6C70"    " | Comments   | Body text  |
let s:C.base0   = "#829496"    " | Body text  | Comments   |
let s:C.base1   = "#93A1A1"    " |            | Folds      |
"                              " |            |            |
let s:C.base2   = "#FDF6E3"    " |            | Highlights |
let s:C.base3   = "#EEE8D5"    " |            | Background |
"                              " |-------------------------|

if &background == "dark"
  let s:C.bgN = s:C.base03
  let s:C.bgH = s:C.base02

  let s:C.fgN = s:C.base0
  let s:C.fgD = s:C.base00
  let s:C.fgV = s:C.base01
else
  " TODO: Need to find better colors. I don't like these
  let s:C.bgN = s:C.base3
  let s:C.bgH = s:C.base2

  " TODO: Basic text needs to be darker
  let s:C.fgN = s:C.base00
  let s:C.fgD = s:C.base0
  let s:C.fgV = s:C.base1
endif



let s:C.Yellow      = "#b58900"
let s:C.Orange      = "#cb4b16"
let s:C.Red         = "#dc322f"
let s:C.Magenta     = "#d33682"
let s:C.Violet      = "#6c71c4"
let s:C.Blue        = "#268bd2"
let s:C.Cyan        = "#2aa198"
let s:C.Green       = "#719e07"

" }}}
" Highlighting functions {{{
" Basic function {{{
function! s:HL(group, ...)
  let histring = 'hi! ' .a:group. ' '
  if len(a:group) == 1
    let histring = 'hi! ' .a:group. ' '
  elseif len(a:group) == 2
    let histring = 'hi! ' .a:group[0]. ' '
  endif

  if a:0 >= 1 && strlen(a:1)
    let temparg = split(a:1)
    let arg = s:SHL(temparg, 'fg')
    let histring .= arg
  endif

  if a:0 >= 2 && strlen(a:2)
    let temparg = split(a:2)
    let arg = s:SHL(temparg, 'bg')
    let histring .= arg
  endif

  if a:0 >= 3 && strlen(a:3)
    let temparg = split(a:3)
    let arg = s:SHL(temparg, '')
    let histring .= arg
  endif

  if a:0 >= 4 && strlen(a:4)
    let temparg = split(a:4)
    let arg = s:SHL(temparg, 'sp')
    let histring .= arg
  endif

  "echom histring
  execute histring
endfunction
" }}}
" Helper function {{{
function! s:SHL(arg, id)
  if len(a:arg) == 1
    if a:id !=? ''
      let color = get(s:C, a:arg[0])
      if strlen(color) <= 1
        let color = a:arg[0]
      endif
    else
      let color = 'NONE'
      if a:arg[0] !=? 'none'
        let color .= ',' . a:arg[0]
      endif
    endif

    return s:MODE . a:id . '=' . color . ' '

  elseif len(a:arg) == 2
    let type = tolower(a:arg[0])

    if type ==? 'fg' || type ==? 'bg' || type ==? 'sp'
      let color = get(s:C, a:arg[1])
      if strlen(color) <= 1
        let color = a:arg[1]
      endif
    elseif type ==? 'st'
      let type = ''
      let color = 'NONE'
      if a:arg[1] !=? 'none'
        let color .= ',' . a:arg[1]
      endif
    endif

    return s:MODE .type .'=' .color .' '
  endif
endfunction
" }}}
" }}}

" Actual colorscheme ----------------------------------------------------------
" General/UI {{{

call s:HL('Normal'       , 'fgN'          , 'bgN'            , 'none')

call s:HL('Folded'       , 'fgV'  , 'none')

call s:HL('VertSplit'    , 'fgD'      , 'bgH'       , 'none')

call s:HL('CursorLine'   , 'bg bgH')
call s:HL('CursorColumn' , 'bg bgH')
call s:HL('ColorColumn'  , 'bg bgH')

call s:HL('TabLine'      , 'fgD'      , 'bgN'            , 'underline')
call s:HL('TabLineFill'  , 'fgD'      , 'bgN'            , 'underline')
call s:HL('TabLineSel'   , 'fgN'          , 'st none')

call s:HL('MatchParen'   , 'blue'        , 'bgH'       , 'st bold')

call s:HL('NonText'      , 'fgV')
call s:HL('SpecialKey'   , 'fgV')

call s:HL('Visual'       , 'fgN'          , 'fgV')
call s:HL('VisualNOS'    , 'fgN'          , 'fgV')

call s:HL('Search'       , 'Yellow'      , 'none'          , 'reverse')
call s:HL('IncSearch'    , 'Orange')

call s:HL('StatusLine'   , 'fgV'  , 'bgN'            , 'reverse')
call s:HL('StatusLineNC' , 'bgH'     , 'fgN'            , 'reverse')

call s:HL('WildMenu', '#33ff1c', 'bgN', 'underline')

call s:HL('Directory', '#4b6a77')
call s:HL('Directory', 'Blue')
hi! link Directory Identifier

call s:HL('Title', 'Green', 'st none')

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

call s:HL('Comment',      'fgD' , 'st italic')
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

call s:HL('Statement',    'Yellow', 'st none')
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

call s:HL('Type',         'Yellow', 'st none')
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

call s:HL('Underlined',   'Violet'       , 'st underline')
"       *Underlined       text that stands out, HTML links

call s:HL('Ignore',       'none', 'none', 'none')
"       *Ignore           left blank, hidden  |hl-Ignore|

call s:HL('Error',        'Red', 'none')
"       *Error            any erroneous construct

call s:HL('Todo',         'Green'  , 'none'       , 'st bold')
"       *Todo             anything that needs extra attention; mostly the
"                         keywords TODO FIXME and XXX

" }}}
" Completion Menu {{{

call s:HL('Pmenu', 'fgN', 'bgH', 'none')
call s:HL('PmenuSel', 'bgN', '#b1d631', 'bold')
call s:HL('PmenuSel', 'bgN', 'Green', 'bold')
call s:HL('PmenuSbar', 'bg bgN')
call s:HL('PmenuThumb', 'bg bgH')
" }}}
" Diffs {{{

call s:HL('DiffDelete', 'Red', '#420f0e', 'none')
call s:HL('DiffAdd', 'Green', '#212f02', 'none')
call s:HL('DiffChange', 'Yellow', '#362900', 'none')
call s:HL('DiffText', 'Blue', '#0b293f', 'none')

" }}}
" Spelling {{{

if has("spell")
  call s:HL('SpellCap', 'sp Blue', 'st undercurl')
  call s:HL('SpellBad', 'sp Red', 'st undercurl')
  call s:HL('SpellLocal', 'sp Cyan', 'st undercurl')
  call s:HL('SpellRare', 'sp Magenta', 'st undercurl')
endif

" }}}

" vim:foldmethod=marker: foldlevel=0
