package nvim.type.vim.diagnostic;

/**
	```lua
	(class) vim.diagnostic.Handler
	```
**/
@:structInit class Handler {
	/**
		```lua
		(field) vim.diagnostic.Handler.hide: fun(namespace: integer, bufnr: integer)?
		```
		
		---
		
		```lua
		function (namespace: integer, bufnr: integer)
		```
	**/
	@:optional
	extern public var hide : Null<(namespace:Float, bufnr:Float) -> Dynamic>;
	/**
		```lua
		(field) vim.diagnostic.Handler.show: fun(namespace: integer, bufnr: integer, diagnostics: vim.Diagnostic[], opts?: vim.diagnostic.OptsResolved)?
		```
		
		---
		
		```lua
		function (namespace: integer, bufnr: integer, diagnostics: vim.Diagnostic[], opts?: vim.diagnostic.OptsResolved)
		```
	**/
	@:optional
	extern public var show : Null<(namespace:Float, bufnr:Float, diagnostics:lua.Table<Int, nvim.type.vim.Diagnostic>, opts:nvim.type.vim.diagnostic.OptsResolved) -> Dynamic>;
}