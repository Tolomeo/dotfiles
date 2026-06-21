package nvim.type.vim.lsp;

/**
	```lua
	(field) vim.lsp.Client.attached_buffers: table<integer, true>
	```
**/
@:structInit class AttachedBuffers {

}

/**
	```lua
	(field) vim.lsp.Client.commands: table<string, fun(command: lsp.Command, ctx: table)>
	```
	
	---
	
	
	 Client commands. See [vim.lsp.ClientConfig].
**/
@:structInit class Commands {

}

/**
	```lua
	(field) vim.lsp.Client.handlers: table<string, fun(err?: lsp.ResponseError, result: any, context: lsp.HandlerContext, config?: table):...unknown>
	```
	
	---
	
	
	 See [vim.lsp.ClientConfig].
**/
@:structInit class Handlers {

}

/**
	```lua
	(field) vim.lsp.Client.requests: table<integer, { type: string, bufnr: integer, method: string }?>
	```
	
	---
	
	
	 The current pending requests in flight to the server. Entries are key-value
	 pairs with the key being the request id while the value is a table with
	 `type`, `bufnr`, and `method` key-value pairs. `type` is either "pending"
	 for an active request, or "cancel" for a cancel request. It will be
	 "complete" ephemerally while executing |LspRequest| autocmds when replies
	 are received from the server.
**/
@:structInit class Requests {

}

