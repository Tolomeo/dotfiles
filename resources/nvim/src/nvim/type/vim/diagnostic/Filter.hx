package nvim.type.vim.diagnostic;

/**
	```lua
	(class) vim.diagnostic.Filter
	```
	
	---
	
	 TODO: inherit from `vim.diagnostic.Opts`, implement its fields.
	 Optional filters |kwargs|, or `nil` for all.
**/
@:structInit extern class Filter {
	/**
		```lua
		(field) vim.diagnostic.Filter.bufnr: integer?
		```
		
		---
		
		
		 Buffer number, or 0 for current buffer, or `nil` for all buffers.
	**/
	var bufnr : Null<Int>;
	/**
		```lua
		(field) vim.diagnostic.Filter.ns_id: integer?
		```
		
		---
		
		 @inlinedoc
		
		 Diagnostic namespace, or `nil` for all.
	**/
	var ns_id : Null<Int>;
}