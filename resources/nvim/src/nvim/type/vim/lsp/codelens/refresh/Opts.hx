package nvim.type.vim.lsp.codelens.refresh;

/**
	```lua
	(class) vim.lsp.codelens.refresh.Opts
	```
**/
@:structInit extern class Opts {
	/**
		```lua
		(field) vim.lsp.codelens.refresh.Opts.bufnr: integer?
		```
		
		---
		
		filter by buffer. All buffers if nil, 0 for current buffer
	**/
	var bufnr : Null<Int>;
}