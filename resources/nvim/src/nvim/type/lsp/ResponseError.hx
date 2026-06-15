package nvim.type.lsp;

/**
	```lua
	(class) lsp.ResponseError
	```
**/
@:structInit extern class ResponseError {
	/**
		```lua
		(field) lsp.ResponseError.code: integer
		```
	**/
	var code : Int;
	/**
		```lua
		(field) lsp.ResponseError.data: boolean|string|number|table|table[]|nil
		```
	**/
	var data : Null<haxe.extern.EitherType<String, haxe.extern.EitherType<Float, haxe.extern.EitherType<Bool, haxe.extern.EitherType<Array<lua.Table.AnyTable>, lua.Table.AnyTable>>>>>;
	/**
		```lua
		(field) lsp.ResponseError.message: string
		```
	**/
	var message : String;
}