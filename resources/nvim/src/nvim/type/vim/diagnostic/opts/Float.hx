package nvim.type.vim.diagnostic.opts;

/**
	```lua
	(class) vim.diagnostic.Opts.Float
	```
**/
@:structInit class Float {
	/**
		```lua
		(field) vim.diagnostic.Opts.Float.border: string?
		```
		
		---
		
		see |nvim_open_win()|.
	**/
	@:optional
	extern public var border : Null<String>;
	/**
		```lua
		(field) vim.diagnostic.Opts.Float.bufnr: integer?
		```
		
		---
		
		
		 Buffer number to show diagnostics from.
		 (default: current buffer)
	**/
	@:optional
	extern public var bufnr : Null<Float>;
	/**
		```lua
		(field) vim.diagnostic.Opts.Float.focus_id: string?
		```
	**/
	@:optional
	extern public var focus_id : Null<String>;
	/**
		```lua
		(field) vim.diagnostic.Opts.Float.format: fun(diagnostic: vim.Diagnostic):string??
		```
		
		---
		
		
		 A function that takes a diagnostic as input and returns a string or nil.
		 If the return value is nil, the diagnostic is not displayed by the handler.
		 Else the output text is used to display the diagnostic.
		 Overrides the setting from |vim.diagnostic.config()|.
		
		---
		
		```lua
		function (diagnostic: vim.Diagnostic)
		  -> string?
		```
	**/
	@:optional
	extern public var format : Null<(diagnostic:nvim.type.vim.Diagnostic) -> Null<String>>;
	/**
		```lua
		(field) vim.diagnostic.Opts.Float.header: (string|[string, any])?
		```
		
		---
		
		
		 String to use as the header for the floating window. If a table, it is
		 interpreted as a `[text, hl_group]` tuple.
		 Overrides the setting from |vim.diagnostic.config()|.
	**/
	@:optional
	extern public var header : Null<String>;
	/**
		```lua
		(field) vim.diagnostic.Opts.Float.namespace: integer?
		```
		
		---
		
		
		 Limit diagnostics to the given namespace
	**/
	@:optional
	extern public var namespace : Null<Float>;
	/**
		```lua
		(field) vim.diagnostic.Opts.Float.pos: (integer|[integer, integer])?
		```
		
		---
		
		
		 If {scope} is "line" or "cursor", use this position rather than the cursor
		 position. If a number, interpreted as a line number; otherwise, a
		 (row, col) tuple.
	**/
	extern public var pos : Dynamic;
	/**
		```lua
		(field) vim.diagnostic.Opts.Float.prefix: (string|table|fun(diagnostic: vim.Diagnostic, i: integer, total: integer):string, string)?
		```
		
		---
		
		
		 Prefix each diagnostic in the floating window:
		 - If a `function`, {i} is the index of the diagnostic being evaluated and
		   {total} is the total number of diagnostics displayed in the window. The
		   function should return a `string` which is prepended to each diagnostic
		   in the window as well as an (optional) highlight group which will be
		   used to highlight the prefix.
		 - If a `table`, it is interpreted as a `[text, hl_group]` tuple as
		   in |nvim_echo()|
		 - If a `string`, it is prepended to each diagnostic in the window with no
		   highlight.
		 Overrides the setting from |vim.diagnostic.config()|.
		
		---
		
		```lua
		function (diagnostic: vim.Diagnostic, i: integer, total: integer)
		  -> string
		  2. string
		```
	**/
	@:optional
	extern public var prefix : Null<haxe.extern.EitherType<String, haxe.extern.EitherType<lua.Table.AnyTable, (diagnostic:nvim.type.vim.Diagnostic, i:Float, total:Float) -> nvim.helper.Multireturn<String, String, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>>>>;
	/**
		```lua
		(field) vim.diagnostic.Opts.Float.scope: ('b'|'buffer'|'c'|'cursor'|'l'|'line')?
		```
		
		---
		
		
		 Show diagnostics from the whole buffer (`buffer"`, the current cursor line
		 (`line`), or the current cursor position (`cursor`). Shorthand versions
		 are also accepted (`c` for `cursor`, `l` for `line`, `b` for `buffer`).
		 (default: `line`)
	**/
	@:optional
	extern public var scope : Null<String>;
	/**
		```lua
		(field) vim.diagnostic.Opts.Float.severity: (vim.diagnostic.Severity|vim.diagnostic.Severity[]|{ min: vim.diagnostic.Severity, max: vim.diagnostic.Severity })?
		```
		
		---
		
		 See |diagnostic-severity| and |vim.diagnostic.get()|
		
		---
		
		
		 See |diagnostic-severity|.
		 Overrides the setting from |vim.diagnostic.config()|.
		
		---
		
		 @nodoc
	**/
	@:optional
	extern public var severity : Null<nvim.type.vim.diagnostic.SeverityFilter>;
	/**
		```lua
		(field) vim.diagnostic.Opts.Float.severity_sort: (boolean|{ reverse: boolean })?
		```
		
		---
		
		
		 Sort diagnostics by severity.
		 Overrides the setting from |vim.diagnostic.config()|.
		 (default: `false`)
	**/
	@:optional
	extern public var severity_sort : Null<haxe.extern.EitherType<Bool, { @:optional
	var reverse : Null<Bool>; }>>;
	/**
		```lua
		(field) vim.diagnostic.Opts.Float.source: (boolean|'if_many')?
		```
		
		---
		
		
		 Include the diagnostic source in the message.
		 Use "if_many" to only show sources if there is more than one source of
		 diagnostics in the buffer. Otherwise, any truthy value means to always show
		 the diagnostic source.
		 Overrides the setting from |vim.diagnostic.config()|.
	**/
	@:optional
	extern public var source : Null<haxe.extern.EitherType<Bool, String>>;
	/**
		```lua
		(field) vim.diagnostic.Opts.Float.suffix: (string|table|fun(diagnostic: vim.Diagnostic, i: integer, total: integer):string, string)?
		```
		
		---
		
		
		 Same as {prefix}, but appends the text to the diagnostic instead of
		 prepending it.
		 Overrides the setting from |vim.diagnostic.config()|.
		
		---
		
		```lua
		function (diagnostic: vim.Diagnostic, i: integer, total: integer)
		  -> string
		  2. string
		```
	**/
	@:optional
	extern public var suffix : Null<haxe.extern.EitherType<String, haxe.extern.EitherType<lua.Table.AnyTable, (diagnostic:nvim.type.vim.Diagnostic, i:Float, total:Float) -> nvim.helper.Multireturn<String, String, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>>>>;
}