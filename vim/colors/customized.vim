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

" Background
let s:C.bgN  = "#282828"       " Basic background
let s:C.bgL  = "#303030"       " Light background tone

if &background == "light"
  let s:C.bgN  = "#eee8d5"       " Basic background
  let s:C.bgL  = "#fdf6e3"       " Light background tone
endif

" Foreground
let s:C.fgN  = "#829496"       " Basic foreground
let s:C.fgD  = "#5E6C70"       " Dark foreground tone
let s:C.fgVD = "#425054"       " Very dark foreground tone

let s:C.Syellow      = "#b58900"
let s:C.Sorange      = "#cb4b16"
let s:C.Sred         = "#dc322f"
let s:C.Smagenta     = "#d33682"
let s:C.Sviolet      = "#6c71c4"
let s:C.Sblue        = "#268bd2"
let s:C.Scyan        = "#2aa198"

let s:green       = "#719e07" "experimental
let s:C.Green         = "#719e07"

let s:C.blue          = "#0a9dff"
let s:C.lightGreen    = "#b1d631"

let s:C.none          = "NONE"

" Visual selection bg
let s:C.visual        = "#384048"

" Folded color
let s:C.temp2         = "#7e8aa2"

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

call s:HL('Folded'       , 'fgVD'  , 'none')

call s:HL('VertSplit'    , 'fgD'      , 'bgL'       , 'none')

call s:HL('CursorLine'   , 'bg bgL')
call s:HL('CursorColumn' , 'bg bgL')
call s:HL('ColorColumn'  , 'bg bgL')

call s:HL('TabLine'      , 'fgD'      , 'bgN'            , 'underline')
call s:HL('TabLineFill'  , 'fgD'      , 'bgN'            , 'underline')
call s:HL('TabLineSel'   , 'fgN'          , 'st none')

call s:HL('MatchParen'   , 'blue'        , 'bgL'       , 'st bold')

call s:HL('NonText'      , 'fgVD')
call s:HL('SpecialKey'   , 'fgVD')

call s:HL('Visual'       , 'fgN'          , 'visual')
call s:HL('VisualNOS'    , 'fgN'          , 'visual')

call s:HL('Search'       , 'Yellow'      , 'none'          , 'reverse')
call s:HL('IncSearch'    , 'Orange')

call s:HL('StatusLine'   , 'fgVD'  , 'bgN'            , 'reverse')
call s:HL('StatusLineNC' , 'bgL'     , 'fgN'            , 'reverse')

call s:HL('WildMenu', '#33ff1c', 'bgN', 'underline')

call s:HL('Directory', '#4b6a77')
call s:HL('Directory', 'Sblue')
hi! link Directory Identifier

call s:HL('Title', 'lightGreen', 'st none')

"call s:HL('ErrorMsg', 'Red', 'none', 'reverse')
"call s:HL('MoreMsg', 'st Bold')
"call s:HL('MoreMsg')
"call s:HL("ModeMsg")
"call s:HL("Question")
"call s:HL('WarningMsg')

"call s:HL('Tag')

"}}}
" Gutter {{{

call s:HL('LineNr'     , 'fgD' , 'none')
call s:HL('SignColumn' , 'fgD' , 'bgL')
call s:HL('FoldColumn' , 'fgD' , 'bgL')

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

call s:HL('Identifier',   'Sblue')
"       *Identifier       any variable name
"        Function         function name (also: methods for classes)

call s:HL('Statement',    'Syellow', 'st none')
"       *Statement        any statement
"        Conditional      if, then, else, endif, switch, etc.
"        Repeat           for, do, while, etc.
"        Label            case, default, etc.
"        Operator         "sizeof", "+", "*", etc.
"        Keyword          any other keyword
"        Exception        try, catch, throw

call s:HL('PreProc',      'Sorange')
"       *PreProc          generic Preprocessor
"        Include          preprocessor #include
"        Define           preprocessor #define
"        Macro            same as Define
"        PreCondit        preprocessor #if, #else, #endif, etc.

call s:HL('Type',         'Syellow', 'st none')
"        StorageClass     static, register, volatile, etc.
"        Structure        struct, union, enum, etc.
"        Typedef          A typedef

call s:HL('Special',      'Sred')
"       *Special          any special symbol
"        SpecialChar      special character in a constant
"        Tag              you can use CTRL-] on this
"        Delimiter        character that needs attention
"        SpecialComment   special things inside a comment
"        Debug            debugging statements

call s:HL('Underlined',   'Sviolet'       , 'st underline')
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

call s:HL('Pmenu', 'fgN', 'bgL', 'none')
call s:HL('PmenuSel', 'bgN', '#b1d631', 'bold')
call s:HL('PmenuSel', 'bgN', 'Green', 'bold')
call s:HL('PmenuSbar', 'bg bgN')
call s:HL('PmenuThumb', 'bg bgL')
" }}}
" Diffs {{{

call s:HL('DiffDelete', '#dc322f', 'none', 'none')
call s:HL('DiffAdd', '#719e07', 'none', 'none')
call s:HL('DiffChange', '#b58900', 'none', 'none')
call s:HL('DiffText', '#268bd2', 'none', 'none')

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
