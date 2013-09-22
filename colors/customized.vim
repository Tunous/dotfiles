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

" Basic text color
let s:C.basic			= "#829496"

" Darker version of basic text color
let s:C.darkBasic = "#5E6C70"

" Background color
let s:C.back			= "#202020"

" Lighter background color
let s:C.lightBack = "#2D2D2D"

let s:C.blue = "#0a9dff"

let s:C.none = "NONE"

" Visual selection bg"
let s:C.foldedbg = "#384048"

" Folded color
let s:C.temp = "#425054"

let s:C.temp2 = "#7e8aa2"

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

call s:HL('Normal'				, 'basic'					, 'back'					, 'none')

call s:HL('Folded'				, 'temp'					, 'none')

call s:HL('VertSplit'			, 'darkBasic'			, 'lightBack'			, 'none')

call s:HL('CursorLine'		, 'bg lightBack')
call s:HL('CursorColumn'	, 'bg lightBack')
call s:HL('ColorColumn'		, 'bg lightBack')

call s:HL('TabLine'			, 'darkBasic' , 'back'		 , 'underline')
call s:HL('TabLineFill' , 'darkBasic' , 'back'		 , 'underline')
call s:HL('TabLineSel'	, 'basic'			, 'st none')

call s:HL('MatchParen', 'blue', 'lightBack', 'st bold')

call s:HL('NonText'				, 'darkBasic'			, 'st italic')
call s:HL('SpecialKey'		, 'darkBasic'			, 'st italic')

call s:HL('Visual'				, 'basic'					 , 'foldedbg')
call s:HL('VisualNOS'			, 'basic'					 , 'foldedbg')

call s:HL('Search', 'Yellow', 'none', 'reverse')
call s:HL('IncSearch', 'Orange')

call s:HL('Underlined'		, 'fg basic'			, 'st underline')

call s:HL('StatusLine', 'temp', 'basic', 'reverse')
call s:HL('StatusLineNC', 'lightBack', 'basic', 'reverse')

"call s:HL('Directory')

"call s:HL('Title')

"call s:HL('ErrorMsg', 'Red', 'none', 'reverse')
"call s:HL('MoreMsg', 'st Bold')
"call s:HL('MoreMsg')
"call s:HL("ModeMsg")
"call s:HL("Question")
"call s:HL('WarningMsg')

"call s:HL('Tag')

"}}}
" Gutter {{{

call s:HL('LineNr',			'darkBasic', 'none')
call s:HL('SignColumn',			'darkBasic', 'lightBack')
call s:HL('FoldColumn',			'darkBasic', 'lightBack')

" }}}
" Cursor {{{

call s:HL('Cursor', 'basic', 'back',	'reverse')
"call s:hl('vcursor', 'coal', 'tardis', 'bold')
"call s:HL('iCursor', 'coal', 'tardis', 'none')

" }}}
" Syntax highlighting {{{

" Start with a simple base.
call s:HL('Special', 'basic')

" Comments are slightly brighter than folds, to make 'headers' easier to see.
call s:HL('Comment',				'darkBasic', 'st italic')
call s:HL('Todo',						'Green', 'none', 'st bold')
call s:HL('SpecialComment', 'darkBasic', 'st italic')

" Strings are a nice, pale straw color.  Nothing too fancy.
call s:HL('String', 'LightBlue')

" Control flow stuff is taffy.
call s:HL('Statement', 'temp2', 'st none')
"call s:HL('Keyword')
"call s:HL('Conditional')
"call s:HL('Operator')
"call s:HL('Label')
"call s:HL('Repeat')

" Functions and variable declarations are orange, because plain looks weird.
"call s:HL('Identifier')
"call s:HL('Function')

" Preprocessor stuff is lime, to make it pop.
"
" This includes imports in any given language, because they should usually be
" grouped together at the beginning of a file.	If they're in the middle of some
" other code they should stand out, because something tricky is
" probably going on.
"call s:HL('PreProc')
"call s:HL('Macro')
"call s:HL('Define')
"call s:HL('PreCondit')

" Constants of all kinds are colored together.
" I'm not really happy with the color yet...
"call s:HL('Constant')
"call s:HL('Character')
"call s:HL('Boolean')

"call s:HL('Number')
"call s:HL('Float')

"" Not sure what 'special character in a constant' means, but let's make it pop.
"call s:HL('SpecialChar')

