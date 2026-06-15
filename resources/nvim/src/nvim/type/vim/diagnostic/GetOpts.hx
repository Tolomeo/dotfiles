package nvim.type.vim.diagnostic;

/**
	```lua
	(class) vim.diagnostic.GetOpts
	```
	
	---
	
	 A table with the following keys:
**/
@:structInit extern class GetOpts {
	/**
		```lua
		(field) vim.diagnostic.GetOpts.lnum: integer?
		```
		
		---
		
		
		 Limit diagnostics to those spanning the specified line number.
	**/
	var lnum : Null<Int>;
	/**
		```lua
		(field) vim.diagnostic.GetOpts.namespace: (integer|integer[])?
		```
		
		---
		
		
		 Limit diagnostics to one or more namespaces.
	**/
	var namespace : Null<haxe.extern.EitherType<Array<Int>, Int>>;
	/**
		```lua
		(field) vim.diagnostic.GetOpts.severity: (vim.diagnostic.Severity|vim.diagnostic.Severity[]|{ min: vim.diagnostic.Severity, max: vim.diagnostic.Severity })?
		```
		
		---
		
		 See |diagnostic-severity| and |vim.diagnostic.get()|
		
		---
		
		
		 See |diagnostic-severity|.
		
		---
		
		 @nodoc
	**/
	var severity : Null<nvim.type.vim.diagnostic.SeverityFilter>;
}