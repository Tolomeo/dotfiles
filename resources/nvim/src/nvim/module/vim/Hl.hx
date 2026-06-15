package nvim.module.vim;

/**
	```lua
	(global) vim.hl.priorities: table
	```
	
	---
	
	 Table with default priorities used for highlighting:
	 - `syntax`: `50`, used for standard syntax highlighting
	 - `treesitter`: `100`, used for treesitter-based highlighting
	 - `semantic_tokens`: `125`, used for LSP semantic token highlighting
	 - `diagnostics`: `150`, used for code analysis such as diagnostics
	 - `user`: `200`, used for user-triggered highlights such as LSP document
	   symbols or `on_yank` autocommands
**/
extern class Priorities {
	/**
		```lua
		(global) vim.hl.priorities.diagnostics: integer = 150
		```
	**/
	var diagnostics : Float;
	/**
		```lua
		(global) vim.hl.priorities.semantic_tokens: integer = 125
		```
	**/
	var semantic_tokens : Float;
	/**
		```lua
		(global) vim.hl.priorities.syntax: integer = 50
		```
	**/
	var syntax : Float;
	/**
		```lua
		(global) vim.hl.priorities.treesitter: integer = 100
		```
	**/
	var treesitter : Float;
	/**
		```lua
		(global) vim.hl.priorities.user: integer = 200
		```
	**/
	var user : Float;
}

extern class Hl {
	/**
		```lua
		function M.on_yank(opts: table|nil)
		```
		
		---
		
		 Highlight the yanked text during a |TextYankPost| event.
		
		 Add the following to your `init.vim`:
		
		 ```vim
		 autocmd TextYankPost * silent! lua vim.hl.on_yank {higroup='Visual', timeout=300}
		 ```
		
		@*param* `opts` — Optional parameters
		
		              - higroup   highlight group for yanked region (default "IncSearch")
		              - timeout   time in ms before highlight is cleared (default 150)
		              - on_macro  highlight when executing macro (default false)
		              - on_visual highlight when yanking visual selection (default true)
		              - event     event structure (default vim.v.event)
		              - priority  integer priority (default |vim.hl.priorities|`.user`)
	**/
	@:luaDotMethod
	function on_yank(?opts:Null<lua.Table.AnyTable>):Dynamic;
	/**
		```lua
		function M.range(bufnr: integer, ns: integer, higroup: string, start: string|integer[], finish: string|integer[], opts?: vim.hl.range.Opts)
		  -> range_timer: (uv.uv_timer_t)?
		  2. range_clear: fun()?
		```
		
		---
		
		 Apply highlight group to range of text.
		
		@*param* `bufnr` — Buffer number to apply highlighting to
		
		@*param* `ns` — Namespace to add highlight to
		
		@*param* `higroup` — Highlight group to use for highlighting
		
		@*param* `start` — Start of region as a (line, column) tuple or string accepted by |getpos()|
		
		@*param* `finish` — End of region as a (line, column) tuple or string accepted by |getpos()|
		
		@*return* `range_timer` — A timer which manages how much time the
		
		 highlight has left
		
		@*return* `range_clear` — A function which allows clearing the highlight manually.
		
		 nil is returned if timeout is not specified
	**/
	@:luaDotMethod
	function range(bufnr:Int, ns:Int, higroup:String, start:haxe.extern.EitherType<Array<Int>, String>, finish:haxe.extern.EitherType<Array<Int>, String>, ?opts:nvim.type.vim.hl.range.Opts):nvim.helper.Multireturn<Null<nvim.type.uv.UvTimerT>, Null<() -> Dynamic>, Void, Void, Void, Void>;
}