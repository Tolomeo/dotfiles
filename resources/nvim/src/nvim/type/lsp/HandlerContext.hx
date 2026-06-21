package nvim.type.lsp;

/**
	```lua
	(class) lsp.HandlerContext
	```
**/
@:structInit class HandlerContext {
	/**
		```lua
		(field) lsp.HandlerContext.bufnr: integer?
		```
	**/
	@:optional
	extern var bufnr : Null<Int>;
	/**
		```lua
		(field) lsp.HandlerContext.client_id: integer
		```
	**/
	extern var client_id : Int;
	/**
		```lua
		(field) lsp.HandlerContext.method: string
		```
	**/
	extern var method : String;
	/**
		```lua
		(field) lsp.HandlerContext.params: any
		```
	**/
	@:optional
	extern var params : Null<Any>;
	/**
		```lua
		(field) lsp.HandlerContext.version: integer?
		```
	**/
	@:optional
	extern var version : Null<Int>;
}