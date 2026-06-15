package nvim.module.vim.lsp;

extern class InlayHint {
	/**
		```lua
		function M.enable(enable: boolean|nil, filter?: vim.lsp.inlay_hint.enable.Filter)
		```
		
		---
		
		 Enables or disables inlay hints for the {filter}ed scope.
		
		 To "toggle", pass the inverse of `is_enabled()`:
		
		 ```lua
		 vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		 ```
		
		@*param* `enable` — true/nil to enable, false to disable
		
		 @since 12
	**/
	@:luaDotMethod
	function enable(?enable:Null<Bool>, ?filter:Null<nvim.type.vim.lsp.inlay_hint.enable.Filter>):Dynamic;
	/**
		```lua
		function M.get(filter?: vim.lsp.inlay_hint.get.Filter)
		  -> vim.lsp.inlay_hint.get.ret[]
		```
		
		---
		
		 Get the list of inlay hints, (optionally) restricted by buffer or range.
		
		 Example usage:
		
		 ```lua
		 local hint = vim.lsp.inlay_hint.get({ bufnr = 0 })[1] -- 0 for current buffer
		
		 local client = vim.lsp.get_client_by_id(hint.client_id)
		 local resp = client:request_sync('inlayHint/resolve', hint.inlay_hint, 100, 0)
		 local resolved_hint = assert(resp and resp.result, resp.err)
		 vim.lsp.util.apply_text_edits(resolved_hint.textEdits, 0, client.encoding)
		
		 location = resolved_hint.label[1].location
		 client:request('textDocument/hover', {
		   textDocument = { uri = location.uri },
		   position = location.range.start,
		 })
		 ```
		
		 @since 12
	**/
	@:luaDotMethod
	function get(?filter:Null<nvim.type.vim.lsp.inlay_hint.get.Filter>):Array<nvim.type.vim.lsp.inlay_hint.get.Ret>;
	/**
		```lua
		function M.is_enabled(filter?: vim.lsp.inlay_hint.enable.Filter)
		  -> boolean
		```
		
		---
		
		 Query whether inlay hint is enabled in the {filter}ed scope
		 @since 12
	**/
	@:luaDotMethod
	function is_enabled(?filter:nvim.type.vim.lsp.inlay_hint.enable.Filter):Bool;
	/**
		```lua
		function M.on_inlayhint(err: any, result?: lsp.InlayHint[], ctx: lsp.HandlerContext)
		```
		
		---
		
		 |lsp-handler| for the method `textDocument/inlayHint`
		 Store hints for a specific buffer and client
	**/
	@:luaDotMethod
	private function on_inlayhint(err:Dynamic, result:Null<Array<nvim.type.lsp.InlayHint>>, ctx:nvim.type.lsp.HandlerContext):Dynamic;
	/**
		```lua
		function M.on_refresh(err: any, _: any, ctx: lsp.HandlerContext)
		  -> vim.NIL
		```
		
		---
		
		 |lsp-handler| for the method `workspace/inlayHint/refresh`
	**/
	@:luaDotMethod
	private function on_refresh(err:Dynamic, _:Dynamic, ctx:nvim.type.lsp.HandlerContext):Dynamic;
}