package nvim.module.vim.treesitter;

extern class Dev {
	@:native("edit_query")
	@:luaDotMethod
	private function __edit_query(?lang:String):nvim.helper.Multireturn<Null<Bool>, Null<String>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
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
	inline private function edit_query(?lang:String):nvim.helper.Multireturn.Return2<Null<Bool>, Null<String>> {
		return __edit_query(lang);
	}
	/**
		```lua
		function M.inspect_tree(opts?: vim.treesitter.dev.inspect_tree.Opts)
		```
	**/
	@:luaDotMethod
	private function inspect_tree(?opts:Null<nvim.type.vim.treesitter.dev.inspect_tree.Opts>):Dynamic;
}