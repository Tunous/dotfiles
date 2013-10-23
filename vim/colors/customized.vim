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

" Basic text colors
let s:C.fg            = "#829496"
let s:C.fgDark        = "#5E6C70"
let s:C.fgVeryDark    = "#425054"

" Background colors
let s:C.bg            = "#202020"
let s:C.bgLight       = "#2D2D2D"

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

call s:HL('Normal'       , 'fg'          , 'bg'            , 'none')

call s:HL('Folded'       , 'fgVeryDark'  , 'none')

call s:HL('VertSplit'    , 'fgDark'      , 'bgLight'       , 'none')

call s:HL('CursorLine'   , 'bg bgLight')
call s:HL('CursorColumn' , 'bg bgLight')
call s:HL('ColorColumn'  , 'bg bgLight')

call s:HL('TabLine'      , 'fgDark'      , 'bg'            , 'underline')
call s:HL('TabLineFill'  , 'fgDark'      , 'bg'            , 'underline')
call s:HL('TabLineSel'   , 'fg'          , 'st none')

call s:HL('MatchParen'   , 'blue'        , 'bgLight'       , 'st bold')

call s:HL('NonText'      , 'fgVeryDark')
call s:HL('SpecialKey'   , 'fgVeryDark')

call s:HL('Visual'       , 'fg'          , 'visual')
call s:HL('VisualNOS'    , 'fg'          , 'visual')

call s:HL('Search'       , 'Yellow'      , 'none'          , 'reverse')
call s:HL('IncSearch'    , 'Orange')

call s:HL('Underlined'   , 'fg'       , 'st underline')

call s:HL('StatusLine'   , 'fgVeryDark'  , 'bg'            , 'reverse')
call s:HL('StatusLineNC' , 'bgLight'     , 'fg'            , 'reverse')

call s:HL('WildMenu', '#33ff1c', 'bg', 'underline')

call s:HL('Directory', '#4b6a77')

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

call s:HL('LineNr'     , 'fgDark' , 'none')
call s:HL('SignColumn' , 'fgDark' , 'bgLight')
call s:HL('FoldColumn' , 'fgDark' , 'bgLight')

" }}}
" Cursor {{{

call s:HL('Cursor', 'fg', 'bg', 'reverse')
"call s:hl('vcursor', 'coal', 'tardis', 'bold')
"call s:HL('iCursor', 'coal', 'tardis', 'none')

" }}}
" Syntax highlighting {{{

call s:HL('Special', 'fg')

call s:HL('Comment'        , 'fgDark' , 'st italic')
call s:HL('Todo'           , 'lightGreen'  , 'none'       , 'st bold')
call s:HL('SpecialComment' , 'fgDark' , 'st italic')

call s:HL('String', 'LightBlue')

call s:HL('Statement', '#FABC57', 'st none')
"call s:HL('Keyword')
"call s:HL('Conditional')
"call s:HL('Operator')
"call s:HL('Label')
"call s:HL('Repeat')

call s:HL('Identifier', '#4b6a77')
"call s:HL('Function')

call s:HL('PreProc', '#506D54')
"call s:HL('Macro')
"call s:HL('Define')
"call s:HL('PreCondit')

call s:HL('Constant', 'lightGreen')
"call s:HL('Character')
" call s:HL('Boolean', 'lightGreen')

call s:HL('Number', '#ff9800')
"call s:HL('Float')

"call s:HL('SpecialChar')

call s:HL('Type', '#297980', 'st none')
"call s:HL('StorageClass')
"call s:HL('Structure')
"call s:HL('Typedef')

"call s:HL('Exception')

call s:HL('Error', 'Red', 'none')
"call s:HL('Debug')
"call s:HL('Ignore')

" }}}
" Completion Menu {{{

call s:HL('Pmenu', 'fg', 'bgLight', 'none')
call s:HL('PmenuSel', 'bg', '#b1d631', 'bold')
call s:HL('PmenuSbar', 'bg bg')
call s:HL('PmenuThumb', 'bg bgLight')
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
