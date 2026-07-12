package nvim.type.vim.diagnostic.setqflist;

/**
	```lua
	(class) vim.diagnostic.setqflist.Opts
	```
	
	---
	
	 Configuration table with the following keys:
**/
@:structInit class Opts {
	/**
		```lua
		(field) vim.diagnostic.setqflist.Opts.namespace: integer?
		```
		
		---
		
		 @inlinedoc
		
		 Only add diagnostics from the given namespace.
	**/
	@:optional
	extern public var namespace : Null<Int>;
	/**
		```lua
		(field) vim.diagnostic.setqflist.Opts.open: boolean?
		```
		
		---
		
		
		 Open quickfix list after setting.
		 (default: `true`)
	**/
	@:optional
	extern public var open : Null<Bool>;
	/**
		```lua
		(field) vim.diagnostic.setqflist.Opts.severity: (vim.diagnostic.Severity|vim.diagnostic.Severity[]|{ min: vim.diagnostic.Severity, max: vim.diagnostic.Severity })?
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
		(field) vim.diagnostic.setqflist.Opts.title: string?
		```
		
		---
		
		
		 Title of quickfix list. Defaults to "Diagnostics". If there's already a quickfix list with this
		 title, it's updated. If not, a new quickfix list is created.
	**/
	@:optional
	extern public var title : Null<String>;
}