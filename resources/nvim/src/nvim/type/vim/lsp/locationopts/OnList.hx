package nvim.type.vim.lsp.locationopts;

/**
	```lua
	(class) vim.lsp.LocationOpts.OnList
	```
**/
@:structInit class OnList {
	/**
		```lua
		(field) vim.lsp.LocationOpts.OnList.context: { bufnr: integer, method: string }?
		```
		
		---
		
		Subset of `ctx` from |lsp-handler|.
	**/
	@:optional
	extern public var context : Null<{ var bufnr : Int; var method : String; }>;
	/**
		```lua
		(field) vim.lsp.LocationOpts.OnList.items: table[]
		```
		
		---
		
		Structured like |setqflist-what|
	**/
	extern public var items : lua.Table<Int, lua.Table.AnyTable>;
	/**
		```lua
		(field) vim.lsp.LocationOpts.OnList.title: string?
		```
		
		---
		
		Title for the list.
	**/
	@:optional
	extern public var title : Null<String>;
}