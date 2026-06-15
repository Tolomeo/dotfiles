package nvim.module.vim.treesitter;

extern class Dev {
	/**
		```lua
		function M.edit_query(lang?: string)
		  -> boolean?
		  2. error: string?
		```
		
		---
		
		@*param* `lang` — language to open the query editor for.
		
		@*return* — `true` on success, `nil` on failure
		
		@*return* `error` — message, if applicable
	**/
	@:luaDotMethod
	private function edit_query(?lang:String):nvim.helper.Multireturn<Null<Bool>, Null<String>, Void, Void, Void, Void>;
	/**
		```lua
		function M.inspect_tree(opts?: vim.treesitter.dev.inspect_tree.Opts)
		```
	**/
	@:luaDotMethod
	private function inspect_tree(?opts:Null<nvim.type.vim.treesitter.dev.inspect_tree.Opts>):Dynamic;
}