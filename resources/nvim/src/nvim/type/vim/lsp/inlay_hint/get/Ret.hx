package nvim.type.vim.lsp.inlay_hint.get;

/**
	```lua
	(class) vim.lsp.inlay_hint.get.ret
	```
**/
@:structInit extern class Ret {
	/**
		```lua
		(field) vim.lsp.inlay_hint.get.ret.bufnr: integer
		```
		
		---
		
		 @inlinedoc
	**/
	var bufnr : Int;
	/**
		```lua
		(field) vim.lsp.inlay_hint.get.ret.client_id: integer
		```
	**/
	var client_id : Int;
	/**
		```lua
		(field) vim.lsp.inlay_hint.get.ret.inlay_hint: lsp.InlayHint
		```
		
		---
		
		Inlay hint information.
		
	**/
	var inlay_hint : nvim.type.lsp.InlayHint;
}