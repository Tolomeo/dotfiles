package nvim.type.vim.diagnostic.opts;

/**
	```lua
	(class) vim.diagnostic.Opts.VirtualText
	```
**/
@:structInit class VirtualText {
	/**
		```lua
		(field) vim.diagnostic.Opts.VirtualText.current_line: boolean?
		```
		
		---
		
		
		 Only show diagnostics for the current line.
		 (default `false`)
	**/
	@:optional
	extern public var current_line : Null<Bool>;
	/**
		```lua
		(field) vim.diagnostic.Opts.VirtualText.format: fun(diagnostic: vim.Diagnostic):string??
		```
		
		---
		
		
		 If not nil, the return value is the text used to display the diagnostic. Example:
		 ```lua
		 function(diagnostic)
		   if diagnostic.severity == vim.diagnostic.severity.ERROR then
		     return string.format("E: %s", diagnostic.message)
		   end
		   return diagnostic.message
		 end
		 ```
		 If the return value is nil, the diagnostic is not displayed by the handler.
		
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
		(field) vim.diagnostic.Opts.VirtualText.hl_mode: ('blend'|'combine'|'replace')?
		```
		
		---
		
		
		 See |nvim_buf_set_extmark()|.
	**/
	@:optional
	extern public var hl_mode : Null<String>;
	/**
		```lua
		(field) vim.diagnostic.Opts.VirtualText.prefix: (string|fun(diagnostic: vim.Diagnostic, i: integer, total: integer):string)?
		```
		
		---
		
		
		 Prepend diagnostic message with prefix. If a `function`, {i} is the index
		 of the diagnostic being evaluated, and {total} is the total number of
		 diagnostics for the line. This can be used to render diagnostic symbols
		 or error codes.
		
		---
		
		```lua
		function (diagnostic: vim.Diagnostic, i: integer, total: integer)
		  -> string
		```
	**/
	@:optional
	extern public var prefix : Null<haxe.extern.EitherType<String, (diagnostic:nvim.type.vim.Diagnostic, i:Int, total:Int) -> String>>;
	/**
		```lua
		(field) vim.diagnostic.Opts.VirtualText.severity: (vim.diagnostic.Severity|vim.diagnostic.Severity[]|{ min: vim.diagnostic.Severity, max: vim.diagnostic.Severity })?
		```
		
		---
		
		 See |diagnostic-severity| and |vim.diagnostic.get()|
		
		---
		
		
		 Only show virtual text for diagnostics matching the given
		 severity |diagnostic-severity|
		
		---
		
		 @nodoc
	**/
	@:optional
	extern public var severity : Null<nvim.type.vim.diagnostic.SeverityFilter>;
	/**
		```lua
		(field) vim.diagnostic.Opts.VirtualText.source: (boolean|"if_many")?
		```
		
		---
		
		
		 Include the diagnostic source in virtual text. Use `'if_many'` to only
		 show sources if there is more than one diagnostic source in the buffer.
		 Otherwise, any truthy value means to always show the diagnostic source.
	**/
	@:optional
	extern public var source : Null<haxe.extern.EitherType<Bool, String>>;
	/**
		```lua
		(field) vim.diagnostic.Opts.VirtualText.spacing: integer?
		```
		
		---
		
		
		 Amount of empty spaces inserted at the beginning of the virtual text.
	**/
	@:optional
	extern public var spacing : Null<Int>;
	/**
		```lua
		(field) vim.diagnostic.Opts.VirtualText.suffix: (string|fun(diagnostic: vim.Diagnostic):string)?
		```
		
		---
		
		
		 Append diagnostic message with suffix.
		 This can be used to render an LSP diagnostic error code.
		
		---
		
		```lua
		function (diagnostic: vim.Diagnostic)
		  -> string
		```
	**/
	@:optional
	extern public var suffix : Null<haxe.extern.EitherType<String, (diagnostic:nvim.type.vim.Diagnostic) -> String>>;
	/**
		```lua
		(field) vim.diagnostic.Opts.VirtualText.virt_text: [string, any][]?
		```
		
		---
		
		
		 See |nvim_buf_set_extmark()|.
	**/
	extern public var virt_text : Dynamic;
	/**
		```lua
		(field) vim.diagnostic.Opts.VirtualText.virt_text_hide: boolean?
		```
		
		---
		
		
		 See |nvim_buf_set_extmark()|.
	**/
	@:optional
	extern public var virt_text_hide : Null<Bool>;
	/**
		```lua
		(field) vim.diagnostic.Opts.VirtualText.virt_text_pos: ('eol'|'eol_right_align'|'inline'|'overlay'|'right_align')?
		```
		
		---
		
		
		 See |nvim_buf_set_extmark()|.
	**/
	@:optional
	extern public var virt_text_pos : Null<String>;
	/**
		```lua
		(field) vim.diagnostic.Opts.VirtualText.virt_text_win_col: integer?
		```
		
		---
		
		
		 See |nvim_buf_set_extmark()|.
	**/
	@:optional
	extern public var virt_text_win_col : Null<Int>;
}