/**
	```lua
	(class) vim.lsp.Client
	```
**/
@:structInit class Client {
	/**
		```lua
		(field) vim.lsp.Client._is_stopping: boolean = false
		```
	**/
	extern var _is_stopping : Bool;
	/**
		```lua
		(field) vim.lsp.Client.capabilities: lsp.ClientCapabilities
		```
		
		---
		
		Defines the capabilities provided by the client.
		
		---
		
		
		 Capabilities provided by the client (editor or tool), at startup.
	**/
	extern var capabilities : nvim.type.lsp.ClientCapabilities;
	/**
		```lua
		(field) vim.lsp.Client.config: vim.lsp.ClientConfig
		```
		
		---
		
		
		 Copy of the config passed to |vim.lsp.start()|.
	**/
	extern var config : nvim.type.vim.lsp.ClientConfig;
	/**
		```lua
		function vim.lsp.Client.create(config: vim.lsp.ClientConfig)
		  -> (vim.lsp.Client)?
		```
		
		---
		
		 @nodoc
	**/
	@:luaDotMethod
	extern function create(config:nvim.type.vim.lsp.ClientConfig):Null<nvim.type.vim.lsp.Client>;
	/**
		```lua
		(field) vim.lsp.Client.dynamic_capabilities: lsp.DynamicCapabilities
		```
		
		---
		
		
		 Capabilities provided at runtime (after startup).
	**/
	extern var dynamic_capabilities : nvim.type.lsp.DynamicCapabilities;
	/**
		```lua
		(field) vim.lsp.Client.flags: vim.lsp.Client.Flags
		```
		
		---
		
		
		 A table with flags for the client. The current (experimental) flags are:
	**/
	extern var flags : nvim.type.vim.lsp.client.Flags;
	/**
		```lua
		(field) vim.lsp.Client.get_language_id: fun(bufnr: integer, filetype: string):string
		```
		
		---
		
		
		 See [vim.lsp.ClientConfig].
		
		---
		
		```lua
		function (bufnr: integer, filetype: string)
		  -> string
		```
	**/
	@:luaDotMethod
	extern function get_language_id(bufnr:Int, filetype:String):String;
	/**
		```lua
		(field) vim.lsp.Client.id: integer
		```
		
		---
		
		
		 The id allocated to the client.
	**/
	extern var id : Int;
	/**
		```lua
		(field) vim.lsp.Client.initialized: true?
		```
	**/
	@:optional
	extern var initialized : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.Client.messages: table
		```
	**/
	@:deprecated
	extern var messages : String;
	/**
		```lua
		(field) vim.lsp.Client.name: string
		```
		
		---
		
		
		 See [vim.lsp.ClientConfig].
	**/
	extern var name : String;
	/**
		```lua
		(field) vim.lsp.Client.offset_encoding: string
		```
		
		---
		
		
		 See [vim.lsp.ClientConfig].
	**/
	extern var offset_encoding : String;
	/**
		```lua
		(field) vim.lsp.Client.progress: vim.lsp.Client.Progress
		```
		
		---
		
		
		 A ring buffer (|vim.ringbuf()|) containing progress messages
		 sent by the server.
	**/
	extern var progress : nvim.type.vim.lsp.client.Progress;
	/**
		```lua
		(field) vim.lsp.Client.root_dir: string?
		```
		
		---
		
		
		 See [vim.lsp.ClientConfig].
	**/
	@:optional
	extern var root_dir : Null<String>;
	/**
		```lua
		(field) vim.lsp.Client.rpc: vim.lsp.rpc.PublicClient
		```
		
		---
		
		 Client RPC object
		
		---
		
		
		 RPC client object, for low level interaction with the client.
		 See |vim.lsp.rpc.start()|.
	**/
	extern var rpc : nvim.type.vim.lsp.rpc.PublicClient;
	/**
		```lua
		(field) vim.lsp.Client.server_capabilities: (lsp.ServerCapabilities)?
		```
		
		---
		
		Defines the capabilities provided by a language
		server.
		
		---
		
		
		 Response from the server sent on `initialize` describing the server's capabilities.
	**/
	@:optional
	extern var server_capabilities : Null<nvim.type.lsp.ServerCapabilities>;
	/**
		```lua
		(field) vim.lsp.Client.server_info: (lsp.ServerInfo)?
		```
		
		---
		
		Information about the server
		
		
		---
		
		
		 Response from the server sent on `initialize` describing server information (e.g. version).
	**/
	@:optional
	extern var server_info : Null<nvim.type.lsp.ServerInfo>;
	/**
		```lua
		(field) vim.lsp.Client.settings: table<string, boolean|string|number|unknown[]|nil>
		```
		
		---
		
		LSP object definition.
		
		---
		
		
		 See [vim.lsp.ClientConfig].
	**/
	extern var settings : nvim.type.lsp.LSPObject;
	/**
		```lua
		(field) vim.lsp.Client.workspace_folders: lsp.WorkspaceFolder[]?
		```
		
		---
		
		
		 See [vim.lsp.ClientConfig].
	**/
	@:optional
	extern var workspace_folders : Null<Array<nvim.type.lsp.WorkspaceFolder>>;
	/**
		```lua
		(method) vim.lsp.Client:_add_workspace_folder(dir?: string)
		```
		
		---
		
		 Add a directory to the workspace folders.
	**/
	extern function _add_workspace_folder(?dir:Null<String>):Dynamic;
	/**
		```lua
		(method) vim.lsp.Client:_get_registration(method: string, bufnr?: integer)
		  -> (lsp.Registration)?
		```
	**/
	extern function _get_registration(method:String, ?bufnr:Int):Null<nvim.type.lsp.Registration>;
	/**
		```lua
		(method) vim.lsp.Client:_get_registration_options(method: string, bufnr?: integer)
		  -> (boolean|string|number|lsp.LSPAny[]|table<string, lsp.LSPAny>|nil)?
		```
		
		---
		
		 Get options for a method that is registered dynamically.
	**/
	extern function _get_registration_options(method:String, ?bufnr:Int):Null<nvim.type.lsp.LSPAny>;
	/**
		```lua
		(method) vim.lsp.Client:_register(registrations: lsp.Registration[])
		```
	**/
	extern function _register(registrations:Array<nvim.type.lsp.Registration>):Dynamic;
	/**
		```lua
		(method) vim.lsp.Client:_remove_workspace_folder(dir?: string)
		```
		
		---
		
		 Remove a directory to the workspace folders.
	**/
	extern function _remove_workspace_folder(?dir:Null<String>):Dynamic;
	/**
		```lua
		(method) vim.lsp.Client:_supports_registration(method: string)
		  -> false
		```
		
		---
		
		 Get options for a method that is registered dynamically.
	**/
	extern function _supports_registration(method:String):Dynamic;
	/**
		```lua
		(method) vim.lsp.Client:_text_document_did_open_handler(bufnr: integer)
		```
		
		---
		
		 Default handler for the 'textDocument/didOpen' LSP notification.
		
		@*param* `bufnr` — Number of the buffer, or 0 for current
	**/
	extern function _text_document_did_open_handler(bufnr:Int):Dynamic;
	/**
		```lua
		(method) vim.lsp.Client:_unregister(unregistrations: lsp.Unregistration[])
		```
	**/
	extern function _unregister(unregistrations:Array<nvim.type.lsp.Unregistration>):Dynamic;
	/**
		```lua
		(method) vim.lsp.Client:cancel_request(id: integer)
		  -> status: boolean
		```
		
		---
		
		 Cancels a request with a given request id.
		
		@*param* `id` — id of request to cancel
		
		@*return* `status` — indicating if the notification was successful.
		
		 @see |Client:notify()|
	**/
	extern function cancel_request(id:Int):Bool;
	/**
		```lua
		(method) vim.lsp.Client:exec_cmd(command: lsp.Command, context?: { bufnr: integer }, handler?: fun(err?: lsp.ResponseError, result: any, context: lsp.HandlerContext, config?: table):...unknown)
		```
		
		---
		
		 Execute a lsp command, either via client command function (if available)
		 or via workspace/executeCommand (if supported by the server)
		
		@*param* `handler` — only called if a server command
	**/
	extern function exec_cmd(command:nvim.type.lsp.Command, ?context:{ @:optional
	var bufnr : Null<Int>; }, ?handler:nvim.type.lsp.Handler):Dynamic;
	/**
		```lua
		(method) vim.lsp.Client:initialize()
		```
		
		---
		
		 @nodoc
	**/
	extern function initialize():Dynamic;
	/**
		```lua
		(method) vim.lsp.Client:is_stopped()
		  -> boolean
		```
		
		---
		
		 Checks whether a client is stopped.
		
		@*return* — true if client is stopped or in the process of being
		
		 stopped; false otherwise
	**/
	extern function is_stopped():Bool;
	/**
		```lua
		(method) vim.lsp.Client:notify(method: string, params?: table)
		  -> status: boolean
		```
		
		---
		
		 Sends a notification to an LSP server.
		
		@*param* `method` — LSP method name.
		
		@*param* `params` — LSP request params.
		
		@*return* `status` — indicating if the notification was successful.
		
		                        If it is false, then the client has shutdown.
	**/
	extern function notify(method:String, ?params:Null<lua.Table.AnyTable>):Bool;
	/**
		```lua
		(method) vim.lsp.Client:on_attach(bufnr: integer)
		```
		
		---
		
		 Runs the on_attach function from the client's config if it was defined.
		 Useful for buffer-local setup.
		
		@*param* `bufnr` — Buffer number
	**/
	extern function on_attach(bufnr:Int):Dynamic;
	/**
		```lua
		(method) vim.lsp.Client:request(method: string, params?: table, handler?: fun(err?: lsp.ResponseError, result: any, context: lsp.HandlerContext, config?: table):...unknown, bufnr?: integer)
		  -> status: boolean
		  2. request_id: integer?
		```
		
		---
		
		 Sends a request to the server.
		
		 This is a thin wrapper around {client.rpc.request} with some additional
		 checks for capabilities and handler availability.
		
		@*param* `method` — LSP method name.
		
		@*param* `params` — LSP request params.
		
		@*param* `handler` — Response |lsp-handler| for this method.
		
		@*param* `bufnr` — (default: 0) Buffer handle, or 0 for current.
		
		@*return* `status` — indicates whether the request was successful.
		
		     If it is `false`, then it will always be `false` (the client has shutdown).
		
		@*return* `request_id` — Can be used with |Client:cancel_request()|.
		
		                             `nil` is request failed.
		 to cancel the-request.
		 @see |vim.lsp.buf_request_all()|
	**/
	extern function request(method:String, ?params:lua.Table.AnyTable, ?handler:nvim.type.lsp.Handler, ?bufnr:Int):nvim.helper.Multireturn<Bool, Null<Int>, Void, Void, Void, Void>;
	/**
		```lua
		(method) vim.lsp.Client:request_sync(method: string, params: table, timeout_ms?: integer, bufnr?: integer)
		  -> { err: (lsp.ResponseError)?, result: any }?
		  2. err: string?
		```
		
		---
		
		 Sends a request to the server and synchronously waits for the response.
		
		 This is a wrapper around |Client:request()|
		
		@*param* `method` — LSP method name.
		
		@*param* `params` — LSP request params.
		
		@*param* `timeout_ms` — Maximum time in milliseconds to wait for
		
		                                a result. Defaults to 1000
		
		@*param* `bufnr` — (default: 0) Buffer handle, or 0 for current.
		
		@*return* — `result` and `err` from the |lsp-handler|.
		
		                 `nil` is the request was unsuccessful
		
		@*return* `err` — On timeout, cancel or error, where `err` is a
		
		                 string describing the failure reason.
		 @see |vim.lsp.buf_request_sync()|
	**/
	extern function request_sync(method:String, params:lua.Table.AnyTable, ?timeout_ms:Null<Int>, ?bufnr:Int):nvim.helper.Multireturn<Null<{ @:optional
	var err : Null<nvim.type.lsp.ResponseError>; var result : Any; }>, Null<String>, Void, Void, Void, Void>;
	/**
		```lua
		(method) vim.lsp.Client:stop(force?: boolean)
		```
		
		---
		
		 Stops a client, optionally with force.
		
		 By default, it will just request the server to shutdown without force. If
		 you request to stop a client which has previously been requested to
		 shutdown, it will automatically escalate and force shutdown.
	**/
	extern function stop(?force:Bool):Dynamic;
	/**
		```lua
		(method) vim.lsp.Client:supports_method(method: string, bufnr?: integer)
		  -> boolean
		```
		
		---
		
		 Checks if a client supports a given method.
		 Always returns true for unknown off-spec methods.
		
		 Note: Some language server capabilities can be file specific.
	**/
	extern function supports_method(method:String, ?bufnr:Int):Dynamic;
}