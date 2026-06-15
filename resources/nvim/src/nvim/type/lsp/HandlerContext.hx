package nvim.type.lsp;

/**
	```lua
	(class) lsp.HandlerContext
	```
**/
@:structInit extern class HandlerContext {
	/**
		```lua
		(field) lsp.HandlerContext.bufnr: integer?
		```
	**/
	var bufnr : Null<Int>;
	/**
		```lua
		(field) lsp.HandlerContext.client_id: integer
		```
	**/
	var client_id : Int;
	/**
		```lua
		(field) lsp.HandlerContext.method: string
		```
	**/
	var method : String;
	/**
		```lua
		(field) lsp.HandlerContext.params: any
		```
	**/
	var params : Null<Any>;
	/**
		```lua
		(field) lsp.HandlerContext.version: integer?
		```
	**/
	var version : Null<Int>;
}