package nvim.module.vim.lsp;

extern class SemanticTokens {
	/**
		```lua
		function M.force_refresh(bufnr: integer|nil)
		```
		
		---
		
		 Force a refresh of all semantic tokens
		
		 Only has an effect if the buffer is currently active for semantic token
		 highlighting (|vim.lsp.semantic_tokens.start()| has been called for it)
		
		@*param* `bufnr` — filter by buffer. All buffers if nil, current
		
		       buffer if 0
	**/
	@:luaDotMethod
	function force_refresh(?bufnr:Null<Int>):Dynamic;
	/**
		```lua
		function M.get_at_pos(bufnr: integer|nil, row: integer|nil, col: integer|nil)
		  -> STTokenRangeInspect[]|nil
		```
		
		---
		
		 Return the semantic token(s) at the given position.
		 If called without arguments, returns the token under the cursor.
		
		@*param* `bufnr` — Buffer number (0 for current buffer, default)
		
		@*param* `row` — Position row (default cursor position)
		
		@*param* `col` — Position column (default cursor position)
		
		
		@*return* — (table|nil) List of tokens at position. Each token has
		
		        the following fields:
		        - line (integer) line number, 0-based
		        - start_col (integer) start column, 0-based
		        - end_col (integer) end column, 0-based
		        - type (string) token type as string, e.g. "variable"
		        - modifiers (table) token modifiers as a set. E.g., { static = true, readonly = true }
		        - client_id (integer)
	**/
	@:luaDotMethod
	function get_at_pos(?bufnr:Null<Int>, ?row:Null<Int>, ?col:Null<Int>):Null<Array<nvim.type.STTokenRangeInspect>>;
	/**
		```lua
		function M.highlight_token(token: table, bufnr: integer, client_id: integer, hl_group: string, opts?: vim.lsp.semantic_tokens.highlight_token.Opts)
		```
		
		---
		
		 Highlight a semantic token.
		
		 Apply an extmark with a given highlight group for a semantic token. The
		 mark will be deleted by the semantic token engine when appropriate; for
		 example, when the LSP sends updated tokens. This function is intended for
		 use inside |LspTokenUpdate| callbacks.
		
		@*param* `token` — A semantic token, found as `args.data.token` in |LspTokenUpdate|
		
		@*param* `bufnr` — The buffer to highlight, or `0` for current buffer
		
		@*param* `client_id` — The ID of the |vim.lsp.Client|
		
		@*param* `hl_group` — Highlight group name
		
		@*param* `opts` — Optional parameters:
	**/
	@:luaDotMethod
	function highlight_token(token:lua.Table.AnyTable, bufnr:Int, client_id:Int, hl_group:String, ?opts:nvim.type.vim.lsp.semantic_tokens.highlight_token.Opts):Dynamic;
	/**
		```lua
		function M.start(bufnr: integer, client_id: integer, opts?: table)
		```
		
		---
		
		 Start the semantic token highlighting engine for the given buffer with the
		 given client. The client must already be attached to the buffer.
		
		 NOTE: This is currently called automatically by |vim.lsp.buf_attach_client()|. To
		 opt-out of semantic highlighting with a server that supports it, you can
		 delete the semanticTokensProvider table from the {server_capabilities} of
		 your client in your |LspAttach| callback or your configuration's
		 `on_attach` callback:
		
		 ```lua
		 client.server_capabilities.semanticTokensProvider = nil
		 ```
		
		@*param* `bufnr` — Buffer number, or `0` for current buffer
		
		@*param* `client_id` — The ID of the |vim.lsp.Client|
		
		@*param* `opts` — Optional keyword arguments
		
		  - debounce (integer, default: 200): Debounce token requests
		        to the server by the given number in milliseconds
	**/
	@:luaDotMethod
	function start(bufnr:Int, client_id:Int, ?opts:lua.Table.AnyTable):Dynamic;
	/**
		```lua
		function M.stop(bufnr: integer, client_id: integer)
		```
		
		---
		
		 Stop the semantic token highlighting engine for the given buffer with the
		 given client.
		
		 NOTE: This is automatically called by a |LspDetach| autocmd that is set up as part
		 of `start()`, so you should only need this function to manually disengage the semantic
		 token engine without fully detaching the LSP client from the buffer.
		
		@*param* `bufnr` — Buffer number, or `0` for current buffer
		
		@*param* `client_id` — The ID of the |vim.lsp.Client|
	**/
	@:luaDotMethod
	function stop(bufnr:Int, client_id:Int):Dynamic;
}