package nvim.type.vim.diagnostic.setloclist;

/**
	```lua
	(class) vim.diagnostic.setloclist.Opts
	```
	
	---
	
	Configuration table with the following keys:
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.diagnostic.setloclist.Opts.namespace: integer?
		```
		
		---
		
		 @inlinedoc
		
		 Only add diagnostics from the given namespace.
	**/
	@:optional
	extern public var namespace : Null<Float>;
	/**
		```lua
		(field) vim.diagnostic.setloclist.Opts.open: boolean?
		```
		
		---
		
		
		 Open the location list after setting.
		 (default: `true`)
	**/
	@:optional
	extern public var open : Null<Bool>;
	/**
		```lua
		(field) vim.diagnostic.setloclist.Opts.severity: (vim.diagnostic.Severity|vim.diagnostic.Severity[]|{ min: vim.diagnostic.Severity, max: vim.diagnostic.Severity })?
		```
		
		---
		
		 See |diagnostic-severity| and |vim.diagnostic.get()|
		
		---
		
		
		 See |diagnostic-severity|.
		
		---
		
		 @nodoc
	**/
	@:optional
	extern public var severity : Null<nvim.type.vim.diagnostic.SeverityFilter>;
	/**
		```lua
		(field) vim.diagnostic.setloclist.Opts.title: string?
		```
		
		---
		
		
		 Title of the location list. Defaults to "Diagnostics".
	**/
	@:optional
	extern public var title : Null<String>;
	/**
		```lua
		(field) vim.diagnostic.setloclist.Opts.winnr: integer?
		```
		
		---
		
		
		 Window number to set location list for.
		 (default: `0`)
	**/
	@:optional
	extern public var winnr : Null<Float>;
}