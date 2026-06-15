package nvim.type.vim.lsp.rpc;

/**
	```lua
	(class) vim.lsp.rpc.PublicClient
	```
	
	---
	
	 Client RPC object
**/
@:structInit extern class PublicClient {
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
	function is_closing():Bool;
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
	function notify(method:String, params:Any):Bool;
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
	function request(method:String, params:Null<lua.Table.AnyTable>, callback:(err:nvim.type.lsp.ResponseError, result:Any) -> Dynamic, notify_reply_callback:(message_id:Int) -> Dynamic):nvim.helper.Multireturn<Bool, Null<Int>, Void, Void, Void, Void>;
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
	function terminate():Dynamic;
}