package nvim.type.vim.treesitter;

/**
	```lua
	(field) vim.treesitter.highlighter._conceal_checked: table<integer, boolean>
	```
**/
@:structInit extern class ConcealChecked {

}

/**
	```lua
	(field) vim.treesitter.highlighter.active: table<integer, vim.treesitter.highlighter>
	```
**/
@:structInit extern class Active {

}

/**
	```lua
	(field) vim.treesitter.highlighter.parsing: table<integer, boolean>
	```
	
	---
	
	 A map from window ID to whether we are currently parsing that window asynchronously
**/
@:structInit extern class Parsing {

}

/**
	```lua
	(class) vim.treesitter.highlighter
	```
**/
@:structInit extern class Highlighter {
	/**
		```lua
		(field) vim.treesitter.highlighter._conceal_line: boolean?
		```
	**/
	var _conceal_line : Null<Bool>;
	/**
		```lua
		(field) vim.treesitter.highlighter.bufnr: integer
		```
	**/
	var bufnr : Int;
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
	function new_(tree:nvim.type.vim.treesitter.LanguageTree, ?opts:Null<lua.Table.AnyTable>):nvim.type.vim.treesitter.Highlighter;
	/**
		```lua
		(field) vim.treesitter.highlighter.tree: vim.treesitter.LanguageTree
		```
	**/
	var tree : nvim.type.vim.treesitter.LanguageTree;
	/**
		```lua
		(method) vim.treesitter.highlighter:destroy()
		```
		
		---
		
		 @nodoc
		 Removes all internal references to the highlighter
	**/
	function destroy():Dynamic;
	/**
		```lua
		(method) vim.treesitter.highlighter:get_query(lang: string)
		  -> vim.treesitter.highlighter.Query
		```
		
		---
		
		 Gets the query used for @param lang
		
		@*param* `lang` — Language used by the highlighter.
	**/
	function get_query(lang:String):nvim.type.vim.treesitter.highlighter.Query;
}