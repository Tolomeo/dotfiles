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
	extern public var bufnr : Null<Float>;
	/**
		```lua
		(field) lsp.HandlerContext.client_id: integer
		```
	**/
	extern public var client_id : Float;
	/**
		```lua
		(field) lsp.HandlerContext.method: string
		```
	**/
	extern public var method : String;
	/**
		```lua
		(field) lsp.HandlerContext.params: any
		```
	**/
	@:optional
	extern public var params : Null<Any>;
	/**
		```lua
		(field) lsp.HandlerContext.version: integer?
		```
	**/
	@:optional
	extern public var version : Null<Float>;
}