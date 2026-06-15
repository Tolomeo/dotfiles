package nvim.type.vim.trust;

/**
	```lua
	(class) vim.trust.opts
	```
**/
@:structInit extern class Opts {
	/**
		```lua
		(field) vim.trust.opts.action: 'allow'|'deny'|'remove'
		```
		
		---
		
		 @inlinedoc
		
		 - `'allow'` to add a file to the trust database and trust it,
		 - `'deny'` to add a file to the trust database and deny it,
		 - `'remove'` to remove file from the trust database
	**/
	var action : String;
	/**
		```lua
		(field) vim.trust.opts.bufnr: integer?
		```
		
		---
		
		 Buffer number to update. Mutually exclusive with {path}.
	**/
	var bufnr : Null<Int>;
	/**
		```lua
		(field) vim.trust.opts.path: string?
		```
		
		---
		
		
		 Path to a file to update. Mutually exclusive with {bufnr}.
		 Cannot be used when {action} is "allow".
	**/
	var path : Null<String>;
}