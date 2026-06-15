package nvim.module.vim.lsp;

extern class Codelens {
	/**
		```lua
		function M.clear(client_id: integer|nil, bufnr: integer|nil)
		```
		
		---
		
		 Clear the lenses
		
		@*param* `client_id` — filter by client_id. All clients if nil
		
		@*param* `bufnr` — filter by buffer. All buffers if nil, 0 for current buffer
	**/
	@:luaDotMethod
	function clear(?client_id:Null<Int>, ?bufnr:Null<Int>):Dynamic;
	/**
		```lua
		function M.display(lenses?: lsp.CodeLens[], bufnr: integer, client_id: integer)
		```
		
		---
		
		 Display the lenses using virtual text
		
		@*param* `lenses` — lenses to display
	**/
	@:luaDotMethod
	function display(?lenses:Array<nvim.type.lsp.CodeLens>, bufnr:Int, client_id:Int):Dynamic;
	/**
		```lua
		function M.get(bufnr: integer)
		  -> lsp.CodeLens[]
		```
		
		---
		
		 Return all lenses for the given buffer
		
		@*param* `bufnr` — Buffer number. 0 can be used for the current buffer.
	**/
	@:luaDotMethod
	function get(bufnr:Int):Array<nvim.type.lsp.CodeLens>;
	/**
		```lua
		function M.on_codelens(err?: lsp.ResponseError, result: lsp.CodeLens[], ctx: lsp.HandlerContext)
		```
		
		---
		
		 |lsp-handler| for the method `textDocument/codeLens`
	**/
	@:luaDotMethod
	function on_codelens(err:Null<nvim.type.lsp.ResponseError>, result:Array<nvim.type.lsp.CodeLens>, ctx:nvim.type.lsp.HandlerContext):Dynamic;
	/**
		```lua
		function M.refresh(opts?: vim.lsp.codelens.refresh.Opts)
		```
		
		---
		
		 Refresh the lenses.
		
		 It is recommended to trigger this using an autocmd or via keymap.
		
		 Example:
		
		 ```vim
		 autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh({ bufnr = 0 })
		 ```
		
		@*param* `opts` — Optional fields
	**/
	@:luaDotMethod
	function refresh(?opts:nvim.type.vim.lsp.codelens.refresh.Opts):Dynamic;
	/**
		```lua
		function M.run()
		```
		
		---
		
		 Run the code lens in the current line
	**/
	@:luaDotMethod
	function run():Dynamic;
	/**
		```lua
		function M.save(lenses?: lsp.CodeLens[], bufnr: integer, client_id: integer)
		```
		
		---
		
		 Store lenses for a specific buffer and client
		
		@*param* `lenses` — lenses to store
	**/
	@:luaDotMethod
	function save(?lenses:Array<nvim.type.lsp.CodeLens>, bufnr:Int, client_id:Int):Dynamic;
}