"call s:HL('Type')
"call s:HL('StorageClass')
"call s:HL('Structure')
"call s:HL('Typedef')

"" Make try/catch blocks stand out.
"call s:HL('Exception')

"" Misc
call s:HL('Error', 'Red', 'none')
"call s:HL('Debug')
"call s:HL('Ignore')

" }}}
" Completion Menu {{{

call s:HL('Pmenu', 'basic', 'lightBack')
call s:HL('PmenuSel', 'basic', 'back', 'bold')
call s:HL('PmenuSbar', 'bg back')
call s:HL('PmenuThumb', 'bg lightBack')

" }}}
" Diffs {{{

call s:HL('DiffDelete', 'Red', 'none', 'none')
call s:HL('DiffAdd', 'Green', 'none', 'none')
call s:HL('DiffChange', 'Yellow', 'none', 'none')
call s:HL('DiffText', 'none', 'none', 'none')

" }}}
" Spelling {{{

if has("spell")
	call s:HL('SpellCap', 'sp Blue', 'st undercurl')
	call s:HL('SpellBad', 'sp Red', 'st undercurl')
	call s:HL('SpellLocal', 'sp Cyan', 'st undercurl')
	call s:HL('SpellRare', 'sp Magenta', 'st undercurl')
endif

" }}}

"" Bsic highlighting {{{
"exe "hi! Normal"						.s:FG.s:normal			.s:BG.s:back				 .s:SP.s:none					.s:ST

"exe "hi! Cursor"						.s:FG.s:back				.s:BG.s:normal

"exe "hi! CursorLine"														.s:BG.s:lback

"exe "hi! LineNr"						.s:FG.s:dnormal			.s:BG.s:lback

"exe "hi! Folded"						.s:FG.s:normal		 .s:BG.s:lback				.s:SP.s:normal			 .s:ST.s:bold

"hi! link							CursorColumn			CursorLine
"hi! link							CursorLineNr			Normal

"" Syntax highlighting

"exe "hi! Comment"				 .s:FG.s:dnormal																	 .s:ST.s:italic
""			 *Comment					 any coment

"exe "hi! Constant"				 .s:FG."#21A6C9"
""			 *Constant				 any constant
""				String					 a string constant: "this is string"
""				Character				 a character constant: 'c', '\n'
""				Number					 a number constant: 123, 0xff
""				Boolean					 a boolean constant: TRUE, false
""				Float						 a floating point constant: 2.3e10

"exe "hi! Identifier"			 .s:FG."#BD9800"

"exe "hi! Statement"			 .s:FG."#E3AA27" .s:ST
""			 *Statement				 any statement
""				Conditional			 if, then, else, endif, switch, etc.
""				Repeat					 for, do, while, etc.
""				Label						 case, default, etc.
""				Operator				 "sizeof", "+", "*", etc.
""				Keyword					 any other keyword
""				Exception				 try, catch, throw

"exe "hi! PreProc"				 .s:FG."#cb4b16"
""			 *PreProc					 generic Preprocessor
""				Include					 preprocessor #include
""				Define					 preprocessor #define
""				Macro						 same as Define
""				PreCondit				 preprocessor #if, #else, #endif, etc.

"" TODO name color
"exe "hi! Type"						 .s:FG."#CC9923" .s:ST
""			 *Type						 int, long, char, etc.
""				StorageClass		 static, register, volatile, etc.
""				Structure				 struct, union, enum, etc.
""				Typedef					 A typedef

"exe "hi! Special"				 .s:FG."#BD9800"
""			 *Special					 any special symbol
""				SpecialChar			 special character in a constant
""				Tag							 you can use CTRL-] on this
""				Delimiter				 character that needs attention
""				SpecialComment	 special things inside a comment
""				Debug						 debugging statements

"exe "hi! Underlined"			 .s:FG."#BD9800"
""			 *Underlined			 text that stands out, HTML links

"exe "hi! Ignore"					 .s:FG."#BD9800"
""			 *Ignore					 left blank, hidden  |hl-Ignore|

"exe "hi! Error"					 .s:FG."#BD9800"
""			 *Error						 any erroneous construct

"exe "hi! Todo"						 .s:FG."#BD9800"
""			 *Todo						 anything that needs extra attention; mostly the
""												 keywords TODO FIXME and XXX

"}}}

" vim:foldmethod=marker: foldlevel=0
