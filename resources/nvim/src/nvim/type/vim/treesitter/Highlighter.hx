package nvim.type.vim.treesitter;

/**
	```lua
	(field) vim.treesitter.highlighter._conceal_checked: table<integer, boolean>
	```
**/
@:structInit class ConcealChecked {

}

/**
	```lua
	(field) vim.treesitter.highlighter.active: table<integer, vim.treesitter.highlighter>
	```
**/
@:structInit class Active {

}

/**
	```lua
	(field) vim.treesitter.highlighter.parsing: table<integer, boolean>
	```
	
	---
	
	 A map from window ID to whether we are currently parsing that window asynchronously
**/
@:structInit class Parsing {

}

/**
	```lua
	(class) vim.treesitter.highlighter
	```
**/
@:structInit class Highlighter {
	/**
		```lua
		(field) vim.treesitter.highlighter._conceal_line: boolean?
		```
	**/
	@:optional
	extern public var _conceal_line : Null<Bool>;
	/**
		```lua
		(field) vim.treesitter.highlighter.bufnr: integer
		```
	**/
	extern public var bufnr : Float;
	/**
		```lua
		function vim.treesitter.highlighter.new(tree: vim.treesitter.LanguageTree, opts: table|nil)
		  -> Created: vim.treesitter.highlighter
		```
		
		---
		
		
		 Creates a highlighter for `tree`.
		
		@*param* `tree` — parser object to use for highlighting
		
		@*param* `opts` — Configuration of the highlighter:
		
		           - queries table overwrite queries used by the highlighter
		
		@*return* `Created` — highlighter object
	**/
	@:luaDotMethod
	@:native("new")
	private extern function __new_(tree:nvim.type.vim.treesitter.LanguageTree, ?opts:Null<lua.Table.AnyTable>):nvim.type.vim.treesitter.Highlighter;
	/**
		```lua
		function vim.treesitter.highlighter.new(tree: vim.treesitter.LanguageTree, opts: table|nil)
		  -> Created: vim.treesitter.highlighter
		```
		
		---
		
		
		 Creates a highlighter for `tree`.
		
		@*param* `tree` — parser object to use for highlighting
		
		@*param* `opts` — Configuration of the highlighter:
		
		           - queries table overwrite queries used by the highlighter
		
		@*return* `Created` — highlighter object
	**/
	@:luaDotMethod
	inline public function new_(tree:nvim.type.vim.treesitter.LanguageTree, ?opts:Null<lua.Table.AnyTable>):nvim.type.vim.treesitter.Highlighter {
		tree = nvim.helper.Arg.pure(tree);
		final result = __new_(tree, opts);
		return result;
	}
	/**
		```lua
		(field) vim.treesitter.highlighter.tree: vim.treesitter.LanguageTree
		```
	**/
	extern public var tree : nvim.type.vim.treesitter.LanguageTree;
	/**
		```lua
		(method) vim.treesitter.highlighter:destroy()
		```
		
		---
		
		 @nodoc
		 Removes all internal references to the highlighter
	**/
	extern public function destroy():Dynamic;
	/**
		```lua
		(method) vim.treesitter.highlighter:get_query(lang: string)
		  -> vim.treesitter.highlighter.Query
		```
		
		---
		
		 Gets the query used for @param lang
		
		@*param* `lang` — Language used by the highlighter.
	**/
	extern public function get_query(lang:String):nvim.type.vim.treesitter.highlighter.Query;
}