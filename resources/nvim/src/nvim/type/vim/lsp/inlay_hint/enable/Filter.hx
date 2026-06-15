package nvim.type.vim.lsp.inlay_hint.enable;

/**
	```lua
	(class) vim.lsp.inlay_hint.enable.Filter
	```
	
	---
	
	 Optional filters |kwargs|, or `nil` for all.
**/
@:structInit extern class Filter {
	/**
		```lua
		(field) vim.lsp.inlay_hint.enable.Filter.bufnr: integer?
		```
		
		---
		
		 @inlinedoc
		 Buffer number, or 0 for current buffer, or nil for all.
	**/
	var bufnr : Null<Int>;
}