package nvim.type.vim;

/**
	```lua
	(class) vim.wo
	```
**/
@:structInit class Wo {
	/**
		```lua
		(field) vim.wo.arab: boolean
		```
		
		---
		
		 This option can be set to start editing Arabic text.
		 Setting this option will:
		 - Set the 'rightleft' option, unless 'termbidi' is set.
		 - Set the 'arabicshape' option, unless 'termbidi' is set.
		 - Set the 'keymap' option to "arabic"; in Insert mode CTRL-^ toggles
		   between typing English and Arabic key mapping.
		 - Set the 'delcombine' option
		
		 Resetting this option will:
		 - Reset the 'rightleft' option.
		 - Disable the use of 'keymap' (without changing its value).
		 Note that 'arabicshape' and 'delcombine' are not reset (it is a global
		 option).
		 Also see `arabic.txt`.
		
	**/
	extern var arab : Bool;
	/**
		```lua
		(field) vim.wo.arabic: boolean
		```
		
		---
		
		 This option can be set to start editing Arabic text.
		 Setting this option will:
		 - Set the 'rightleft' option, unless 'termbidi' is set.
		 - Set the 'arabicshape' option, unless 'termbidi' is set.
		 - Set the 'keymap' option to "arabic"; in Insert mode CTRL-^ toggles
		   between typing English and Arabic key mapping.
		 - Set the 'delcombine' option
		
		 Resetting this option will:
		 - Reset the 'rightleft' option.
		 - Disable the use of 'keymap' (without changing its value).
		 Note that 'arabicshape' and 'delcombine' are not reset (it is a global
		 option).
		 Also see `arabic.txt`.
		
	**/
	extern var arabic : Bool;
	/**
		```lua
		(field) vim.wo.breakindent: boolean
		```
		
		---
		
		 Every wrapped line will continue visually indented (same amount of
		 space as the beginning of that line), thus preserving horizontal blocks
		 of text.
		
	**/
	extern var breakindent : Bool;
	/**
		```lua
		(field) vim.wo.breakindentopt: string
		```
		
		---
		
		 Settings for 'breakindent'. It can consist of the following optional
		 items and must be separated by a comma:
		 	min:{n}	    Minimum text width that will be kept after
		 		    applying 'breakindent', even if the resulting
		 		    text should normally be narrower. This prevents
		 		    text indented almost to the right window border
		 		    occupying lots of vertical space when broken.
		 		    (default: 20)
		 	shift:{n}   After applying 'breakindent', the wrapped line's
		 		    beginning will be shifted by the given number of
		 		    characters.  It permits dynamic French paragraph
		 		    indentation (negative) or emphasizing the line
		 		    continuation (positive).
		 		    (default: 0)
		 	sbr	    Display the 'showbreak' value before applying the
		 		    additional indent.
		 		    (default: off)
		 	list:{n}    Adds an additional indent for lines that match a
		 		    numbered or bulleted list (using the
		 		    'formatlistpat' setting).
		 		    (default: 0)
		 	list:-1	    Uses the width of a match with 'formatlistpat' for
		 		    indentation.
		 	column:{n}  Indent at column {n}. Will overrule the other
		 		    sub-options. Note: an additional indent may be
		 		    added for the 'showbreak' setting.
		 		    (default: off)
		
	**/
	extern var breakindentopt : String;
	/**
		```lua
		(field) vim.wo.bri: boolean
		```
		
		---
		
		 Every wrapped line will continue visually indented (same amount of
		 space as the beginning of that line), thus preserving horizontal blocks
		 of text.
		
	**/
	extern var bri : Bool;
	/**
		```lua
		(field) vim.wo.briopt: string
		```
		
		---
		
		 Settings for 'breakindent'. It can consist of the following optional
		 items and must be separated by a comma:
		 	min:{n}	    Minimum text width that will be kept after
		 		    applying 'breakindent', even if the resulting
		 		    text should normally be narrower. This prevents
		 		    text indented almost to the right window border
		 		    occupying lots of vertical space when broken.
		 		    (default: 20)
		 	shift:{n}   After applying 'breakindent', the wrapped line's
		 		    beginning will be shifted by the given number of
		 		    characters.  It permits dynamic French paragraph
		 		    indentation (negative) or emphasizing the line
		 		    continuation (positive).
		 		    (default: 0)
		 	sbr	    Display the 'showbreak' value before applying the
		 		    additional indent.
		 		    (default: off)
		 	list:{n}    Adds an additional indent for lines that match a
		 		    numbered or bulleted list (using the
		 		    'formatlistpat' setting).
		 		    (default: 0)
		 	list:-1	    Uses the width of a match with 'formatlistpat' for
		 		    indentation.
		 	column:{n}  Indent at column {n}. Will overrule the other
		 		    sub-options. Note: an additional indent may be
		 		    added for the 'showbreak' setting.
		 		    (default: off)
		
	**/
	extern var briopt : String;
	/**
		```lua
		(field) vim.wo.cc: string
		```
		
		---
		
		 'colorcolumn' is a comma-separated list of screen columns that are
		 highlighted with ColorColumn `hl-ColorColumn`.  Useful to align
		 text.  Will make screen redrawing slower.
		 The screen column can be an absolute number, or a number preceded with
		 '+' or '-', which is added to or subtracted from 'textwidth'.
		
		 ```vim
		
		 	set cc=+1	  " highlight column after 'textwidth'
		 	set cc=+1,+2,+3  " highlight three columns after 'textwidth'
		 	hi ColorColumn ctermbg=lightgrey guibg=lightgrey
		 ```
		
		 When 'textwidth' is zero then the items with '-' and '+' are not used.
		 A maximum of 256 columns are highlighted.
		
	**/
	extern var cc : String;
	/**
		```lua
		(field) vim.wo.cocu: string
		```
		
		---
		
		 Sets the modes in which text in the cursor line can also be concealed.
		 When the current mode is listed then concealing happens just like in
		 other lines.
		   n		Normal mode
		   v		Visual mode
		   i		Insert mode
		   c		Command line editing, for 'incsearch'
		
		 'v' applies to all lines in the Visual area, not only the cursor.
		 A useful value is "nc".  This is used in help files.  So long as you
		 are moving around text is concealed, but when starting to insert text
		 or selecting a Visual area the concealed text is displayed, so that
		 you can see what you are doing.
		 Keep in mind that the cursor position is not always where it's
		 displayed.  E.g., when moving vertically it may change column.
		
	**/
	extern var cocu : String;
	/**
		```lua
		(field) vim.wo.cole: integer
		```
		
		---
		
		 Determine how text with the "conceal" syntax attribute `:syn-conceal`
		 is shown:
		
		 Value		Effect ~
		 0		Text is shown normally
		 1		Each block of concealed text is replaced with one
		 		character.  If the syntax item does not have a custom
		 		replacement character defined (see `:syn-cchar`) the
		 		character defined in 'listchars' is used.
		 		It is highlighted with the "Conceal" highlight group.
		 2		Concealed text is completely hidden unless it has a
		 		custom replacement character defined (see
		 		`:syn-cchar`).
		 3		Concealed text is completely hidden.
		
		 Note: in the cursor line concealed text is not hidden, so that you can
		 edit and copy the text.  This can be changed with the 'concealcursor'
		 option.
		
	**/
	extern var cole : Int;
	/**
		```lua
		(field) vim.wo.colorcolumn: string
		```
		
		---
		
		 'colorcolumn' is a comma-separated list of screen columns that are
		 highlighted with ColorColumn `hl-ColorColumn`.  Useful to align
		 text.  Will make screen redrawing slower.
		 The screen column can be an absolute number, or a number preceded with
		 '+' or '-', which is added to or subtracted from 'textwidth'.
		
		 ```vim
		
		 	set cc=+1	  " highlight column after 'textwidth'
		 	set cc=+1,+2,+3  " highlight three columns after 'textwidth'
		 	hi ColorColumn ctermbg=lightgrey guibg=lightgrey
		 ```
		
		 When 'textwidth' is zero then the items with '-' and '+' are not used.
		 A maximum of 256 columns are highlighted.
		
	**/
	extern var colorcolumn : String;
	/**
		```lua
		(field) vim.wo.concealcursor: string
		```
		
		---
		
		 Sets the modes in which text in the cursor line can also be concealed.
		 When the current mode is listed then concealing happens just like in
		 other lines.
		   n		Normal mode
		   v		Visual mode
		   i		Insert mode
		   c		Command line editing, for 'incsearch'
		
		 'v' applies to all lines in the Visual area, not only the cursor.
		 A useful value is "nc".  This is used in help files.  So long as you
		 are moving around text is concealed, but when starting to insert text
		 or selecting a Visual area the concealed text is displayed, so that
		 you can see what you are doing.
		 Keep in mind that the cursor position is not always where it's
		 displayed.  E.g., when moving vertically it may change column.
		
	**/
	extern var concealcursor : String;
	/**
		```lua
		(field) vim.wo.conceallevel: integer
		```
		
		---
		
		 Determine how text with the "conceal" syntax attribute `:syn-conceal`
		 is shown:
		
		 Value		Effect ~
		 0		Text is shown normally
		 1		Each block of concealed text is replaced with one
		 		character.  If the syntax item does not have a custom
		 		replacement character defined (see `:syn-cchar`) the
		 		character defined in 'listchars' is used.
		 		It is highlighted with the "Conceal" highlight group.
		 2		Concealed text is completely hidden unless it has a
		 		custom replacement character defined (see
		 		`:syn-cchar`).
		 3		Concealed text is completely hidden.
		
		 Note: in the cursor line concealed text is not hidden, so that you can
		 edit and copy the text.  This can be changed with the 'concealcursor'
		 option.
		
	**/
	extern var conceallevel : Int;
	/**
		```lua
		(field) vim.wo.crb: boolean
		```
		
		---
		
		 When this option is set, as the cursor in the current
		 window moves other cursorbound windows (windows that also have
		 this option set) move their cursors to the corresponding line and
		 column.  This option is useful for viewing the
		 differences between two versions of a file (see 'diff'); in diff mode,
		 inserted and deleted lines (though not characters within a line) are
		 taken into account.
		
	**/
	extern var crb : Bool;
	/**
		```lua
		(field) vim.wo.cuc: boolean
		```
		
		---
		
		 Highlight the screen column of the cursor with CursorColumn
		 `hl-CursorColumn`.  Useful to align text.  Will make screen redrawing
		 slower.
		 If you only want the highlighting in the current window you can use
		 these autocommands:
		
		 ```vim
		 	au WinLeave * set nocursorline nocursorcolumn
		 	au WinEnter * set cursorline cursorcolumn
		 ```
		
		
	**/
	extern var cuc : Bool;
	/**
		```lua
		(field) vim.wo.cul: boolean = true
		```
		
		---
		
		 Highlight the line where the cursor is on
		
		---
		
		 Highlight the text line of the cursor with CursorLine `hl-CursorLine`.
		 Useful to easily spot the cursor.  Will make screen redrawing slower.
		 When Visual mode is active the highlighting isn't used to make it
		 easier to see the selected text.
		
	**/
	extern var cul : Bool;
	/**
		```lua
		(field) vim.wo.culopt: string
		```
		
		---
		
		 Comma-separated list of settings for how 'cursorline' is displayed.
		 Valid values:
		 "line"		Highlight the text line of the cursor with
		 		CursorLine `hl-CursorLine`.
		 "screenline"	Highlight only the screen line of the cursor with
		 		CursorLine `hl-CursorLine`.
		 "number"	Highlight the line number of the cursor with
		 		CursorLineNr `hl-CursorLineNr`.
		
		 Special value:
		 "both"		Alias for the values "line,number".
		
		 "line" and "screenline" cannot be used together.
		
	**/
	extern var culopt : String;
	/**
		```lua
		(field) vim.wo.cursorbind: boolean
		```
		
		---
		
		 When this option is set, as the cursor in the current
		 window moves other cursorbound windows (windows that also have
		 this option set) move their cursors to the corresponding line and
		 column.  This option is useful for viewing the
		 differences between two versions of a file (see 'diff'); in diff mode,
		 inserted and deleted lines (though not characters within a line) are
		 taken into account.
		
	**/
	extern var cursorbind : Bool;
	/**
		```lua
		(field) vim.wo.cursorcolumn: boolean
		```
		
		---
		
		 Highlight the screen column of the cursor with CursorColumn
		 `hl-CursorColumn`.  Useful to align text.  Will make screen redrawing
		 slower.
		 If you only want the highlighting in the current window you can use
		 these autocommands:
		
		 ```vim
		 	au WinLeave * set nocursorline nocursorcolumn
		 	au WinEnter * set cursorline cursorcolumn
		 ```
		
		
	**/
	extern var cursorcolumn : Bool;
	/**
		```lua
		(field) vim.wo.cursorline: boolean = true
		```
		
		---
		
		 Highlight the line where the cursor is on
		
		---
		
		 Highlight the text line of the cursor with CursorLine `hl-CursorLine`.
		 Useful to easily spot the cursor.  Will make screen redrawing slower.
		 When Visual mode is active the highlighting isn't used to make it
		 easier to see the selected text.
		
	**/
	extern var cursorline : Bool;
	/**
		```lua
		(field) vim.wo.cursorlineopt: string
		```
		
		---
		
		 Comma-separated list of settings for how 'cursorline' is displayed.
		 Valid values:
		 "line"		Highlight the text line of the cursor with
		 		CursorLine `hl-CursorLine`.
		 "screenline"	Highlight only the screen line of the cursor with
		 		CursorLine `hl-CursorLine`.
		 "number"	Highlight the line number of the cursor with
		 		CursorLineNr `hl-CursorLineNr`.
		
		 Special value:
		 "both"		Alias for the values "line,number".
		
		 "line" and "screenline" cannot be used together.
		
	**/
	extern var cursorlineopt : String;
	/**
		```lua
		(field) vim.wo.diff: boolean
		```
		
		---
		
		 Join the current window in the group of windows that shows differences
		 between files.  See `diff-mode`.
		
	**/
	extern var diff : Bool;
	/**
		```lua
		(field) vim.wo.eiw: string
		```
		
		---
		
		 Similar to 'eventignore' but applies to a particular window and its
		 buffers, for which window and buffer related autocommands can be
		 ignored indefinitely without affecting the global 'eventignore'.
		
	**/
	extern var eiw : String;
	/**
		```lua
		(field) vim.wo.eventignorewin: string
		```
		
		---
		
		 Similar to 'eventignore' but applies to a particular window and its
		 buffers, for which window and buffer related autocommands can be
		 ignored indefinitely without affecting the global 'eventignore'.
		
	**/
	extern var eventignorewin : String;
	/**
		```lua
		(field) vim.wo.fcs: string
		```
		
		---
		
		 Characters to fill the statuslines, vertical separators and special
		 lines in the window.
		 It is a comma-separated list of items.  Each item has a name, a colon
		 and the value of that item: `E1511`
		
		   item		default		Used for ~
		   stl		' '		statusline of the current window
		   stlnc		' '		statusline of the non-current windows
		   wbr		' '		window bar
		   horiz		'─' or '-'	horizontal separators `:split`
		   horizup	'┴' or '-'	upwards facing horizontal separator
		   horizdown	'┬' or '-'	downwards facing horizontal separator
		   vert		'│' or '|'	vertical separators `:vsplit`
		   vertleft	'┤' or '|'	left facing vertical separator
		   vertright	'├' or '|'	right facing vertical separator
		   verthoriz	'┼' or '+'	overlapping vertical and horizontal
		 				separator
		   fold		'·' or '-'	filling 'foldtext'
		   foldopen	'-'		mark the beginning of a fold
		   foldclose	'+'		show a closed fold
		   foldsep	'│' or '|'      open fold middle marker
		   diff		'-'		deleted lines of the 'diff' option
		   msgsep	' '		message separator 'display'
		   eob		'~'		empty lines at the end of a buffer
		   lastline	'@'		'display' contains lastline/truncate
		
		 Any one that is omitted will fall back to the default.
		
		 Note that "horiz", "horizup", "horizdown", "vertleft", "vertright" and
		 "verthoriz" are only used when 'laststatus' is 3, since only vertical
		 window separators are used otherwise.
		
		 If 'ambiwidth' is "double" then "horiz", "horizup", "horizdown",
		 "vert", "vertleft", "vertright", "verthoriz", "foldsep" and "fold"
		 default to single-byte alternatives.
		
		 Example:
		
		 ```vim
		     set fillchars=stl:\ ,stlnc:\ ,vert:│,fold:·,diff:-
		 ```
		
		 For the "stl", "stlnc", "foldopen", "foldclose" and "foldsep" items
		 single-byte and multibyte characters are supported.  But double-width
		 characters are not supported. `E1512`
		
		 The highlighting used for these items:
		   item		highlight group ~
		   stl		StatusLine		`hl-StatusLine`
		   stlnc		StatusLineNC		`hl-StatusLineNC`
		   wbr		WinBar			`hl-WinBar` or `hl-WinBarNC`
		   horiz		WinSeparator		`hl-WinSeparator`
		   horizup	WinSeparator		`hl-WinSeparator`
		   horizdown	WinSeparator		`hl-WinSeparator`
		   vert		WinSeparator		`hl-WinSeparator`
		   vertleft	WinSeparator		`hl-WinSeparator`
		   vertright	WinSeparator		`hl-WinSeparator`
		   verthoriz	WinSeparator		`hl-WinSeparator`
		   fold		Folded			`hl-Folded`
		   diff		DiffDelete		`hl-DiffDelete`
		   eob		EndOfBuffer		`hl-EndOfBuffer`
		   lastline	NonText			`hl-NonText`
		
	**/
	extern var fcs : String;
	/**
		```lua
		(field) vim.wo.fdc: '0'|'1'|'2'|'3'|'4'|'5'|'6'|'7'|'8'|'9'|'auto'|'auto:1'|'auto:2'|'auto:3'|'auto:4'|'auto:5'|'auto:6'|'auto:7'|'auto:8'|'auto:9'
		```
		
		---
		
		 When and how to draw the foldcolumn. Valid values are:
		     "auto":       resize to the minimum amount of folds to display.
		     "auto:[1-9]": resize to accommodate multiple folds up to the
		 		  selected level
		     "0":          to disable foldcolumn
		     "[1-9]":      to display a fixed number of columns
		 See `folding`.
		
	**/
	extern var fdc : String;
	/**
		```lua
		(field) vim.wo.fde: string
		```
		
		---
		
		 The expression used for when 'foldmethod' is "expr".  It is evaluated
		 for each line to obtain its fold level.  The context is set to the
		 script where 'foldexpr' was set, script-local items can be accessed.
		 See `fold-expr` for the usage.
		
		 The expression will be evaluated in the `sandbox` if set from a
		 modeline, see `sandbox-option`.
		 This option can't be set from a `modeline` when the 'diff' option is
		 on or the 'modelineexpr' option is off.
		
		 It is not allowed to change text or jump to another window while
		 evaluating 'foldexpr' `textlock`.
		
	**/
	extern var fde : String;
	/**
		```lua
		(field) vim.wo.fdi: string
		```
		
		---
		
		 Used only when 'foldmethod' is "indent".  Lines starting with
		 characters in 'foldignore' will get their fold level from surrounding
		 lines.  White space is skipped before checking for this character.
		 The default "#" works well for C programs.  See `fold-indent`.
		
	**/
	extern var fdi : String;
	/**
		```lua
		(field) vim.wo.fdl: integer
		```
		
		---
		
		 Sets the fold level: Folds with a higher level will be closed.
		 Setting this option to zero will close all folds.  Higher numbers will
		 close fewer folds.
		 This option is set by commands like `zm`, `zM` and `zR`.
		 See `fold-foldlevel`.
		
	**/
	extern var fdl : Int;
	/**
		```lua
		(field) vim.wo.fdm: 'diff'|'expr'|'indent'|'manual'|'marker'|'syntax'
		```
		
		---
		
		 The kind of folding used for the current window.  Possible values:
		 `fold-manual`	manual	    Folds are created manually.
		 `fold-indent`	indent	    Lines with equal indent form a fold.
		 `fold-expr`	expr	    'foldexpr' gives the fold level of a line.
		 `fold-marker`	marker	    Markers are used to specify folds.
		 `fold-syntax`	syntax	    Syntax highlighting items specify folds.
		 `fold-diff`	diff	    Fold text that is not changed.
		
	**/
	extern var fdm : String;
	/**
		```lua
		(field) vim.wo.fdn: integer
		```
		
		---
		
		 Sets the maximum nesting of folds for the "indent" and "syntax"
		 methods.  This avoids that too many folds will be created.  Using more
		 than 20 doesn't work, because the internal limit is 20.
		
	**/
	extern var fdn : Int;
	/**
		```lua
		(field) vim.wo.fdt: string
		```
		
		---
		
		 An expression which is used to specify the text displayed for a closed
		 fold.  The context is set to the script where 'foldexpr' was set,
		 script-local items can be accessed.  See `fold-foldtext` for the
		 usage.
		
		 The expression will be evaluated in the `sandbox` if set from a
		 modeline, see `sandbox-option`.
		 This option cannot be set in a modeline when 'modelineexpr' is off.
		
		 It is not allowed to change text or jump to another window while
		 evaluating 'foldtext' `textlock`.
		
		 When set to an empty string, foldtext is disabled, and the line
		 is displayed normally with highlighting and no line wrapping.
		
	**/
	extern var fdt : String;
	/**
		```lua
		(field) vim.wo.fen: boolean
		```
		
		---
		
		 When off, all folds are open.  This option can be used to quickly
		 switch between showing all text unfolded and viewing the text with
		 folds (including manually opened or closed folds).  It can be toggled
		 with the `zi` command.  The 'foldcolumn' will remain blank when
		 'foldenable' is off.
		 This option is set by commands that create a new fold or close a fold.
		 See `folding`.
		
	**/
	extern var fen : Bool;
	/**
		```lua
		(field) vim.wo.fillchars: string
		```
		
		---
		
		 Characters to fill the statuslines, vertical separators and special
		 lines in the window.
		 It is a comma-separated list of items.  Each item has a name, a colon
		 and the value of that item: `E1511`
		
		   item		default		Used for ~
		   stl		' '		statusline of the current window
		   stlnc		' '		statusline of the non-current windows
		   wbr		' '		window bar
		   horiz		'─' or '-'	horizontal separators `:split`
		   horizup	'┴' or '-'	upwards facing horizontal separator
		   horizdown	'┬' or '-'	downwards facing horizontal separator
		   vert		'│' or '|'	vertical separators `:vsplit`
		   vertleft	'┤' or '|'	left facing vertical separator
		   vertright	'├' or '|'	right facing vertical separator
		   verthoriz	'┼' or '+'	overlapping vertical and horizontal
		 				separator
		   fold		'·' or '-'	filling 'foldtext'
		   foldopen	'-'		mark the beginning of a fold
		   foldclose	'+'		show a closed fold
		   foldsep	'│' or '|'      open fold middle marker
		   diff		'-'		deleted lines of the 'diff' option
		   msgsep	' '		message separator 'display'
		   eob		'~'		empty lines at the end of a buffer
		   lastline	'@'		'display' contains lastline/truncate
		
		 Any one that is omitted will fall back to the default.
		
		 Note that "horiz", "horizup", "horizdown", "vertleft", "vertright" and
		 "verthoriz" are only used when 'laststatus' is 3, since only vertical
		 window separators are used otherwise.
		
		 If 'ambiwidth' is "double" then "horiz", "horizup", "horizdown",
		 "vert", "vertleft", "vertright", "verthoriz", "foldsep" and "fold"
		 default to single-byte alternatives.
		
		 Example:
		
		 ```vim
		     set fillchars=stl:\ ,stlnc:\ ,vert:│,fold:·,diff:-
		 ```
		
		 For the "stl", "stlnc", "foldopen", "foldclose" and "foldsep" items
		 single-byte and multibyte characters are supported.  But double-width
		 characters are not supported. `E1512`
		
		 The highlighting used for these items:
		   item		highlight group ~
		   stl		StatusLine		`hl-StatusLine`
		   stlnc		StatusLineNC		`hl-StatusLineNC`
		   wbr		WinBar			`hl-WinBar` or `hl-WinBarNC`
		   horiz		WinSeparator		`hl-WinSeparator`
		   horizup	WinSeparator		`hl-WinSeparator`
		   horizdown	WinSeparator		`hl-WinSeparator`
		   vert		WinSeparator		`hl-WinSeparator`
		   vertleft	WinSeparator		`hl-WinSeparator`
		   vertright	WinSeparator		`hl-WinSeparator`
		   verthoriz	WinSeparator		`hl-WinSeparator`
		   fold		Folded			`hl-Folded`
		   diff		DiffDelete		`hl-DiffDelete`
		   eob		EndOfBuffer		`hl-EndOfBuffer`
		   lastline	NonText			`hl-NonText`
		
	**/
	extern var fillchars : String;
	/**
		```lua
		(field) vim.wo.fml: integer
		```
		
		---
		
		 Sets the number of screen lines above which a fold can be displayed
		 closed.  Also for manually closed folds.  With the default value of
		 one a fold can only be closed if it takes up two or more screen lines.
		 Set to zero to be able to close folds of just one screen line.
		 Note that this only has an effect on what is displayed.  After using
		 "zc" to close a fold, which is displayed open because it's smaller
		 than 'foldminlines', a following "zc" may close a containing fold.
		
	**/
	extern var fml : Int;
	/**
		```lua
		(field) vim.wo.fmr: string
		```
		
		---
		
		 The start and end marker used when 'foldmethod' is "marker".  There
		 must be one comma, which separates the start and end marker.  The
		 marker is a literal string (a regular expression would be too slow).
		 See `fold-marker`.
		
	**/
	extern var fmr : String;
	/**
		```lua
		(field) vim.wo.foldcolumn: '0'|'1'|'2'|'3'|'4'|'5'|'6'|'7'|'8'|'9'|'auto'|'auto:1'|'auto:2'|'auto:3'|'auto:4'|'auto:5'|'auto:6'|'auto:7'|'auto:8'|'auto:9'
		```
		
		---
		
		 When and how to draw the foldcolumn. Valid values are:
		     "auto":       resize to the minimum amount of folds to display.
		     "auto:[1-9]": resize to accommodate multiple folds up to the
		 		  selected level
		     "0":          to disable foldcolumn
		     "[1-9]":      to display a fixed number of columns
		 See `folding`.
		
	**/
	extern var foldcolumn : String;
	/**
		```lua
		(field) vim.wo.foldenable: boolean
		```
		
		---
		
		 When off, all folds are open.  This option can be used to quickly
		 switch between showing all text unfolded and viewing the text with
		 folds (including manually opened or closed folds).  It can be toggled
		 with the `zi` command.  The 'foldcolumn' will remain blank when
		 'foldenable' is off.
		 This option is set by commands that create a new fold or close a fold.
		 See `folding`.
		
	**/
	extern var foldenable : Bool;
	/**
		```lua
		(field) vim.wo.foldexpr: string
		```
		
		---
		
		 The expression used for when 'foldmethod' is "expr".  It is evaluated
		 for each line to obtain its fold level.  The context is set to the
		 script where 'foldexpr' was set, script-local items can be accessed.
		 See `fold-expr` for the usage.
		
		 The expression will be evaluated in the `sandbox` if set from a
		 modeline, see `sandbox-option`.
		 This option can't be set from a `modeline` when the 'diff' option is
		 on or the 'modelineexpr' option is off.
		
		 It is not allowed to change text or jump to another window while
		 evaluating 'foldexpr' `textlock`.
		
	**/
	extern var foldexpr : String;
	/**
		```lua
		(field) vim.wo.foldignore: string
		```
		
		---
		
		 Used only when 'foldmethod' is "indent".  Lines starting with
		 characters in 'foldignore' will get their fold level from surrounding
		 lines.  White space is skipped before checking for this character.
		 The default "#" works well for C programs.  See `fold-indent`.
		
	**/
	extern var foldignore : String;
	/**
		```lua
		(field) vim.wo.foldlevel: integer
		```
		
		---
		
		 Sets the fold level: Folds with a higher level will be closed.
		 Setting this option to zero will close all folds.  Higher numbers will
		 close fewer folds.
		 This option is set by commands like `zm`, `zM` and `zR`.
		 See `fold-foldlevel`.
		
	**/
	extern var foldlevel : Int;
	/**
		```lua
		(field) vim.wo.foldmarker: string
		```
		
		---
		
		 The start and end marker used when 'foldmethod' is "marker".  There
		 must be one comma, which separates the start and end marker.  The
		 marker is a literal string (a regular expression would be too slow).
		 See `fold-marker`.
		
	**/
	extern var foldmarker : String;
	/**
		```lua
		(field) vim.wo.foldmethod: 'diff'|'expr'|'indent'|'manual'|'marker'|'syntax'
		```
		
		---
		
		 The kind of folding used for the current window.  Possible values:
		 `fold-manual`	manual	    Folds are created manually.
		 `fold-indent`	indent	    Lines with equal indent form a fold.
		 `fold-expr`	expr	    'foldexpr' gives the fold level of a line.
		 `fold-marker`	marker	    Markers are used to specify folds.
		 `fold-syntax`	syntax	    Syntax highlighting items specify folds.
		 `fold-diff`	diff	    Fold text that is not changed.
		
	**/
	extern var foldmethod : String;
	/**
		```lua
		(field) vim.wo.foldminlines: integer
		```
		
		---
		
		 Sets the number of screen lines above which a fold can be displayed
		 closed.  Also for manually closed folds.  With the default value of
		 one a fold can only be closed if it takes up two or more screen lines.
		 Set to zero to be able to close folds of just one screen line.
		 Note that this only has an effect on what is displayed.  After using
		 "zc" to close a fold, which is displayed open because it's smaller
		 than 'foldminlines', a following "zc" may close a containing fold.
		
	**/
	extern var foldminlines : Int;
	/**
		```lua
		(field) vim.wo.foldnestmax: integer
		```
		
		---
		
		 Sets the maximum nesting of folds for the "indent" and "syntax"
		 methods.  This avoids that too many folds will be created.  Using more
		 than 20 doesn't work, because the internal limit is 20.
		
	**/
	extern var foldnestmax : Int;
	/**
		```lua
		(field) vim.wo.foldtext: string
		```
		
		---
		
		 An expression which is used to specify the text displayed for a closed
		 fold.  The context is set to the script where 'foldexpr' was set,
		 script-local items can be accessed.  See `fold-foldtext` for the
		 usage.
		
		 The expression will be evaluated in the `sandbox` if set from a
		 modeline, see `sandbox-option`.
		 This option cannot be set in a modeline when 'modelineexpr' is off.
		
		 It is not allowed to change text or jump to another window while
		 evaluating 'foldtext' `textlock`.
		
		 When set to an empty string, foldtext is disabled, and the line
		 is displayed normally with highlighting and no line wrapping.
		
	**/
	extern var foldtext : String;
	/**
		```lua
		(field) vim.wo.integer: unknown
		```
	**/
	extern var integer : Dynamic;
	/**
		```lua
		(field) vim.wo.lbr: boolean
		```
		
		---
		
		 If on, Vim will wrap long lines at a character in 'breakat' rather
		 than at the last character that fits on the screen.  Unlike
		 'wrapmargin' and 'textwidth', this does not insert <EOL>s in the file,
		 it only affects the way the file is displayed, not its contents.
		 If 'breakindent' is set, line is visually indented. Then, the value
		 of 'showbreak' is used to put in front of wrapped lines. This option
		 is not used when the 'wrap' option is off.
		 Note that <Tab> characters after an <EOL> are mostly not displayed
		 with the right amount of white space.
		
	**/
	extern var lbr : Bool;
	/**
		```lua
		(field) vim.wo.lcs: string
		```
		
		---
		
		 Strings to use in 'list' mode and for the `:list` command.  It is a
		 comma-separated list of string settings. *E1511*
		
		 						*lcs-eol*
		   eol:c		Character to show at the end of each line.  When
		 		omitted, there is no extra character at the end of the
		 		line.
		 						*lcs-tab*
		   tab:xy[z]	Two or three characters to be used to show a tab.
		 		The third character is optional.
		
		   tab:xy	The 'x' is always used, then 'y' as many times as will
		 		fit.  Thus "tab:>-" displays:
		 ```
		
		 ```
		 			>-
		 			>--
		 			etc.
		 ```
		
		   tab:xyz	The 'z' is always used, then 'x' is prepended, and
		 		then 'y' is used as many times as will fit.  Thus
		 		"tab:<->" displays:
		 ```
		
		 ```
		 			<>
		 			<->
		 			<-->
		 			etc.
		 ```
		
		 		When "tab:" is omitted, a tab is shown as ^I.
		 						*lcs-space*
		   space:c	Character to show for a space.  When omitted, spaces
		 		are left blank.
		 						*lcs-multispace*
		   multispace:c...
		 		One or more characters to use cyclically to show for
		 		multiple consecutive spaces.  Overrides the "space"
		 		setting, except for single spaces.  When omitted, the
		 		"space" setting is used.  For example,
		 		`:set listchars=multispace:---+` shows ten consecutive
		 		spaces as:
		 ```
		 			---+---+--
		 ```
		
		 						*lcs-lead*
		   lead:c	Character to show for leading spaces.  When omitted,
		 		leading spaces are blank.  Overrides the "space" and
		 		"multispace" settings for leading spaces.  You can
		 		combine it with "tab:", for example:
		
		 ```vim
		 			set listchars+=tab:>-,lead:.
		 ```
		
		 						*lcs-leadmultispace*
		   leadmultispace:c...
		 		Like the `lcs-multispace` value, but for leading
		 		spaces only.  Also overrides `lcs-lead` for leading
		 		multiple spaces.
		 		`:set listchars=leadmultispace:---+` shows ten
		 		consecutive leading spaces as:
		 ```
		 			---+---+--XXX
		 ```
		
		 		Where "XXX" denotes the first non-blank characters in
		 		the line.
		 						*lcs-trail*
		   trail:c	Character to show for trailing spaces.  When omitted,
		 		trailing spaces are blank.  Overrides the "space" and
		 		"multispace" settings for trailing spaces.
		 						*lcs-extends*
		   extends:c	Character to show in the last column, when 'wrap' is
		 		off and the line continues beyond the right of the
		 		screen.
		 						*lcs-precedes*
		   precedes:c	Character to show in the first visible column of the
		 		physical line, when there is text preceding the
		 		character visible in the first column.
		 						*lcs-conceal*
		   conceal:c	Character to show in place of concealed text, when
		 		'conceallevel' is set to 1.  A space when omitted.
		 						*lcs-nbsp*
		   nbsp:c	Character to show for a non-breakable space character
		 		(0xA0 (160 decimal) and U+202F).  Left blank when
		 		omitted.
		
		 The characters ':' and ',' should not be used.  UTF-8 characters can
		 be used.  All characters must be single width. *E1512*
		
		 Each character can be specified as hex:
		
		 ```vim
		 	set listchars=eol:\\x24
		 	set listchars=eol:\\u21b5
		 	set listchars=eol:\\U000021b5
		 ```
		 Note that a double backslash is used.  The number of hex characters
		 must be exactly 2 for \\x, 4 for \\u and 8 for \\U.
		
		 Examples:
		
		 ```vim
		     set lcs=tab:>-,trail:-
		     set lcs=tab:>-,eol:<,nbsp:%
		     set lcs=extends:>,precedes:<
		 ```
		 `hl-NonText` highlighting will be used for "eol", "extends" and
		 "precedes". `hl-Whitespace` for "nbsp", "space", "tab", "multispace",
		 "lead" and "trail".
		
	**/
	extern var lcs : String;
	/**
		```lua
		(field) vim.wo.linebreak: boolean
		```
		
		---
		
		 If on, Vim will wrap long lines at a character in 'breakat' rather
		 than at the last character that fits on the screen.  Unlike
		 'wrapmargin' and 'textwidth', this does not insert <EOL>s in the file,
		 it only affects the way the file is displayed, not its contents.
		 If 'breakindent' is set, line is visually indented. Then, the value
		 of 'showbreak' is used to put in front of wrapped lines. This option
		 is not used when the 'wrap' option is off.
		 Note that <Tab> characters after an <EOL> are mostly not displayed
		 with the right amount of white space.
		
	**/
	extern var linebreak : Bool;
	/**
		```lua
		(field) vim.wo.list: boolean = true
		```
		
		---
		
		 Show <tab> and trailing spaces
		
		---
		
		 List mode: By default, show tabs as ">", trailing spaces as "-", and
		 non-breakable space characters as "+". Useful to see the difference
		 between tabs and spaces and for trailing blanks. Further changed by
		 the 'listchars' option.
		
		 When 'listchars' does not contain "tab" field, tabs are shown as "^I"
		 or "<09>", like how unprintable characters are displayed.
		
		 The cursor is displayed at the start of the space a Tab character
		 occupies, not at the end as usual in Normal mode.  To get this cursor
		 position while displaying Tabs with spaces, use:
		
		 ```vim
		 	set list lcs=tab:\ \
		 ```
		
		 Note that list mode will also affect formatting (set with 'textwidth'
		 or 'wrapmargin') when 'cpoptions' includes 'L'.  See 'listchars' for
		 changing the way tabs are displayed.
		
	**/
	extern var list : Bool;
	/**
		```lua
		(field) vim.wo.listchars: string
		```
		
		---
		
		 Strings to use in 'list' mode and for the `:list` command.  It is a
		 comma-separated list of string settings. *E1511*
		
		 						*lcs-eol*
		   eol:c		Character to show at the end of each line.  When
		 		omitted, there is no extra character at the end of the
		 		line.
		 						*lcs-tab*
		   tab:xy[z]	Two or three characters to be used to show a tab.
		 		The third character is optional.
		
		   tab:xy	The 'x' is always used, then 'y' as many times as will
		 		fit.  Thus "tab:>-" displays:
		 ```
		
		 ```
		 			>-
		 			>--
		 			etc.
		 ```
		
		   tab:xyz	The 'z' is always used, then 'x' is prepended, and
		 		then 'y' is used as many times as will fit.  Thus
		 		"tab:<->" displays:
		 ```
		
		 ```
		 			<>
		 			<->
		 			<-->
		 			etc.
		 ```
		
		 		When "tab:" is omitted, a tab is shown as ^I.
		 						*lcs-space*
		   space:c	Character to show for a space.  When omitted, spaces
		 		are left blank.
		 						*lcs-multispace*
		   multispace:c...
		 		One or more characters to use cyclically to show for
		 		multiple consecutive spaces.  Overrides the "space"
		 		setting, except for single spaces.  When omitted, the
		 		"space" setting is used.  For example,
		 		`:set listchars=multispace:---+` shows ten consecutive
		 		spaces as:
		 ```
		 			---+---+--
		 ```
		
		 						*lcs-lead*
		   lead:c	Character to show for leading spaces.  When omitted,
		 		leading spaces are blank.  Overrides the "space" and
		 		"multispace" settings for leading spaces.  You can
		 		combine it with "tab:", for example:
		
		 ```vim
		 			set listchars+=tab:>-,lead:.
		 ```
		
		 						*lcs-leadmultispace*
		   leadmultispace:c...
		 		Like the `lcs-multispace` value, but for leading
		 		spaces only.  Also overrides `lcs-lead` for leading
		 		multiple spaces.
		 		`:set listchars=leadmultispace:---+` shows ten
		 		consecutive leading spaces as:
		 ```
		 			---+---+--XXX
		 ```
		
		 		Where "XXX" denotes the first non-blank characters in
		 		the line.
		 						*lcs-trail*
		   trail:c	Character to show for trailing spaces.  When omitted,
		 		trailing spaces are blank.  Overrides the "space" and
		 		"multispace" settings for trailing spaces.
		 						*lcs-extends*
		   extends:c	Character to show in the last column, when 'wrap' is
		 		off and the line continues beyond the right of the
		 		screen.
		 						*lcs-precedes*
		   precedes:c	Character to show in the first visible column of the
		 		physical line, when there is text preceding the
		 		character visible in the first column.
		 						*lcs-conceal*
		   conceal:c	Character to show in place of concealed text, when
		 		'conceallevel' is set to 1.  A space when omitted.
		 						*lcs-nbsp*
		   nbsp:c	Character to show for a non-breakable space character
		 		(0xA0 (160 decimal) and U+202F).  Left blank when
		 		omitted.
		
		 The characters ':' and ',' should not be used.  UTF-8 characters can
		 be used.  All characters must be single width. *E1512*
		
		 Each character can be specified as hex:
		
		 ```vim
		 	set listchars=eol:\\x24
		 	set listchars=eol:\\u21b5
		 	set listchars=eol:\\U000021b5
		 ```
		 Note that a double backslash is used.  The number of hex characters
		 must be exactly 2 for \\x, 4 for \\u and 8 for \\U.
		
		 Examples:
		
		 ```vim
		     set lcs=tab:>-,trail:-
		     set lcs=tab:>-,eol:<,nbsp:%
		     set lcs=extends:>,precedes:<
		 ```
		 `hl-NonText` highlighting will be used for "eol", "extends" and
		 "precedes". `hl-Whitespace` for "nbsp", "space", "tab", "multispace",
		 "lead" and "trail".
		
	**/
	extern var listchars : String;
	/**
		```lua
		(field) vim.wo.nu: boolean = true
		```
		
		---
		
		 Print the line number in front of each line
		
		---
		
		 Print the line number in front of each line.  When the 'n' option is
		 excluded from 'cpoptions' a wrapped line will not use the column of
		 line numbers.
		 Use the 'numberwidth' option to adjust the room for the line number.
		 When a long, wrapped line doesn't start with the first character, '-'
		 characters are put before the number.
		 For highlighting see `hl-LineNr`, `hl-CursorLineNr`, and the
		 `:sign-define` "numhl" argument.
		 					*number_relativenumber*
		 The 'relativenumber' option changes the displayed number to be
		 relative to the cursor.  Together with 'number' there are these
		 four combinations (cursor in line 3):
		
		 	'nonu'          'nu'            'nonu'          'nu'
		 	'nornu'         'nornu'         'rnu'           'rnu'
		 ```
		     |apple          |  1 apple      |  2 apple      |  2 apple
		     |pear           |  2 pear       |  1 pear       |  1 pear
		     |nobody         |  3 nobody     |  0 nobody     |3   nobody
		     |there          |  4 there      |  1 there      |  1 there
		 ```
		
		
	**/
	extern var nu : Bool;
	/**
		```lua
		(field) vim.wo.number: boolean = true
		```
		
		---
		
		 Print the line number in front of each line
		
		---
		
		 Print the line number in front of each line.  When the 'n' option is
		 excluded from 'cpoptions' a wrapped line will not use the column of
		 line numbers.
		 Use the 'numberwidth' option to adjust the room for the line number.
		 When a long, wrapped line doesn't start with the first character, '-'
		 characters are put before the number.
		 For highlighting see `hl-LineNr`, `hl-CursorLineNr`, and the
		 `:sign-define` "numhl" argument.
		 					*number_relativenumber*
		 The 'relativenumber' option changes the displayed number to be
		 relative to the cursor.  Together with 'number' there are these
		 four combinations (cursor in line 3):
		
		 	'nonu'          'nu'            'nonu'          'nu'
		 	'nornu'         'nornu'         'rnu'           'rnu'
		 ```
		     |apple          |  1 apple      |  2 apple      |  2 apple
		     |pear           |  2 pear       |  1 pear       |  1 pear
		     |nobody         |  3 nobody     |  0 nobody     |3   nobody
		     |there          |  4 there      |  1 there      |  1 there
		 ```
		
		
	**/
	extern var number : Bool;
	/**
		```lua
		(field) vim.wo.numberwidth: integer
		```
		
		---
		
		 Minimal number of columns to use for the line number.  Only relevant
		 when the 'number' or 'relativenumber' option is set or printing lines
		 with a line number. Since one space is always between the number and
		 the text, there is one less character for the number itself.
		 The value is the minimum width.  A bigger width is used when needed to
		 fit the highest line number in the buffer respectively the number of
		 rows in the window, depending on whether 'number' or 'relativenumber'
		 is set. Thus with the Vim default of 4 there is room for a line number
		 up to 999. When the buffer has 1000 lines five columns will be used.
		 The minimum value is 1, the maximum value is 20.
		
	**/
	extern var numberwidth : Int;
	/**
		```lua
		(field) vim.wo.nuw: integer
		```
		
		---
		
		 Minimal number of columns to use for the line number.  Only relevant
		 when the 'number' or 'relativenumber' option is set or printing lines
		 with a line number. Since one space is always between the number and
		 the text, there is one less character for the number itself.
		 The value is the minimum width.  A bigger width is used when needed to
		 fit the highest line number in the buffer respectively the number of
		 rows in the window, depending on whether 'number' or 'relativenumber'
		 is set. Thus with the Vim default of 4 there is room for a line number
		 up to 999. When the buffer has 1000 lines five columns will be used.
		 The minimum value is 1, the maximum value is 20.
		
	**/
	extern var nuw : Int;
	/**
		```lua
		(field) vim.wo.previewwindow: boolean
		```
		
		---
		
		 Identifies the preview window.  Only one window can have this option
		 set.  It's normally not set directly, but by using one of the commands
		 `:ptag`, `:pedit`, etc.
		
	**/
	extern var previewwindow : Bool;
	/**
		```lua
		(field) vim.wo.pvw: boolean
		```
		
		---
		
		 Identifies the preview window.  Only one window can have this option
		 set.  It's normally not set directly, but by using one of the commands
		 `:ptag`, `:pedit`, etc.
		
	**/
	extern var pvw : Bool;
	/**
		```lua
		(field) vim.wo.relativenumber: boolean = true
		```
		
		---
		
		 Use relative line numbers, so that it is easier to jump with j, k. This will affect the 'number'
		 option above, see `:h number_relativenumber`
		
		---
		
		 Show the line number relative to the line with the cursor in front of
		 each line. Relative line numbers help you use the `count` you can
		 precede some vertical motion commands (e.g. j k + -) with, without
		 having to calculate it yourself. Especially useful in combination with
		 other commands (e.g. y d c < > gq gw =).
		 When the 'n' option is excluded from 'cpoptions' a wrapped
		 line will not use the column of line numbers.
		 The 'numberwidth' option can be used to set the room used for the line
		 number.
		 When a long, wrapped line doesn't start with the first character, '-'
		 characters are put before the number.
		 See `hl-LineNr`  and `hl-CursorLineNr` for the highlighting used for
		 the number.
		
		 The number in front of the cursor line also depends on the value of
		 'number', see `number_relativenumber` for all combinations of the two
		 options.
		
	**/
	extern var relativenumber : Bool;
	/**
		```lua
		(field) vim.wo.rightleft: boolean
		```
		
		---
		
		 When on, display orientation becomes right-to-left, i.e., characters
		 that are stored in the file appear from the right to the left.
		 Using this option, it is possible to edit files for languages that
		 are written from the right to the left such as Hebrew and Arabic.
		 This option is per window, so it is possible to edit mixed files
		 simultaneously, or to view the same file in both ways (this is
		 useful whenever you have a mixed text file with both right-to-left
		 and left-to-right strings so that both sets are displayed properly
		 in different windows).  Also see `rileft.txt`.
		
	**/
	extern var rightleft : Bool;
	/**
		```lua
		(field) vim.wo.rightleftcmd: string
		```
		
		---
		
		 Each word in this option enables the command line editing to work in
		 right-to-left mode for a group of commands:
		
		 	search		"/" and "?" commands
		
		 This is useful for languages such as Hebrew, Arabic and Farsi.
		 The 'rightleft' option must be set for 'rightleftcmd' to take effect.
		
	**/
	extern var rightleftcmd : String;
	/**
		```lua
		(field) vim.wo.rl: boolean
		```
		
		---
		
		 When on, display orientation becomes right-to-left, i.e., characters
		 that are stored in the file appear from the right to the left.
		 Using this option, it is possible to edit files for languages that
		 are written from the right to the left such as Hebrew and Arabic.
		 This option is per window, so it is possible to edit mixed files
		 simultaneously, or to view the same file in both ways (this is
		 useful whenever you have a mixed text file with both right-to-left
		 and left-to-right strings so that both sets are displayed properly
		 in different windows).  Also see `rileft.txt`.
		
	**/
	extern var rl : Bool;
	/**
		```lua
		(field) vim.wo.rlc: string
		```
		
		---
		
		 Each word in this option enables the command line editing to work in
		 right-to-left mode for a group of commands:
		
		 	search		"/" and "?" commands
		
		 This is useful for languages such as Hebrew, Arabic and Farsi.
		 The 'rightleft' option must be set for 'rightleftcmd' to take effect.
		
	**/
	extern var rlc : String;
	/**
		```lua
		(field) vim.wo.rnu: boolean = true
		```
		
		---
		
		 Use relative line numbers, so that it is easier to jump with j, k. This will affect the 'number'
		 option above, see `:h number_relativenumber`
		
		---
		
		 Show the line number relative to the line with the cursor in front of
		 each line. Relative line numbers help you use the `count` you can
		 precede some vertical motion commands (e.g. j k + -) with, without
		 having to calculate it yourself. Especially useful in combination with
		 other commands (e.g. y d c < > gq gw =).
		 When the 'n' option is excluded from 'cpoptions' a wrapped
		 line will not use the column of line numbers.
		 The 'numberwidth' option can be used to set the room used for the line
		 number.
		 When a long, wrapped line doesn't start with the first character, '-'
		 characters are put before the number.
		 See `hl-LineNr`  and `hl-CursorLineNr` for the highlighting used for
		 the number.
		
		 The number in front of the cursor line also depends on the value of
		 'number', see `number_relativenumber` for all combinations of the two
		 options.
		
	**/
	extern var rnu : Bool;
	/**
		```lua
		(field) vim.wo.sbr: string
		```
		
		---
		
		 String to put at the start of lines that have been wrapped.  Useful
		 values are "> " or "+++ ":
		
		 ```vim
		 	let &showbreak = "> "
		 	let &showbreak = '+++ '
		 ```
		 Only printable single-cell characters are allowed, excluding <Tab> and
		 comma (in a future version the comma might be used to separate the
		 part that is shown at the end and at the start of a line).
		 The `hl-NonText` highlight group determines the highlighting.
		 Note that tabs after the showbreak will be displayed differently.
		 If you want the 'showbreak' to appear in between line numbers, add the
		 "n" flag to 'cpoptions'.
		 A window-local value overrules a global value.  If the global value is
		 set and you want no value in the current window use NONE:
		
		 ```vim
		 	setlocal showbreak=NONE
		 ```
		
		
	**/
	extern var sbr : String;
	/**
		```lua
		(field) vim.wo.scb: boolean
		```
		
		---
		
		 See also `scroll-binding`.  When this option is set, scrolling the
		 current window also scrolls other scrollbind windows (windows that
		 also have this option set).  This option is useful for viewing the
		 differences between two versions of a file, see 'diff'.
		 See `'scrollopt'` for options that determine how this option should be
		 interpreted.
		 This option is mostly reset when splitting a window to edit another
		 file.  This means that ":split | edit file" results in two windows
		 with scroll-binding, but ":split file" does not.
		
	**/
	extern var scb : Bool;
	/**
		```lua
		(field) vim.wo.scl: 'auto'|'auto:1'|'auto:2'|'auto:3'|'auto:4'|'auto:5'|'auto:6'|'auto:7'|'auto:8'|'auto:9'|'no'|'number'|'yes'|'yes:1'|'yes:2'|'yes:3'|'yes:4'|'yes:5'|'yes:6'|'yes:7'|'yes:8'|'yes:9'
		```
		
		---
		
		 When and how to draw the signcolumn. Valid values are:
		    "auto"	only when there is a sign to display
		    "auto:[1-9]" resize to accommodate multiple signs up to the
		                 given number (maximum 9), e.g. "auto:4"
		    "auto:[1-8]-[2-9]"
		                 resize to accommodate multiple signs up to the
		 		given maximum number (maximum 9) while keeping
		 		at least the given minimum (maximum 8) fixed
		 		space. The minimum number should always be less
		 		than the maximum number, e.g. "auto:2-5"
		    "no"		never
		    "yes"	always
		    "yes:[1-9]"  always, with fixed space for signs up to the given
		                 number (maximum 9), e.g. "yes:3"
		    "number"	display signs in the 'number' column. If the number
		 		column is not present, then behaves like "auto".
		
	**/
	extern var scl : String;
	/**
		```lua
		(field) vim.wo.scr: integer
		```
		
		---
		
		 Number of lines to scroll with CTRL-U and CTRL-D commands.  Will be
		 set to half the number of lines in the window when the window size
		 changes.  This may happen when enabling the `status-line` or
		 'tabline' option after setting the 'scroll' option.
		 If you give a count to the CTRL-U or CTRL-D command it will
		 be used as the new value for 'scroll'.  Reset to half the window
		 height with ":set scroll=0".
		
	**/
	extern var scr : Int;
	/**
		```lua
		(field) vim.wo.scroll: integer
		```
		
		---
		
		 Number of lines to scroll with CTRL-U and CTRL-D commands.  Will be
		 set to half the number of lines in the window when the window size
		 changes.  This may happen when enabling the `status-line` or
		 'tabline' option after setting the 'scroll' option.
		 If you give a count to the CTRL-U or CTRL-D command it will
		 be used as the new value for 'scroll'.  Reset to half the window
		 height with ":set scroll=0".
		
	**/
	extern var scroll : Int;
	/**
		```lua
		(field) vim.wo.scrollbind: boolean
		```
		
		---
		
		 See also `scroll-binding`.  When this option is set, scrolling the
		 current window also scrolls other scrollbind windows (windows that
		 also have this option set).  This option is useful for viewing the
		 differences between two versions of a file, see 'diff'.
		 See `'scrollopt'` for options that determine how this option should be
		 interpreted.
		 This option is mostly reset when splitting a window to edit another
		 file.  This means that ":split | edit file" results in two windows
		 with scroll-binding, but ":split file" does not.
		
	**/
	extern var scrollbind : Bool;
	/**
		```lua
		(field) vim.wo.scrolloff: integer = 10
		```
		
		---
		
		 Minimal number of screen lines to keep above and below the cursor.
		 This will make some context visible around where you are working.  If
		 you set it to a very large value (999) the cursor line will always be
		 in the middle of the window (except at the start or end of the file or
		 when long lines wrap).
		 After using the local value, go back the global value with one of
		 these two:
		
		 ```vim
		 	setlocal scrolloff<
		 	setlocal scrolloff=-1
		 ```
		 For scrolling horizontally see 'sidescrolloff'.
		
		
		---
		
		 Minimal number of screen lines to keep above and below the cursor.
	**/
	extern var scrolloff : Float;
	/**
		```lua
		(field) vim.wo.showbreak: string
		```
		
		---
		
		 String to put at the start of lines that have been wrapped.  Useful
		 values are "> " or "+++ ":
		
		 ```vim
		 	let &showbreak = "> "
		 	let &showbreak = '+++ '
		 ```
		 Only printable single-cell characters are allowed, excluding <Tab> and
		 comma (in a future version the comma might be used to separate the
		 part that is shown at the end and at the start of a line).
		 The `hl-NonText` highlight group determines the highlighting.
		 Note that tabs after the showbreak will be displayed differently.
		 If you want the 'showbreak' to appear in between line numbers, add the
		 "n" flag to 'cpoptions'.
		 A window-local value overrules a global value.  If the global value is
		 set and you want no value in the current window use NONE:
		
		 ```vim
		 	setlocal showbreak=NONE
		 ```
		
		
	**/
	extern var showbreak : String;
	/**
		```lua
		(field) vim.wo.sidescrolloff: integer
		```
		
		---
		
		 The minimal number of screen columns to keep to the left and to the
		 right of the cursor if 'nowrap' is set.  Setting this option to a
		 value greater than 0 while having `'sidescroll'` also at a non-zero
		 value makes some context visible in the line you are scrolling in
		 horizontally (except at beginning of the line).  Setting this option
		 to a large value (like 999) has the effect of keeping the cursor
		 horizontally centered in the window, as long as one does not come too
		 close to the beginning of the line.
		 After using the local value, go back the global value with one of
		 these two:
		
		 ```vim
		 	setlocal sidescrolloff<
		 	setlocal sidescrolloff=-1
		 ```
		
		 Example: Try this together with 'sidescroll' and 'listchars' as
		 	 in the following example to never allow the cursor to move
		 	 onto the "extends" character:
		
		 ```vim
		
		 	 set nowrap sidescroll=1 listchars=extends:>,precedes:<
		 	 set sidescrolloff=1
		 ```
		
		
	**/
	extern var sidescrolloff : Int;
	/**
		```lua
		(field) vim.wo.signcolumn: 'auto'|'auto:1'|'auto:2'|'auto:3'|'auto:4'|'auto:5'|'auto:6'|'auto:7'|'auto:8'|'auto:9'|'no'|'number'|'yes'|'yes:1'|'yes:2'|'yes:3'|'yes:4'|'yes:5'|'yes:6'|'yes:7'|'yes:8'|'yes:9'
		```
		
		---
		
		 When and how to draw the signcolumn. Valid values are:
		    "auto"	only when there is a sign to display
		    "auto:[1-9]" resize to accommodate multiple signs up to the
		                 given number (maximum 9), e.g. "auto:4"
		    "auto:[1-8]-[2-9]"
		                 resize to accommodate multiple signs up to the
		 		given maximum number (maximum 9) while keeping
		 		at least the given minimum (maximum 8) fixed
		 		space. The minimum number should always be less
		 		than the maximum number, e.g. "auto:2-5"
		    "no"		never
		    "yes"	always
		    "yes:[1-9]"  always, with fixed space for signs up to the given
		                 number (maximum 9), e.g. "yes:3"
		    "number"	display signs in the 'number' column. If the number
		 		column is not present, then behaves like "auto".
		
	**/
	extern var signcolumn : String;
	/**
		```lua
		(field) vim.wo.siso: integer
		```
		
		---
		
		 The minimal number of screen columns to keep to the left and to the
		 right of the cursor if 'nowrap' is set.  Setting this option to a
		 value greater than 0 while having `'sidescroll'` also at a non-zero
		 value makes some context visible in the line you are scrolling in
		 horizontally (except at beginning of the line).  Setting this option
		 to a large value (like 999) has the effect of keeping the cursor
		 horizontally centered in the window, as long as one does not come too
		 close to the beginning of the line.
		 After using the local value, go back the global value with one of
		 these two:
		
		 ```vim
		 	setlocal sidescrolloff<
		 	setlocal sidescrolloff=-1
		 ```
		
		 Example: Try this together with 'sidescroll' and 'listchars' as
		 	 in the following example to never allow the cursor to move
		 	 onto the "extends" character:
		
		 ```vim
		
		 	 set nowrap sidescroll=1 listchars=extends:>,precedes:<
		 	 set sidescrolloff=1
		 ```
		
		
	**/
	extern var siso : Int;
	/**
		```lua
		(field) vim.wo.smoothscroll: boolean
		```
		
		---
		
		 Scrolling works with screen lines.  When 'wrap' is set and the first
		 line in the window wraps part of it may not be visible, as if it is
		 above the window. "<<<" is displayed at the start of the first line,
		 highlighted with `hl-NonText`.
		 You may also want to add "lastline" to the 'display' option to show as
		 much of the last line as possible.
		 NOTE: partly implemented, doesn't work yet for `gj` and `gk`.
		
	**/
	extern var smoothscroll : Bool;
	/**
		```lua
		(field) vim.wo.sms: boolean
		```
		
		---
		
		 Scrolling works with screen lines.  When 'wrap' is set and the first
		 line in the window wraps part of it may not be visible, as if it is
		 above the window. "<<<" is displayed at the start of the first line,
		 highlighted with `hl-NonText`.
		 You may also want to add "lastline" to the 'display' option to show as
		 much of the last line as possible.
		 NOTE: partly implemented, doesn't work yet for `gj` and `gk`.
		
	**/
	extern var sms : Bool;
	/**
		```lua
		(field) vim.wo.so: integer = 10
		```
		
		---
		
		 Minimal number of screen lines to keep above and below the cursor.
		 This will make some context visible around where you are working.  If
		 you set it to a very large value (999) the cursor line will always be
		 in the middle of the window (except at the start or end of the file or
		 when long lines wrap).
		 After using the local value, go back the global value with one of
		 these two:
		
		 ```vim
		 	setlocal scrolloff<
		 	setlocal scrolloff=-1
		 ```
		 For scrolling horizontally see 'sidescrolloff'.
		
		
		---
		
		 Minimal number of screen lines to keep above and below the cursor.
	**/
	extern var so : Float;
	/**
		```lua
		(field) vim.wo.spell: boolean
		```
		
		---
		
		 When on spell checking will be done.  See `spell`.
		 The languages are specified with 'spelllang'.
		
	**/
	extern var spell : Bool;
	/**
		```lua
		(field) vim.wo.statuscolumn: string
		```
		
		---
		
		 When non-empty, this option determines the content of the area to the
		 side of a window, normally containing the fold, sign and number columns.
		 The format of this option is like that of 'statusline'.
		
		 Some of the items from the 'statusline' format are different for
		 'statuscolumn':
		
		 %l	line number column for currently drawn line
		 %s	sign column for currently drawn line
		 %C	fold column for currently drawn line
		
		 The 'statuscolumn' width follows that of the default columns and
		 adapts to the `'numberwidth'`, `'signcolumn'` and `'foldcolumn'` option
		 values (regardless of whether the sign and fold items are present).
		 Additionally, the 'statuscolumn' grows with the size of the evaluated
		 format string, up to a point (following the maximum size of the default
		 fold, sign and number columns). Shrinking only happens when the number
		 of lines in a buffer changes, or the 'statuscolumn' option is set.
		
		 The `v:lnum`    variable holds the line number to be drawn.
		 The `v:relnum`  variable holds the relative line number to be drawn.
		 The `v:virtnum` variable is negative when drawing virtual lines, zero
		 	      when drawing the actual buffer line, and positive when
		 	      drawing the wrapped part of a buffer line.
		
		 When using `v:relnum`, keep in mind that cursor movement by itself will
		 not cause the 'statuscolumn' to update unless `'relativenumber'` is set.
		
		 NOTE: The %@ click execute function item is supported as well but the
		 specified function will be the same for each row in the same column.
		 It cannot be switched out through a dynamic 'statuscolumn' format, the
		 handler should be written with this in mind.
		
		 Examples:
		
		 ```vim
		 	" Line number with bar separator and click handlers:
		 	set statuscolumn=%@SignCb@%s%=%T%@NumCb@%l│%T
		
		 	" Line numbers in hexadecimal for non wrapped part of lines:
		 	let &stc='%=%{v:virtnum>0?"":printf("%x",v:lnum)} '
		
		 	" Human readable line numbers with thousands separator:
		 	let &stc='%{substitute(v:lnum,"\\d\\zs\\ze\\'
		 		   . '%(\\d\\d\\d\\)\\+$",",","g")}'
		
		 	" Both relative and absolute line numbers with different
		 	" highlighting for odd and even relative numbers:
		 	let &stc='%#NonText#%{&nu?v:lnum:""}' .
		 	 '%=%{&rnu&&(v:lnum%2)?"\ ".v:relnum:""}' .
		 	 '%#LineNr#%{&rnu&&!(v:lnum%2)?"\ ".v:relnum:""}'
		 ```
		 WARNING: this expression is evaluated for each screen line so defining
		 an expensive expression can negatively affect render performance.
		
	**/
	extern var statuscolumn : String;
	/**
		```lua
		(field) vim.wo.statusline: string
		```
		
		---
		
		 Sets the `status-line`.
		
		 The option consists of printf style '%' items interspersed with
		 normal text.  Each status line item is of the form:
		   %-0{minwid}.{maxwid}{item}
		 All fields except the {item} are optional.  A single percent sign can
		 be given as "%%".
		
		 						*stl-%!*
		 When the option starts with "%!" then it is used as an expression,
		 evaluated and the result is used as the option value.  Example:
		
		 ```vim
		 	set statusline=%!MyStatusLine()
		 ```
		 The *g:statusline_winid* variable will be set to the `window-ID` of the
		 window that the status line belongs to.
		 The result can contain %{} items that will be evaluated too.
		 Note that the "%!" expression is evaluated in the context of the
		 current window and buffer, while %{} items are evaluated in the
		 context of the window that the statusline belongs to.
		
		 When there is error while evaluating the option then it will be made
		 empty to avoid further errors.  Otherwise screen updating would loop.
		 When the result contains unprintable characters the result is
		 unpredictable.
		
		 Note that the only effect of 'ruler' when this option is set (and
		 'laststatus' is 2 or 3) is controlling the output of `CTRL-G`.
		
		 field	    meaning ~
		 -	    Left justify the item.  The default is right justified
		 	    when minwid is larger than the length of the item.
		 0	    Leading zeroes in numeric items.  Overridden by "-".
		 minwid	    Minimum width of the item, padding as set by "-" & "0".
		 	    Value must be 50 or less.
		 maxwid	    Maximum width of the item.  Truncation occurs with a "<"
		 	    on the left for text items.  Numeric items will be
		 	    shifted down to maxwid-2 digits followed by ">"number
		 	    where number is the amount of missing digits, much like
		 	    an exponential notation.
		 item	    A one letter code as described below.
		
		 Following is a description of the possible statusline items.  The
		 second character in "item" is the type:
		 	N for number
		 	S for string
		 	F for flags as described below
		 	- not applicable
		
		 item  meaning ~
		 f S   Path to the file in the buffer, as typed or relative to current
		       directory.
		 F S   Full path to the file in the buffer.
		 t S   File name (tail) of file in the buffer.
		 m F   Modified flag, text is "[+]"; "[-]" if 'modifiable' is off.
		 M F   Modified flag, text is ",+" or ",-".
		 r F   Readonly flag, text is "[RO]".
		 R F   Readonly flag, text is ",RO".
		 h F   Help buffer flag, text is "[help]".
		 H F   Help buffer flag, text is ",HLP".
		 w F   Preview window flag, text is "[Preview]".
		 W F   Preview window flag, text is ",PRV".
		 y F   Type of file in the buffer, e.g., "[vim]".  See 'filetype'.
		 Y F   Type of file in the buffer, e.g., ",VIM".  See 'filetype'.
		 q S   "[Quickfix List]", "[Location List]" or empty.
		 k S   Value of "b:keymap_name" or 'keymap' when `:lmap` mappings are
		       being used: "<keymap>"
		 n N   Buffer number.
		 b N   Value of character under cursor.
		 B N   As above, in hexadecimal.
		 o N   Byte number in file of byte under cursor, first byte is 1.
		       Mnemonic: Offset from start of file (with one added)
		 O N   As above, in hexadecimal.
		 l N   Line number.
		 L N   Number of lines in buffer.
		 c N   Column number (byte index).
		 v N   Virtual column number (screen column).
		 V N   Virtual column number as -{num}.  Not displayed if equal to 'c'.
		 p N   Percentage through file in lines as in `CTRL-G`.
		 P S   Percentage through file of displayed window.  This is like the
		       percentage described for 'ruler'.  Always 3 in length, unless
		       translated.
		 S S   'showcmd' content, see 'showcmdloc'.
		 a S   Argument list status as in default title.  ({current} of {max})
		       Empty if the argument file count is zero or one.
		 { NF  Evaluate expression between "%{" and "}" and substitute result.
		       Note that there is no "%" before the closing "}".  The
		       expression cannot contain a "}" character, call a function to
		       work around that.  See `stl-%{` below.
		 `{%` -  This is almost same as "{" except the result of the expression is
		       re-evaluated as a statusline format string.  Thus if the
		       return value of expr contains "%" items they will get expanded.
		       The expression can contain the "}" character, the end of
		       expression is denoted by "%}".
		       For example:
		
		 ```vim
		 	func! Stl_filename() abort
		 	    return "%t"
		 	endfunc
		 ```
		 `stl=%{Stl_filename()}`   results in `"%t"`
		         `stl=%{%Stl_filename()%}` results in `"Name of current file"`
		 %} -  End of "{%" expression
		 ( -   Start of item group.  Can be used for setting the width and
		       alignment of a section.  Must be followed by %) somewhere.
		 ) -   End of item group.  No width fields allowed.
		 T N   For 'tabline': start of tab page N label.  Use %T or %X to end
		       the label.  Clicking this label with left mouse button switches
		       to the specified tab page, while clicking it with middle mouse
		       button closes the specified tab page.
		 X N   For 'tabline': start of close tab N label.  Use %X or %T to end
		       the label, e.g.: %3Xclose%X.  Use %999X for a "close current
		       tab" label.  Clicking this label with left mouse button closes
		       the specified tab page.
		 @ N   Start of execute function label. Use %X or %T to end the label,
		       e.g.: %10@SwitchBuffer@foo.c%X.  Clicking this label runs the
		       specified function: in the example when clicking once using left
		       mouse button on "foo.c", a `SwitchBuffer(10, 1, 'l', '    ')`
		       expression will be run.  The specified function receives the
		       following arguments in order:
		       1. minwid field value or zero if no N was specified
		       2. number of mouse clicks to detect multiple clicks
		       3. mouse button used: "l", "r" or "m" for left, right or middle
		          button respectively; one should not rely on third argument
		          being only "l", "r" or "m": any other non-empty string value
		          that contains only ASCII lower case letters may be expected
		          for other mouse buttons
		       4. modifiers pressed: string which contains "s" if shift
		          modifier was pressed, "c" for control, "a" for alt and "m"
		          for meta; currently if modifier is not pressed string
		          contains space instead, but one should not rely on presence
		          of spaces or specific order of modifiers: use `stridx()` to
		          test whether some modifier is present; string is guaranteed
		          to contain only ASCII letters and spaces, one letter per
		          modifier; "?" modifier may also be present, but its presence
		          is a bug that denotes that new mouse button recognition was
		          added without modifying code that reacts on mouse clicks on
		          this label.
		       Use `getmousepos()`.winid in the specified function to get the
		       corresponding window id of the clicked item.
		 \< -   Where to truncate line if too long.  Default is at the start.
		       No width fields allowed.
		 = -   Separation point between alignment sections.  Each section will
		       be separated by an equal number of spaces.  With one %= what
		       comes after it will be right-aligned.  With two %= there is a
		       middle part, with white space left and right of it.
		       No width fields allowed.
		 # -   Set highlight group.  The name must follow and then a # again.
		       Thus use %#HLname# for highlight group HLname.  The same
		       highlighting is used, also for the statusline of non-current
		       windows.
		 * -   Set highlight group to User{N}, where {N} is taken from the
		       minwid field, e.g. %1*.  Restore normal highlight with %* or %0*.
		       The difference between User{N} and StatusLine will be applied to
		       StatusLineNC for the statusline of non-current windows.
		       The number N must be between 1 and 9.  See `hl-User1..9`
		
		 When displaying a flag, Vim removes the leading comma, if any, when
		 that flag comes right after plaintext.  This will make a nice display
		 when flags are used like in the examples below.
		
		 When all items in a group becomes an empty string (i.e. flags that are
		 not set) and a minwid is not set for the group, the whole group will
		 become empty.  This will make a group like the following disappear
		 completely from the statusline when none of the flags are set.
		
		 ```vim
		 	set statusline=...%(\ [%M%R%H]%)...
		 ```
		 Beware that an expression is evaluated each and every time the status
		 line is displayed.
		 			*stl-%{* *g:actual_curbuf* *g:actual_curwin*
		 While evaluating %{} the current buffer and current window will be set
		 temporarily to that of the window (and buffer) whose statusline is
		 currently being drawn.  The expression will evaluate in this context.
		 The variable "g:actual_curbuf" is set to the `bufnr()` number of the
		 real current buffer and "g:actual_curwin" to the `window-ID` of the
		 real current window.  These values are strings.
		
		 The 'statusline' option will be evaluated in the `sandbox` if set from
		 a modeline, see `sandbox-option`.
		 This option cannot be set in a modeline when 'modelineexpr' is off.
		
		 It is not allowed to change text or jump to another window while
		 evaluating 'statusline' `textlock`.
		
		 If the statusline is not updated when you want it (e.g., after setting
		 a variable that's used in an expression), you can force an update by
		 using `:redrawstatus`.
		
		 A result of all digits is regarded a number for display purposes.
		 Otherwise the result is taken as flag text and applied to the rules
		 described above.
		
		 Watch out for errors in expressions.  They may render Vim unusable!
		 If you are stuck, hold down ':' or 'Q' to get a prompt, then quit and
		 edit your vimrc or whatever with "vim --clean" to get it right.
		
		 Examples:
		 Emulate standard status line with 'ruler' set
		
		 ```vim
		   set statusline=%<%f\ %h%w%m%r%=%-14.(%l,%c%V%)\ %P
		 ```
		 Similar, but add ASCII value of char under the cursor (like "ga")
		
		 ```vim
		   set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P
		 ```
		 Display byte count and byte value, modified flag in red.
		
		 ```vim
		   set statusline=%<%f%=\ [%1*%M%*%n%R%H]\ %-19(%3l,%02c%03V%)%O'%02b'
		   hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red
		 ```
		 Display a ,GZ flag if a compressed file is loaded
		
		 ```vim
		   set statusline=...%r%{VarExists('b:gzflag','\ [GZ]')}%h...
		 ```
		 In the `:autocmd`'s:
		
		 ```vim
		   let b:gzflag = 1
		 ```
		 And:
		
		 ```vim
		   unlet b:gzflag
		 ```
		 And define this function:
		
		 ```vim
		   function VarExists(var, val)
		       if exists(a:var) | return a:val | else | return '' | endif
		   endfunction
		 ```
		
		
	**/
	extern var statusline : String;
	/**
		```lua
		(field) vim.wo.stc: string
		```
		
		---
		
		 When non-empty, this option determines the content of the area to the
		 side of a window, normally containing the fold, sign and number columns.
		 The format of this option is like that of 'statusline'.
		
		 Some of the items from the 'statusline' format are different for
		 'statuscolumn':
		
		 %l	line number column for currently drawn line
		 %s	sign column for currently drawn line
		 %C	fold column for currently drawn line
		
		 The 'statuscolumn' width follows that of the default columns and
		 adapts to the `'numberwidth'`, `'signcolumn'` and `'foldcolumn'` option
		 values (regardless of whether the sign and fold items are present).
		 Additionally, the 'statuscolumn' grows with the size of the evaluated
		 format string, up to a point (following the maximum size of the default
		 fold, sign and number columns). Shrinking only happens when the number
		 of lines in a buffer changes, or the 'statuscolumn' option is set.
		
		 The `v:lnum`    variable holds the line number to be drawn.
		 The `v:relnum`  variable holds the relative line number to be drawn.
		 The `v:virtnum` variable is negative when drawing virtual lines, zero
		 	      when drawing the actual buffer line, and positive when
		 	      drawing the wrapped part of a buffer line.
		
		 When using `v:relnum`, keep in mind that cursor movement by itself will
		 not cause the 'statuscolumn' to update unless `'relativenumber'` is set.
		
		 NOTE: The %@ click execute function item is supported as well but the
		 specified function will be the same for each row in the same column.
		 It cannot be switched out through a dynamic 'statuscolumn' format, the
		 handler should be written with this in mind.
		
		 Examples:
		
		 ```vim
		 	" Line number with bar separator and click handlers:
		 	set statuscolumn=%@SignCb@%s%=%T%@NumCb@%l│%T
		
		 	" Line numbers in hexadecimal for non wrapped part of lines:
		 	let &stc='%=%{v:virtnum>0?"":printf("%x",v:lnum)} '
		
		 	" Human readable line numbers with thousands separator:
		 	let &stc='%{substitute(v:lnum,"\\d\\zs\\ze\\'
		 		   . '%(\\d\\d\\d\\)\\+$",",","g")}'
		
		 	" Both relative and absolute line numbers with different
		 	" highlighting for odd and even relative numbers:
		 	let &stc='%#NonText#%{&nu?v:lnum:""}' .
		 	 '%=%{&rnu&&(v:lnum%2)?"\ ".v:relnum:""}' .
		 	 '%#LineNr#%{&rnu&&!(v:lnum%2)?"\ ".v:relnum:""}'
		 ```
		 WARNING: this expression is evaluated for each screen line so defining
		 an expensive expression can negatively affect render performance.
		
	**/
	extern var stc : String;
	/**
		```lua
		(field) vim.wo.stl: string
		```
		
		---
		
		 Sets the `status-line`.
		
		 The option consists of printf style '%' items interspersed with
		 normal text.  Each status line item is of the form:
		   %-0{minwid}.{maxwid}{item}
		 All fields except the {item} are optional.  A single percent sign can
		 be given as "%%".
		
		 						*stl-%!*
		 When the option starts with "%!" then it is used as an expression,
		 evaluated and the result is used as the option value.  Example:
		
		 ```vim
		 	set statusline=%!MyStatusLine()
		 ```
		 The *g:statusline_winid* variable will be set to the `window-ID` of the
		 window that the status line belongs to.
		 The result can contain %{} items that will be evaluated too.
		 Note that the "%!" expression is evaluated in the context of the
		 current window and buffer, while %{} items are evaluated in the
		 context of the window that the statusline belongs to.
		
		 When there is error while evaluating the option then it will be made
		 empty to avoid further errors.  Otherwise screen updating would loop.
		 When the result contains unprintable characters the result is
		 unpredictable.
		
		 Note that the only effect of 'ruler' when this option is set (and
		 'laststatus' is 2 or 3) is controlling the output of `CTRL-G`.
		
		 field	    meaning ~
		 -	    Left justify the item.  The default is right justified
		 	    when minwid is larger than the length of the item.
		 0	    Leading zeroes in numeric items.  Overridden by "-".
		 minwid	    Minimum width of the item, padding as set by "-" & "0".
		 	    Value must be 50 or less.
		 maxwid	    Maximum width of the item.  Truncation occurs with a "<"
		 	    on the left for text items.  Numeric items will be
		 	    shifted down to maxwid-2 digits followed by ">"number
		 	    where number is the amount of missing digits, much like
		 	    an exponential notation.
		 item	    A one letter code as described below.
		
		 Following is a description of the possible statusline items.  The
		 second character in "item" is the type:
		 	N for number
		 	S for string
		 	F for flags as described below
		 	- not applicable
		
		 item  meaning ~
		 f S   Path to the file in the buffer, as typed or relative to current
		       directory.
		 F S   Full path to the file in the buffer.
		 t S   File name (tail) of file in the buffer.
		 m F   Modified flag, text is "[+]"; "[-]" if 'modifiable' is off.
		 M F   Modified flag, text is ",+" or ",-".
		 r F   Readonly flag, text is "[RO]".
		 R F   Readonly flag, text is ",RO".
		 h F   Help buffer flag, text is "[help]".
		 H F   Help buffer flag, text is ",HLP".
		 w F   Preview window flag, text is "[Preview]".
		 W F   Preview window flag, text is ",PRV".
		 y F   Type of file in the buffer, e.g., "[vim]".  See 'filetype'.
		 Y F   Type of file in the buffer, e.g., ",VIM".  See 'filetype'.
		 q S   "[Quickfix List]", "[Location List]" or empty.
		 k S   Value of "b:keymap_name" or 'keymap' when `:lmap` mappings are
		       being used: "<keymap>"
		 n N   Buffer number.
		 b N   Value of character under cursor.
		 B N   As above, in hexadecimal.
		 o N   Byte number in file of byte under cursor, first byte is 1.
		       Mnemonic: Offset from start of file (with one added)
		 O N   As above, in hexadecimal.
		 l N   Line number.
		 L N   Number of lines in buffer.
		 c N   Column number (byte index).
		 v N   Virtual column number (screen column).
		 V N   Virtual column number as -{num}.  Not displayed if equal to 'c'.
		 p N   Percentage through file in lines as in `CTRL-G`.
		 P S   Percentage through file of displayed window.  This is like the
		       percentage described for 'ruler'.  Always 3 in length, unless
		       translated.
		 S S   'showcmd' content, see 'showcmdloc'.
		 a S   Argument list status as in default title.  ({current} of {max})
		       Empty if the argument file count is zero or one.
		 { NF  Evaluate expression between "%{" and "}" and substitute result.
		       Note that there is no "%" before the closing "}".  The
		       expression cannot contain a "}" character, call a function to
		       work around that.  See `stl-%{` below.
		 `{%` -  This is almost same as "{" except the result of the expression is
		       re-evaluated as a statusline format string.  Thus if the
		       return value of expr contains "%" items they will get expanded.
		       The expression can contain the "}" character, the end of
		       expression is denoted by "%}".
		       For example:
		
		 ```vim
		 	func! Stl_filename() abort
		 	    return "%t"
		 	endfunc
		 ```
		 `stl=%{Stl_filename()}`   results in `"%t"`
		         `stl=%{%Stl_filename()%}` results in `"Name of current file"`
		 %} -  End of "{%" expression
		 ( -   Start of item group.  Can be used for setting the width and
		       alignment of a section.  Must be followed by %) somewhere.
		 ) -   End of item group.  No width fields allowed.
		 T N   For 'tabline': start of tab page N label.  Use %T or %X to end
		       the label.  Clicking this label with left mouse button switches
		       to the specified tab page, while clicking it with middle mouse
		       button closes the specified tab page.
		 X N   For 'tabline': start of close tab N label.  Use %X or %T to end
		       the label, e.g.: %3Xclose%X.  Use %999X for a "close current
		       tab" label.  Clicking this label with left mouse button closes
		       the specified tab page.
		 @ N   Start of execute function label. Use %X or %T to end the label,
		       e.g.: %10@SwitchBuffer@foo.c%X.  Clicking this label runs the
		       specified function: in the example when clicking once using left
		       mouse button on "foo.c", a `SwitchBuffer(10, 1, 'l', '    ')`
		       expression will be run.  The specified function receives the
		       following arguments in order:
		       1. minwid field value or zero if no N was specified
		       2. number of mouse clicks to detect multiple clicks
		       3. mouse button used: "l", "r" or "m" for left, right or middle
		          button respectively; one should not rely on third argument
		          being only "l", "r" or "m": any other non-empty string value
		          that contains only ASCII lower case letters may be expected
		          for other mouse buttons
		       4. modifiers pressed: string which contains "s" if shift
		          modifier was pressed, "c" for control, "a" for alt and "m"
		          for meta; currently if modifier is not pressed string
		          contains space instead, but one should not rely on presence
		          of spaces or specific order of modifiers: use `stridx()` to
		          test whether some modifier is present; string is guaranteed
		          to contain only ASCII letters and spaces, one letter per
		          modifier; "?" modifier may also be present, but its presence
		          is a bug that denotes that new mouse button recognition was
		          added without modifying code that reacts on mouse clicks on
		          this label.
		       Use `getmousepos()`.winid in the specified function to get the
		       corresponding window id of the clicked item.
		 \< -   Where to truncate line if too long.  Default is at the start.
		       No width fields allowed.
		 = -   Separation point between alignment sections.  Each section will
		       be separated by an equal number of spaces.  With one %= what
		       comes after it will be right-aligned.  With two %= there is a
		       middle part, with white space left and right of it.
		       No width fields allowed.
		 # -   Set highlight group.  The name must follow and then a # again.
		       Thus use %#HLname# for highlight group HLname.  The same
		       highlighting is used, also for the statusline of non-current
		       windows.
		 * -   Set highlight group to User{N}, where {N} is taken from the
		       minwid field, e.g. %1*.  Restore normal highlight with %* or %0*.
		       The difference between User{N} and StatusLine will be applied to
		       StatusLineNC for the statusline of non-current windows.
		       The number N must be between 1 and 9.  See `hl-User1..9`
		
		 When displaying a flag, Vim removes the leading comma, if any, when
		 that flag comes right after plaintext.  This will make a nice display
		 when flags are used like in the examples below.
		
		 When all items in a group becomes an empty string (i.e. flags that are
		 not set) and a minwid is not set for the group, the whole group will
		 become empty.  This will make a group like the following disappear
		 completely from the statusline when none of the flags are set.
		
		 ```vim
		 	set statusline=...%(\ [%M%R%H]%)...
		 ```
		 Beware that an expression is evaluated each and every time the status
		 line is displayed.
		 			*stl-%{* *g:actual_curbuf* *g:actual_curwin*
		 While evaluating %{} the current buffer and current window will be set
		 temporarily to that of the window (and buffer) whose statusline is
		 currently being drawn.  The expression will evaluate in this context.
		 The variable "g:actual_curbuf" is set to the `bufnr()` number of the
		 real current buffer and "g:actual_curwin" to the `window-ID` of the
		 real current window.  These values are strings.
		
		 The 'statusline' option will be evaluated in the `sandbox` if set from
		 a modeline, see `sandbox-option`.
		 This option cannot be set in a modeline when 'modelineexpr' is off.
		
		 It is not allowed to change text or jump to another window while
		 evaluating 'statusline' `textlock`.
		
		 If the statusline is not updated when you want it (e.g., after setting
		 a variable that's used in an expression), you can force an update by
		 using `:redrawstatus`.
		
		 A result of all digits is regarded a number for display purposes.
		 Otherwise the result is taken as flag text and applied to the rules
		 described above.
		
		 Watch out for errors in expressions.  They may render Vim unusable!
		 If you are stuck, hold down ':' or 'Q' to get a prompt, then quit and
		 edit your vimrc or whatever with "vim --clean" to get it right.
		
		 Examples:
		 Emulate standard status line with 'ruler' set
		
		 ```vim
		   set statusline=%<%f\ %h%w%m%r%=%-14.(%l,%c%V%)\ %P
		 ```
		 Similar, but add ASCII value of char under the cursor (like "ga")
		
		 ```vim
		   set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P
		 ```
		 Display byte count and byte value, modified flag in red.
		
		 ```vim
		   set statusline=%<%f%=\ [%1*%M%*%n%R%H]\ %-19(%3l,%02c%03V%)%O'%02b'
		   hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red
		 ```
		 Display a ,GZ flag if a compressed file is loaded
		
		 ```vim
		   set statusline=...%r%{VarExists('b:gzflag','\ [GZ]')}%h...
		 ```
		 In the `:autocmd`'s:
		
		 ```vim
		   let b:gzflag = 1
		 ```
		 And:
		
		 ```vim
		   unlet b:gzflag
		 ```
		 And define this function:
		
		 ```vim
		   function VarExists(var, val)
		       if exists(a:var) | return a:val | else | return '' | endif
		   endfunction
		 ```
		
		
	**/
	extern var stl : String;
	/**
		```lua
		(field) vim.wo.ve: string
		```
		
		---
		
		 A comma-separated list of these words:
		     block	Allow virtual editing in Visual block mode.
		     insert	Allow virtual editing in Insert mode.
		     all		Allow virtual editing in all modes.
		     onemore	Allow the cursor to move just past the end of the line
		     none	When used as the local value, do not allow virtual
		 		editing even when the global value is set.  When used
		 		as the global value, "none" is the same as "".
		     NONE	Alternative spelling of "none".
		
		 Virtual editing means that the cursor can be positioned where there is
		 no actual character.  This can be halfway into a tab or beyond the end
		 of the line.  Useful for selecting a rectangle in Visual mode and
		 editing a table.
		 "onemore" is not the same, it will only allow moving the cursor just
		 after the last character of the line.  This makes some commands more
		 consistent.  Previously the cursor was always past the end of the line
		 if the line was empty.  But it is far from Vi compatible.  It may also
		 break some plugins or Vim scripts.  For example because `l` can move
		 the cursor after the last character.  Use with care!
		 Using the `$` command will move to the last character in the line, not
		 past it.  This may actually move the cursor to the left!
		 The `g$` command will move to the end of the screen line.
		 It doesn't make sense to combine "all" with "onemore", but you will
		 not get a warning for it.
		 When combined with other words, "none" is ignored.
		
	**/
	extern var ve : String;
	/**
		```lua
		(field) vim.wo.virtualedit: string
		```
		
		---
		
		 A comma-separated list of these words:
		     block	Allow virtual editing in Visual block mode.
		     insert	Allow virtual editing in Insert mode.
		     all		Allow virtual editing in all modes.
		     onemore	Allow the cursor to move just past the end of the line
		     none	When used as the local value, do not allow virtual
		 		editing even when the global value is set.  When used
		 		as the global value, "none" is the same as "".
		     NONE	Alternative spelling of "none".
		
		 Virtual editing means that the cursor can be positioned where there is
		 no actual character.  This can be halfway into a tab or beyond the end
		 of the line.  Useful for selecting a rectangle in Visual mode and
		 editing a table.
		 "onemore" is not the same, it will only allow moving the cursor just
		 after the last character of the line.  This makes some commands more
		 consistent.  Previously the cursor was always past the end of the line
		 if the line was empty.  But it is far from Vi compatible.  It may also
		 break some plugins or Vim scripts.  For example because `l` can move
		 the cursor after the last character.  Use with care!
		 Using the `$` command will move to the last character in the line, not
		 past it.  This may actually move the cursor to the left!
		 The `g$` command will move to the end of the screen line.
		 It doesn't make sense to combine "all" with "onemore", but you will
		 not get a warning for it.
		 When combined with other words, "none" is ignored.
		
	**/
	extern var virtualedit : String;
	/**
		```lua
		(field) vim.wo.wbr: string
		```
		
		---
		
		 When non-empty, this option enables the window bar and determines its
		 contents. The window bar is a bar that's shown at the top of every
		 window with it enabled. The value of 'winbar' is evaluated like with
		 'statusline'.
		
		 When changing something that is used in 'winbar' that does not trigger
		 it to be updated, use `:redrawstatus`.
		
		 Floating windows do not use the global value of 'winbar'. The
		 window-local value of 'winbar' must be set for a floating window to
		 have a window bar.
		
		 This option cannot be set in a modeline when 'modelineexpr' is off.
		
	**/
	extern var wbr : String;
	/**
		```lua
		(field) vim.wo.wfb: boolean
		```
		
		---
		
		 If enabled, the window and the buffer it is displaying are paired.
		 For example, attempting to change the buffer with `:edit` will fail.
		 Other commands which change a window's buffer such as `:cnext` will
		 also skip any window with 'winfixbuf' enabled.  However if an Ex
		 command has a "!" modifier, it can force switching buffers.
		
	**/
	extern var wfb : Bool;
	/**
		```lua
		(field) vim.wo.wfh: boolean
		```
		
		---
		
		 Keep the window height when windows are opened or closed and
		 'equalalways' is set.  Also for `CTRL-W_=`.  Set by default for the
		 `preview-window` and `quickfix-window`.
		 The height may be changed anyway when running out of room.
		
	**/
	extern var wfh : Bool;
	/**
		```lua
		(field) vim.wo.wfw: boolean
		```
		
		---
		
		 Keep the window width when windows are opened or closed and
		 'equalalways' is set.  Also for `CTRL-W_=`.
		 The width may be changed anyway when running out of room.
		
	**/
	extern var wfw : Bool;
	/**
		```lua
		(field) vim.wo.winbar: string
		```
		
		---
		
		 When non-empty, this option enables the window bar and determines its
		 contents. The window bar is a bar that's shown at the top of every
		 window with it enabled. The value of 'winbar' is evaluated like with
		 'statusline'.
		
		 When changing something that is used in 'winbar' that does not trigger
		 it to be updated, use `:redrawstatus`.
		
		 Floating windows do not use the global value of 'winbar'. The
		 window-local value of 'winbar' must be set for a floating window to
		 have a window bar.
		
		 This option cannot be set in a modeline when 'modelineexpr' is off.
		
	**/
	extern var winbar : String;
	/**
		```lua
		(field) vim.wo.winbl: integer
		```
		
		---
		
		 Enables pseudo-transparency for a floating window. Valid values are in
		 the range of 0 for fully opaque window (disabled) to 100 for fully
		 transparent background. Values between 0-30 are typically most useful.
		
		 UI-dependent. Works best with RGB colors. 'termguicolors'
		
	**/
	extern var winbl : Int;
	/**
		```lua
		(field) vim.wo.winblend: integer
		```
		
		---
		
		 Enables pseudo-transparency for a floating window. Valid values are in
		 the range of 0 for fully opaque window (disabled) to 100 for fully
		 transparent background. Values between 0-30 are typically most useful.
		
		 UI-dependent. Works best with RGB colors. 'termguicolors'
		
	**/
	extern var winblend : Int;
	/**
		```lua
		(field) vim.wo.winfixbuf: boolean
		```
		
		---
		
		 If enabled, the window and the buffer it is displaying are paired.
		 For example, attempting to change the buffer with `:edit` will fail.
		 Other commands which change a window's buffer such as `:cnext` will
		 also skip any window with 'winfixbuf' enabled.  However if an Ex
		 command has a "!" modifier, it can force switching buffers.
		
	**/
	extern var winfixbuf : Bool;
	/**
		```lua
		(field) vim.wo.winfixheight: boolean
		```
		
		---
		
		 Keep the window height when windows are opened or closed and
		 'equalalways' is set.  Also for `CTRL-W_=`.  Set by default for the
		 `preview-window` and `quickfix-window`.
		 The height may be changed anyway when running out of room.
		
	**/
	extern var winfixheight : Bool;
	/**
		```lua
		(field) vim.wo.winfixwidth: boolean
		```
		
		---
		
		 Keep the window width when windows are opened or closed and
		 'equalalways' is set.  Also for `CTRL-W_=`.
		 The width may be changed anyway when running out of room.
		
	**/
	extern var winfixwidth : Bool;
	/**
		```lua
		(field) vim.wo.winhighlight: string
		```
		
		---
		
		 Window-local highlights.  Comma-delimited list of highlight
		 `group-name` pairs "{hl-from}:{hl-to},..." where each {hl-from} is
		 a `highlight-groups` item to be overridden by {hl-to} group in
		 the window.
		
		 Note: highlight namespaces take precedence over 'winhighlight'.
		 See `nvim_win_set_hl_ns()` and `nvim_set_hl()`.
		
		 Highlights of vertical separators are determined by the window to the
		 left of the separator.  The 'tabline' highlight of a tabpage is
		 decided by the last-focused window of the tabpage.  Highlights of
		 the popupmenu are determined by the current window.  Highlights in the
		 message area cannot be overridden.
		
		 Example: show a different color for non-current windows:
		
		 ```vim
		 	set winhighlight=Normal:MyNormal,NormalNC:MyNormalNC
		 ```
		
		
	**/
	extern var winhighlight : String;
	/**
		```lua
		(field) vim.wo.winhl: string
		```
		
		---
		
		 Window-local highlights.  Comma-delimited list of highlight
		 `group-name` pairs "{hl-from}:{hl-to},..." where each {hl-from} is
		 a `highlight-groups` item to be overridden by {hl-to} group in
		 the window.
		
		 Note: highlight namespaces take precedence over 'winhighlight'.
		 See `nvim_win_set_hl_ns()` and `nvim_set_hl()`.
		
		 Highlights of vertical separators are determined by the window to the
		 left of the separator.  The 'tabline' highlight of a tabpage is
		 decided by the last-focused window of the tabpage.  Highlights of
		 the popupmenu are determined by the current window.  Highlights in the
		 message area cannot be overridden.
		
		 Example: show a different color for non-current windows:
		
		 ```vim
		 	set winhighlight=Normal:MyNormal,NormalNC:MyNormalNC
		 ```
		
		
	**/
	extern var winhl : String;
	/**
		```lua
		(field) vim.wo.wrap: boolean
		```
		
		---
		
		 This option changes how text is displayed.  It doesn't change the text
		 in the buffer, see 'textwidth' for that.
		 When on, lines longer than the width of the window will wrap and
		 displaying continues on the next line.  When off lines will not wrap
		 and only part of long lines will be displayed.  When the cursor is
		 moved to a part that is not shown, the screen will scroll
		 horizontally.
		 The line will be broken in the middle of a word if necessary.  See
		 'linebreak' to get the break at a word boundary.
		 To make scrolling horizontally a bit more useful, try this:
		
		 ```vim
		 	set sidescroll=5
		 	set listchars+=precedes:<,extends:>
		 ```
		 See 'sidescroll', 'listchars' and `wrap-off`.
		 This option can't be set from a `modeline` when the 'diff' option is
		 on.
		
	**/
	extern var wrap : Bool;
}