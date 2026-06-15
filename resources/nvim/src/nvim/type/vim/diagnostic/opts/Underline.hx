package nvim.type.vim.diagnostic.opts;

/**
	```lua
	(class) vim.diagnostic.Opts.Underline
	```
**/
@:structInit extern class Underline {
	/**
		```lua
		(field) vim.diagnostic.Opts.Underline.severity: (vim.diagnostic.Severity|vim.diagnostic.Severity[]|{ min: vim.diagnostic.Severity, max: vim.diagnostic.Severity })?
		```
		
		---
		
		 See |diagnostic-severity| and |vim.diagnostic.get()|
		
		---
		
		
		 Only underline diagnostics matching the given
		 severity |diagnostic-severity|.
		
		---
		
		 @nodoc
	**/
	var severity : Null<nvim.type.vim.diagnostic.SeverityFilter>;
}