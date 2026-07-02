package nvim.type.vim.lsp.rpc;

/**
	```lua
	(class) vim.lsp.rpc.Dispatchers
	```
	
	---
	
	 Dispatchers for LSP message types.
**/
@:structInit class Dispatchers {
	@:native("notification")
	@:luaDotMethod
	private extern function __notification(method:String, params:lua.Table.AnyTable):Dynamic;
	/**
		```lua
		(field) vim.lsp.rpc.Dispatchers.notification: fun(method: string, params: table)
		```
		
		---
		
		 @inlinedoc
		
		---
		
		```lua
		function (method: string, params: table)
		```
	**/
	@:luaDotMethod
	inline public function notification(method:String, params:lua.Table.AnyTable):Dynamic {
		params = nvim.helper.Arg.pure(params);
		final result = __notification(method, params);
		return result;
	}
	/**
		```lua
		(field) vim.lsp.rpc.Dispatchers.on_error: fun(code: integer, err: any)
		```
		
		---
		
		```lua
		function (code: integer, err: any)
		```
	**/
	@:luaDotMethod
	extern public function on_error(code:Float, err:Any):Dynamic;
	/**
		```lua
		(field) vim.lsp.rpc.Dispatchers.on_exit: fun(code: integer, signal: integer)
		```
		
		---
		
		```lua
		function (code: integer, signal: integer)
		```
	**/
	@:luaDotMethod
	extern public function on_exit(code:Float, signal:Float):Dynamic;
	@:native("server_request")
	@:luaDotMethod
	private extern function __server_request(method:String, params:lua.Table.AnyTable):nvim.helper.Multireturn<Null<Any>, Null<nvim.type.lsp.ResponseError>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(field) vim.lsp.rpc.Dispatchers.server_request: fun(method: string, params: table):any, (lsp.ResponseError)?
		```
		
		---
		
		```lua
		function (method: string, params: table)
		  -> any
		  2. (lsp.ResponseError)?
		```
	**/
	@:luaDotMethod
	inline public function server_request(method:String, params:lua.Table.AnyTable):nvim.helper.Multireturn.Return2<Null<Any>, Null<nvim.type.lsp.ResponseError>> {
		params = nvim.helper.Arg.pure(params);
		final result = __server_request(method, params);
		return new nvim.helper.Multireturn.Return2<Null<Any>, Null<nvim.type.lsp.ResponseError>>(result._0, result._1);
	}
}