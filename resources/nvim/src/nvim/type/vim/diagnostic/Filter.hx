package nvim.type.vim.diagnostic;

/**
	```lua
	(class) vim.diagnostic.Filter
	```
	
	---
	
	 TODO: inherit from `vim.diagnostic.Opts`, implement its fields.
	 Optional filters |kwargs|, or `nil` for all.
**/
@:structInit class Filter {
	/**
		```lua
		(field) vim.diagnostic.Filter.bufnr: integer?
		```
		
		---
		
		
		 Buffer number, or 0 for current buffer, or `nil` for all buffers.
	**/
	@:optional
	extern public var bufnr : Null<Float>;
	/**
		```lua
		(field) vim.diagnostic.Filter.ns_id: integer?
		```
		
		---
		
		 @inlinedoc
		
		 Diagnostic namespace, or `nil` for all.
	**/
	@:optional
	extern public var ns_id : Null<Float>;
}