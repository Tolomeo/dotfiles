package nvim.type.vim.lsp.rpc;

/**
	```lua
	(class) vim.lsp.rpc.PublicClient
	```
	
	---
	
	 Client RPC object
**/
@:structInit class PublicClient {
	/**
		```lua
		(field) vim.lsp.rpc.PublicClient.is_closing: fun():boolean
		```
		
		---
		
		
		 Indicates if the RPC is closing.
		
		---
		
		```lua
		function ()
		  -> boolean
		```
	**/
	@:luaDotMethod
	extern public function is_closing():Bool;
	/**
		```lua
		(field) vim.lsp.rpc.PublicClient.notify: fun(method: string, params: any):boolean
		```
		
		---
		
		
		 See [vim.lsp.rpc.notify()]
		
		---
		
		```lua
		function (method: string, params: any)
		  -> boolean
		```
	**/
	@:luaDotMethod
	extern public function notify(method:String, params:Any):Bool;
	/**
		```lua
		(field) vim.lsp.rpc.PublicClient.request: fun(method: string, params?: table, callback: fun(err?: lsp.ResponseError, result: any), notify_reply_callback?: fun(message_id: integer)):boolean, integer?
		```
		
		---
		
		
		 See [vim.lsp.rpc.request()]
		
		---
		
		```lua
		function (method: string, params: table?, callback: fun(err?: lsp.ResponseError, result: any), notify_reply_callback?: fun(message_id: integer))
		  -> boolean
		  2. integer?
		```
	**/
	@:native("request")
	@:luaDotMethod
	private extern function __request(method:String, params:Null<lua.Table.AnyTable>, callback:(err:nvim.type.lsp.ResponseError, result:Any) -> Dynamic, notify_reply_callback:(message_id:Float) -> Dynamic):nvim.helper.Multireturn<Bool, Null<Float>, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing, nvim.helper.Nothing>;
	/**
		```lua
		(field) vim.lsp.rpc.PublicClient.request: fun(method: string, params?: table, callback: fun(err?: lsp.ResponseError, result: any), notify_reply_callback?: fun(message_id: integer)):boolean, integer?
		```
		
		---
		
		
		 See [vim.lsp.rpc.request()]
		
		---
		
		```lua
		function (method: string, params: table?, callback: fun(err?: lsp.ResponseError, result: any), notify_reply_callback?: fun(message_id: integer))
		  -> boolean
		  2. integer?
		```
	**/
	@:luaDotMethod
	inline public function request(method:String, params:Null<lua.Table.AnyTable>, callback:(err:nvim.type.lsp.ResponseError, result:Any) -> Dynamic, notify_reply_callback:(message_id:Float) -> Dynamic):nvim.helper.Multireturn.Return2<Bool, Null<Float>> {
		final result = __request(method, params, callback, notify_reply_callback);
		return new nvim.helper.Multireturn.Return2<Bool, Null<Float>>(result._0, result._1);
	}
	/**
		```lua
		(field) vim.lsp.rpc.PublicClient.terminate: fun()
		```
		
		---
		
		
		 Terminates the RPC client.
		
		---
		
		```lua
		function ()
		```
	**/
	@:luaDotMethod
	extern public function terminate():Dynamic;
}