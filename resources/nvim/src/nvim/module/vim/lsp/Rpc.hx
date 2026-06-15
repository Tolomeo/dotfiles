package nvim.module.vim.lsp;

extern class Rpc {
	/**
		```lua
		(global) vim.lsp.rpc.client_errors: table<integer, string>|table<string, integer>
		```
		
		---
		
		 @nodoc
	**/
	var client_errors : haxe.extern.EitherType<lua.Table<String, Int>, lua.Table<Int, String>>;
	/**
		```lua
		function M.connect(host_or_path: string, port?: integer)
		  -> fun(dispatchers: vim.lsp.rpc.Dispatchers):vim.lsp.rpc.PublicClient
		```
		
		---
		
		 Create a LSP RPC client factory that connects to either:
		
		  - a named pipe (windows)
		  - a domain socket (unix)
		  - a host and port via TCP
		
		 Return a function that can be passed to the `cmd` field for
		 |vim.lsp.start()|.
		
		@*param* `host_or_path` — host to connect to or path to a pipe/domain socket
		
		@*param* `port` — TCP port to connect to. If absent the first argument must be a pipe
	**/
	@:luaDotMethod
	function connect(host_or_path:String, ?port:Null<Int>):(dispatchers:nvim.type.vim.lsp.rpc.Dispatchers) -> nvim.type.vim.lsp.rpc.PublicClient;
	/**
		```lua
		function M.create_read_loop(handle_body: fun(body: string), on_exit?: fun(), on_error: fun(err: any))
		  -> function
		```
	**/
	@:luaDotMethod
	private function create_read_loop(handle_body:(body:String) -> Dynamic, ?on_exit:() -> Dynamic, on_error:(err:Any) -> Dynamic):Dynamic;
	/**
		```lua
		function M.format_rpc_error(err: table)
		  -> error_message: string
		```
		
		---
		
		 Constructs an error message from an LSP error object.
		
		@*param* `err` — The error object
		
		@*return* `error_message` — The formatted error message
	**/
	@:luaDotMethod
	function format_rpc_error(err:lua.Table.AnyTable):String;
	/**
		```lua
		function M.rpc_response_error(code: integer, message?: string, data?: any)
		  -> lsp.ResponseError
		```
		
		---
		
		 Creates an RPC response table `error` to be sent to the LSP response.
		
		@*param* `code` — RPC error code defined, see `vim.lsp.protocol.ErrorCodes`
		
		@*param* `message` — arbitrary message to send to server
		
		@*param* `data` — arbitrary data to send to server
		
		
		See: [lsp.ErrorCodes](file:///usr/local/share/nvim/runtime/lua/vim/lsp/_meta/protocol.lua#5231#10) See `vim.lsp.protocol.ErrorCodes`
	**/
	@:luaDotMethod
	function rpc_response_error(code:Int, ?message:String, ?data:Any):nvim.type.lsp.ResponseError;
	/**
		```lua
		function M.start(cmd: string[], dispatchers?: vim.lsp.rpc.Dispatchers, extra_spawn_params?: vim.lsp.rpc.ExtraSpawnParams)
		  -> vim.lsp.rpc.PublicClient
		```
		
		---
		
		 Starts an LSP server process and create an LSP RPC client object to
		 interact with it. Communication with the spawned process happens via stdio. For
		 communication via TCP, spawn a process manually and use |vim.lsp.rpc.connect()|
		
		@*param* `cmd` — Command to start the LSP server.
	**/
	@:luaDotMethod
	function start(cmd:Array<String>, ?dispatchers:nvim.type.vim.lsp.rpc.Dispatchers, ?extra_spawn_params:nvim.type.vim.lsp.rpc.ExtraSpawnParams):nvim.type.vim.lsp.rpc.PublicClient;
}