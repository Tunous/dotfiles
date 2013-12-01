" CUSTOMIZED colorscheme

" Supporting code -------------------------------------------------------------
" Initialization {{{

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "customized"

let s:Xcol = 1
if exists('g:customized_use_xresources') && g:customized_use_xresources == 1
  let s:Xcol = 2
endif

" }}}
" Palette {{{

let s:C = {}

let s:C.none        = ['NONE', 'NONE', 'NONE']

let s:C.background  = ['#262626', '235', 'none']
let s:C.line        = ['#303030', '236', '0']

let s:C.foreground  = ['#9e9e9e', '247', '15']
let s:C.comment     = ['#606060', '241', '7']
let s:C.selection   = ['#444444', '238', '8']

let s:C.Yellow      = ['#af8700', '136', '11']
let s:C.Orange      = ['#d75f00', '166', '3']
let s:C.Red         = ['#af0000', '124', '9']
let s:C.Purple      = ['#af005f', '125', '13']
let s:C.Violet      = ['#5f5faf', '61',  '5']
let s:C.Blue        = ['#0087af', '31',  '12']
let s:C.Cyan        = ['#00afaf', '37',  '14']
let s:C.Green       = ['#87af00', '106', '10']

" }}}
" Highlighting function {{{

function! s:HL(group, ...)
  " Arguments: group, guifg, guibg, gui, guisp
  let histring = 'hi! ' . a:group . ' '

  if a:0 >=1 && strlen(a:1)
    let color = get(s:C, a:1)
    let histring .= 'guifg=' . color[0] . ' ctermfg=' . color[s:Xcol] . ' '
  endif

  if a:0 >=2 && strlen(a:2)
    let color = get(s:C, a:2)
    let histring .= 'guibg=' . color[0] . ' ctermbg=' . color[s:Xcol] . ' '
  endif

  if a:0 >=3 && strlen(a:3)
    let histring .= 'gui=' . a:3 . ' cterm=' . a:3 . ' term=' . a:3 . ' '
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

call s:HL('Normal',       'foreground', 'background', 'none')

call s:HL('Folded',       'selection',  'none',       'none')

call s:HL('VertSplit',    'comment',    'line',       'none')

call s:HL('CursorLine',   'none',       'line',       'none')
call s:HL('CursorColumn', 'none',       'line',       'none')
call s:HL('ColorColumn',  'none',       'line',       'none')

call s:HL('TabLine',      'comment',    'none',       'none')
call s:HL('TabLineFill',  'comment',    'none',       'none')
call s:HL('TabLineSel',   'foreground', 'none',       'none')

call s:HL('MatchParen',   'Blue',       'line',       'bold')

call s:HL('NonText',      'selection',  'none',       'none')
call s:HL('SpecialKey',   'selection',  'none',       'none')

call s:HL('Visual',       'foreground', 'none',       'reverse')
call s:HL('VisualNOS',    'foreground', 'none',       'reverse')

call s:HL('Search',       'Yellow',     'none',       'reverse')
call s:HL('IncSearch',    'Orange',     'none',       'none')

call s:HL('StatusLine',   'comment',    'selection',  'reverse')
call s:HL('StatusLineNC', 'line',       'foreground', 'reverse')

call s:HL('WildMenu',     'Green',      'none',       'underline')

call s:HL('Directory',    'Blue',       'none',       'none')

call s:HL('Title',        'Green',      'none',       'none')

call s:HL('ErrorMsg',     'Red',        'none',       'none')
"call s:HL('MoreMsg', 'st Bold')
"call s:HL('MoreMsg')
"call s:HL("ModeMsg")
"call s:HL("Question")
"call s:HL('WarningMsg')

"call s:HL('Tag')

"}}}
" Gutter {{{

call s:HL('LineNr'       , 'comment' , 'none')
call s:HL('CursorLineNr' , 'comment' , 'line'  , 'none')
call s:HL('SignColumn'   , 'comment' , 'line')
call s:HL('FoldColumn'   , 'comment' , 'line')

" }}}
" Cursor {{{

call s:HL('Cursor' , 'foreground' , 'none' , 'reverse')

" }}}
" Syntax highlighting {{{
" :help group-name

call s:HL('Comment'    , 'comment')
call s:HL('Constant'   , 'Green')
call s:HL('Identifier' , 'Blue'     , 'none'  , 'none')
call s:HL('Statement'  , 'Yellow'   , 'none'  , 'none')
call s:HL('PreProc'    , 'Orange')
call s:HL('Type'       , 'Yellow'   , 'none'  , 'none'       , 'none')
call s:HL('Special'    , 'Red')
call s:HL('Underlined' , 'Violet'   , 'none'  , 'underline')
call s:HL('Ignore'     , 'none'     , 'none'  , 'none')
call s:HL('Error'      , 'Red'      , 'none')
call s:HL('Todo'       , 'Green'    , 'none'  , 'bold')

" }}}
" Completion Menu {{{

call s:HL('Pmenu'      , 'foreground' , 'line'  , 'none')
call s:HL('PmenuSel'   , 'Green'      , 'none'  , 'reverse,bold')
call s:HL('PmenuSbar'  , 'none'       , 'none')
call s:HL('PmenuThumb' , 'none'       , 'line')
" }}}
" Diffs {{{

call s:HL('DiffDelete' , 'Red'    , 'line' , 'none')
call s:HL('DiffAdd'    , 'Green'  , 'line' , 'none')
call s:HL('DiffChange' , 'Yellow' , 'line' , 'none')
call s:HL('DiffText'   , 'Blue'   , 'line' , 'none')

" }}}
" Spelling {{{

if has("spell")
  call s:HL('SpellCap'   , 'none' , 'none' , 'undercurl' , 'Blue')
  call s:HL('SpellBad'   , 'none' , 'none' , 'undercurl' , 'Red')
  call s:HL('SpellLocal' , 'none' , 'none' , 'undercurl' , 'Cyan')
  call s:HL('SpellRare'  , 'none' , 'none' , 'undercurl' , 'Purple')
endif

" }}}

" End {{{
" vim:foldmethod=marker: foldlevel=0
