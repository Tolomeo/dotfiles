package nvim.type.lsp;

/**
	```lua
	(class) lsp.ResponseError
	```
**/
@:structInit class ResponseError {
	/**
		```lua
		(field) lsp.ResponseError.code: integer
		```
	**/
	extern public var code : Int;
	/**
		```lua
		(field) lsp.ResponseError.data: boolean|string|number|table|table[]|nil
		```
	**/
	@:optional
	extern public var data : Null<haxe.extern.EitherType<String, haxe.extern.EitherType<Float, haxe.extern.EitherType<Bool, haxe.extern.EitherType<lua.Table<Int, lua.Table.AnyTable>, lua.Table.AnyTable>>>>>;
	/**
		```lua
		(field) lsp.ResponseError.message: string
		```
	**/
	extern public var message : String;
}