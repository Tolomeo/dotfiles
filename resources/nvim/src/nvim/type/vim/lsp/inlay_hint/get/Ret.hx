package nvim.type.vim.lsp.inlay_hint.get;

/**
	```lua
	(class) vim.lsp.inlay_hint.get.ret
	```
**/
@:structInit class Ret {
	/**
		```lua
		(field) vim.lsp.inlay_hint.get.ret.bufnr: integer
		```
		
		---
		
		 @inlinedoc
	**/
	extern public var bufnr : Float;
	/**
		```lua
		(field) vim.lsp.inlay_hint.get.ret.client_id: integer
		```
	**/
	extern public var client_id : Float;
	/**
		```lua
		(field) vim.lsp.inlay_hint.get.ret.inlay_hint: lsp.InlayHint
		```
		
		---
		
		Inlay hint information.
		
	**/
	extern public var inlay_hint : nvim.type.lsp.InlayHint;
}