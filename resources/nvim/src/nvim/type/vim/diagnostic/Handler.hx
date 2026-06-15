package nvim.type.vim.diagnostic;

/**
	```lua
	(class) vim.diagnostic.Handler
	```
**/
@:structInit extern class Handler {
	/**
		```lua
		(field) vim.diagnostic.Handler.hide: fun(namespace: integer, bufnr: integer)?
		```
		
		---
		
		```lua
		function (namespace: integer, bufnr: integer)
		```
	**/
	var hide : Null<(namespace:Int, bufnr:Int) -> Dynamic>;
	/**
		```lua
		(field) vim.diagnostic.Handler.show: fun(namespace: integer, bufnr: integer, diagnostics: vim.Diagnostic[], opts?: vim.diagnostic.OptsResolved)?
		```
		
		---
		
		```lua
		function (namespace: integer, bufnr: integer, diagnostics: vim.Diagnostic[], opts?: vim.diagnostic.OptsResolved)
		```
	**/
	var show : Null<(namespace:Int, bufnr:Int, diagnostics:Array<nvim.type.vim.Diagnostic>, opts:nvim.type.vim.diagnostic.OptsResolved) -> Dynamic>;
}