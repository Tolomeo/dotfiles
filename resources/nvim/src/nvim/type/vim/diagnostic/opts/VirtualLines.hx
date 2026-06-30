package nvim.type.vim.diagnostic.opts;

/**
	```lua
	(class) vim.diagnostic.Opts.VirtualLines
	```
**/
@:structInit class VirtualLines {
	/**
		```lua
		(field) vim.diagnostic.Opts.VirtualLines.current_line: boolean?
		```
		
		---
		
		
		 Only show diagnostics for the current line.
		 (default: `false`)
	**/
	@:optional
	extern public var current_line : Null<Bool>;
	/**
		```lua
		(field) vim.diagnostic.Opts.VirtualLines.format: fun(diagnostic: vim.Diagnostic):string??
		```
		
		---
		
		
		 A function that takes a diagnostic as input and returns a string or nil.
		 If the return value is nil, the diagnostic is not displayed by the handler.
		 Else the output text is used to display the diagnostic.
		
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
		(field) vim.diagnostic.Opts.VirtualLines.severity: (vim.diagnostic.Severity|vim.diagnostic.Severity[]|{ min: vim.diagnostic.Severity, max: vim.diagnostic.Severity })?
		```
		
		---
		
		 See |diagnostic-severity| and |vim.diagnostic.get()|
		
		---
		
		
		 Only show virtual lines for diagnostics matching the given
		 severity |diagnostic-severity|
		
		---
		
		 @nodoc
	**/
	@:optional
	extern public var severity : Null<nvim.type.vim.diagnostic.SeverityFilter>;
}