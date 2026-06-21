package nvim.module.vim;

/**
	```lua
	(global) vim.lsp.commands: table<string, function>
	```
	
	---
	
	 Registry for client side commands.
	 This is an extension point for plugins to handle custom commands which are
	 not part of the core language server protocol specification.
	
	 The registry is a table where the key is a unique command name,
	 and the value is a function which is called if any LSP action
	 (code action, code lenses, ...) triggers the command.
	
	 If an LSP response contains a command for which no matching entry is
	 available in this registry, the command will be executed via the LSP server
	 using `workspace/executeCommand`.
	
	 The first argument to the function will be the `Command`:
	   Command
	     title: String
	     command: String
	     arguments?: any[]
	
	 The second argument is the `ctx` of |lsp-handler|
**/
extern class Commands {

}

extern class Lsp {
	/**
		```lua
		(global) vim.lsp.buf: table
		```
	**/
	var buf : nvim.module.vim.lsp.Buf;
	/**
		```lua
		function lsp.buf_attach_client(bufnr: integer, client_id: integer)
		  -> success: boolean
		```
		
		---
		
		 Implements the `textDocument/did…` notifications required to track a buffer
		 for any language server.
		
		 Without calling this, the server won't be notified of changes to a buffer.
		
		@*param* `bufnr` — Buffer handle, or 0 for current
		
		@*param* `client_id` — Client id
		
		@*return* `success` — `true` if client was attached successfully; `false` otherwise
	**/
	@:luaDotMethod
	function buf_attach_client(bufnr:Int, client_id:Int):Bool;
	/**
		```lua
		function lsp.buf_detach_client(bufnr: integer, client_id: integer)
		```
		
		---
		
		 Detaches client from the specified buffer.
		 Note: While the server is notified that the text document (buffer)
		 was closed, it is still able to send notifications should it ignore this notification.
		
		@*param* `bufnr` — Buffer handle, or 0 for current
		
		@*param* `client_id` — Client id
	**/
	@:luaDotMethod
	function buf_detach_client(bufnr:Int, client_id:Int):Dynamic;
	/**
		```lua
		function lsp.buf_get_clients(bufnr: integer|nil)
		  -> result: table
		```
		
		---
		
		 Gets a map of client_id:client pairs for the given buffer, where each value
		 is a |vim.lsp.Client| object.
		
		@*param* `bufnr` — : Buffer handle, or 0 for current
		
		@*return* `result` — is table of (client_id, client) pairs
	**/
	@:luaDotMethod
	@:deprecated
	function buf_get_clients(?bufnr:Null<Int>):lua.Table.AnyTable;
	/**
		```lua
		function lsp.buf_is_attached(bufnr: integer, client_id: integer)
		  -> boolean
		```
		
		---
		
		 Checks if a buffer is attached for a particular client.
		
		@*param* `bufnr` — Buffer handle, or 0 for current
		
		@*param* `client_id` — the client id
	**/
	@:luaDotMethod
	function buf_is_attached(bufnr:Int, client_id:Int):Dynamic;
	/**
		```lua
		function lsp.buf_notify(bufnr: integer|nil, method: string, params: any)
		  -> success: boolean
		```
		
		---
		
		 Send a notification to a server
		
		@*param* `bufnr` — The number of the buffer
		
		@*param* `method` — Name of the request method
		
		@*param* `params` — Arguments to send to the server
		
		
		@*return* `success` — true if any client returns true; false otherwise
	**/
	@:luaDotMethod
	function buf_notify(bufnr:Null<Int>, method:String, params:Any):Bool;
	/**
		```lua
		function lsp.buf_request(bufnr: integer, method: string, params?: table|fun(client: vim.lsp.Client, bufnr: integer):table?, handler?: fun(err?: lsp.ResponseError, result: any, context: lsp.HandlerContext, config?: table):...unknown, on_unsupported?: fun())
		  -> client_request_ids: table<integer, integer>
		  2. _cancel_all_requests: function
		```
		
		---
		
		 Sends an async request for all active clients attached to the
		 buffer.
		
		@*param* `bufnr` — Buffer handle, or 0 for current.
		
		@*param* `method` — LSP method name
		
		@*param* `params` — Parameters to send to the server
		
		@*param* `handler` — See |lsp-handler|
		
		       If nil, follows resolution strategy defined in |lsp-handler-configuration|
		       Defaults to an `ERROR` level notification.
		
		@*return* `client_request_ids` — Map of client-id:request-id pairs
		
		for all successful requests.
		
		@*return* `_cancel_all_requests` — Function which can be used to
		
		cancel all the requests. You could instead
		iterate all clients and call their `cancel_request()` methods.
	**/
	@:luaDotMethod
	private function buf_request(bufnr:Int, method:String, ?params:haxe.extern.EitherType<lua.Table.AnyTable, (client:nvim.type.vim.lsp.Client, bufnr:Int) -> Null<lua.Table.AnyTable>>, ?handler:nvim.type.lsp.Handler, ?on_unsupported:() -> Dynamic):nvim.helper.Multireturn<lua.Table<Int, Int>, haxe.Constraints.Function, Void, Void, Void, Void>;
	/**
		```lua
		function lsp.buf_request_all(bufnr: integer, method: string, params?: table|fun(client: vim.lsp.Client, bufnr: integer):table?, handler: fun(results: table<integer, { err: (lsp.ResponseError)?, result: any }>, context: lsp.HandlerContext, config?: table):...unknown)
		  -> cancel: function
		```
		
		---
		
		 Sends an async request for all active clients attached to the buffer and executes the `handler`
		 callback with the combined result.
		
		@*param* `bufnr` — Buffer handle, or 0 for current.
		
		@*param* `method` — LSP method name
		
		@*param* `params` — Parameters to send to the server.
		
		               Can also be passed as a function that returns the params table for cases where
		               parameters are specific to the client.
		
		@*param* `handler` — (function)
		
		 Handler called after all requests are completed. Server results are passed as
		 a `client_id:result` map.
		
		@*return* `cancel` — Function that cancels all requests.
	**/
	@:luaDotMethod
	function buf_request_all(bufnr:Int, method:String, ?params:haxe.extern.EitherType<lua.Table.AnyTable, (client:nvim.type.vim.lsp.Client, bufnr:Int) -> Null<lua.Table.AnyTable>>, handler:nvim.type.lsp.MultiHandler):haxe.Constraints.Function;
	/**
		```lua
		function lsp.buf_request_sync(bufnr: integer, method: string, params?: table, timeout_ms?: integer)
		  -> result: table<integer, { error: (lsp.ResponseError)?, result: any }>?
		  2. err: string?
		```
		
		---
		
		 Sends a request to all server and waits for the response of all of them.
		
		 Calls |vim.lsp.buf_request_all()| but blocks Nvim while awaiting the result.
		 Parameters are the same as |vim.lsp.buf_request_all()| but the result is
		 different. Waits a maximum of {timeout_ms}.
		
		@*param* `bufnr` — Buffer handle, or 0 for current.
		
		@*param* `method` — LSP method name
		
		@*param* `params` — Parameters to send to the server
		
		@*param* `timeout_ms` — Maximum time in milliseconds to wait for a result.
		
		                           (default: `1000`)
		
		@*return* `result` — Map of client_id:request_result.
		
		@*return* `err` — On timeout, cancel, or error, `err` is a string describing the failure reason, and `result` is nil.
	**/
	@:luaDotMethod
	function buf_request_sync(bufnr:Int, method:String, ?params:Null<lua.Table.AnyTable>, ?timeout_ms:Null<Int>):nvim.helper.Multireturn<Null<lua.Table<Int, { @:optional
	var error : Null<nvim.type.lsp.ResponseError>; var result : Any; }>>, Null<String>, Void, Void, Void, Void>;
	/**
		```lua
		(global) vim.lsp.client: vim.lsp.Client
		```
	**/
	var client : nvim.module.vim.lsp.Client;
	/**
		```lua
		(global) vim.lsp.client_errors: table
		```
		
		---
		
		 Error codes to be used with `on_error` from |vim.lsp.start_client|.
		 Can be used to look up the string from a the number or the number
		 from the string.
		 @nodoc
	**/
	var client_errors : lua.Table.AnyTable;
	/**
		```lua
		function lsp.client_is_stopped(client_id: integer)
		  -> stopped: boolean
		```
		
		---
		
		Checks whether a client is stopped.
		
		@*return* `stopped` — true if client is stopped, false otherwise.
	**/
	@:luaDotMethod
	function client_is_stopped(client_id:Int):Bool;
	/**
		```lua
		(global) vim.lsp.codelens: table
		```
	**/
	var codelens : nvim.module.vim.lsp.Codelens;
	/**
		```lua
		(global) vim.lsp.completion: table
		```
	**/
	var completion : nvim.module.vim.lsp.Completion;
	/**
		```lua
		(global) vim.lsp.config: vim.lsp.config
		```
		
		---
		
		 @nodoc
	**/
	var config : nvim.type.vim.lsp.Config;
	/**
		```lua
		(global) vim.lsp.diagnostic: table
		```
	**/
	var diagnostic : nvim.module.vim.lsp.Diagnostic;
	/**
		```lua
		function lsp.enable(name: string|string[], enable?: boolean)
		```
		
		---
		
		 Auto-starts LSP when a buffer is opened, based on the |lsp-config| `filetypes`, `root_markers`,
		 and `root_dir` fields.
		
		 Examples:
		
		 ```lua
		 vim.lsp.enable('clangd')
		 vim.lsp.enable({'luals', 'pyright'})
		 ```
		
		 Example: [lsp-restart](file:///usr/local/share/nvim/runtime/lua/vim) Passing `false` stops and detaches the client(s). Thus you can
		 "restart" LSP by disabling and re-enabling a given config:
		
		 ```lua
		 vim.lsp.enable('clangd', false)
		 vim.lsp.enable('clangd', true)
		 ```
		
		 Example: To _dynamically_ decide whether LSP is activated, define a |lsp-root_dir()| function
		 which calls `on_dir()` only when you want that config to activate:
		
		 ```lua
		 vim.lsp.config('lua_ls', {
		   root_dir = function(bufnr, on_dir)
		     if not vim.fn.bufname(bufnr):match('%.txt$') then
		       on_dir(vim.fn.getcwd())
		     end
		   end
		 })
		 ```
		
		@*param* `name` — Name(s) of client(s) to enable.
		
		@*param* `enable` — `true|nil` to enable, `false` to disable (actively stops and detaches
		
		 clients as needed)
	**/
	@:luaDotMethod
	function enable(name:haxe.extern.EitherType<String, Array<String>>, ?enable:Bool):Dynamic;
	/**
		```lua
		function lsp.foldclose(kind: "comment"|"imports"|"region", winid?: integer)
		```
		
		---
		
		 Close all {kind} of folds in the the window with {winid}.
		
		 To automatically fold imports when opening a file, you can use an autocmd:
		
		 ```lua
		 vim.api.nvim_create_autocmd('LspNotify', {
		   callback = function(args)
		     if args.data.method == 'textDocument/didOpen' then
		       vim.lsp.foldclose('imports', vim.fn.bufwinid(args.buf))
		     end
		   end,
		 })
		 ```
		
		@*param* `kind` — Kind to close, one of "comment", "imports" or "region".
		
		@*param* `winid` — Defaults to the current window.
		
		```lua
		-- A set of predefined range kinds.
		kind:
		    | "comment" -- Comment
		    | "imports" -- Imports
		    | "region" -- Region
		```
	**/
	@:luaDotMethod
	function foldclose(kind:nvim.type.lsp.FoldingRangeKind, ?winid:Int):Dynamic;
	/**
		```lua
		function lsp.foldexpr(lnum: integer)
		  -> string
		```
		
		---
		
		 Provides an interface between the built-in client and a `foldexpr` function.
		
		 To use, set 'foldmethod' to "expr" and set the value of 'foldexpr':
		
		 ```lua
		 vim.o.foldmethod = 'expr'
		 vim.o.foldexpr = 'v:lua.vim.lsp.foldexpr()'
		 ```
		
		 Or use it only when supported by checking for the "textDocument/foldingRange"
		 capability in an |LspAttach| autocommand. Example:
		
		 ```lua
		 vim.o.foldmethod = 'expr'
		 -- Default to treesitter folding
		 vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		 -- Prefer LSP folding if client supports it
		 vim.api.nvim_create_autocmd('LspAttach', {
		   callback = function(args)
		     local client = vim.lsp.get_client_by_id(args.data.client_id)
		     if client:supports_method('textDocument/foldingRange') then
		       local win = vim.api.nvim_get_current_win()
		       vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
		     end
		   end,
		 })
		 ```
		
		@*param* `lnum` — line number
	**/
	@:luaDotMethod
	function foldexpr(lnum:Int):Dynamic;
	/**
		```lua
		function lsp.foldtext()
		  -> string
		```
		
		---
		
		 Provides a `foldtext` function that shows the `collapsedText` retrieved,
		 defaults to the first folded line if `collapsedText` is not provided.
	**/
	@:luaDotMethod
	function foldtext():Dynamic;
	/**
		```lua
		function lsp.for_each_buffer_client(bufnr: integer, fn: function)
		```
		
		---
		
		 Invokes a function for each LSP client attached to a buffer.
		
		@*param* `bufnr` — Buffer number
		
		@*param* `fn` — Function to run on each client attached to buffer
		
		                   {bufnr}. The function takes the client, client ID, and
		                   buffer number as arguments.
	**/
	@:luaDotMethod
	@:deprecated
	private function for_each_buffer_client(bufnr:Int, fn:haxe.Constraints.Function):Dynamic;
	/**
		```lua
		function lsp.formatexpr(opts?: vim.lsp.formatexpr.Opts)
		  -> integer
		```
		
		---
		
		 Provides an interface between the built-in client and a `formatexpr` function.
		
		 Currently only supports a single client. This can be set via
		 `setlocal formatexpr=v:lua.vim.lsp.formatexpr()` or (more typically) in `on_attach`
		 via `vim.bo[bufnr].formatexpr = 'v:lua.vim.lsp.formatexpr(#{timeout_ms:250})'`.
	**/
	@:luaDotMethod
	function formatexpr(?opts:nvim.type.vim.lsp.formatexpr.Opts):Dynamic;
	/**
		```lua
		function lsp.get_active_clients(filter: any)
		  -> vim.lsp.Client[]
		```
	**/
	@:luaDotMethod
	@:deprecated
	private function get_active_clients(filter:Dynamic):Dynamic;
	/**
		```lua
		function lsp.get_buffers_by_client_id(client_id: integer)
		  -> buffers: integer[]
		```
		
		---
		
		 Returns list of buffers attached to client_id.
		
		@*param* `client_id` — client id
		
		@*return* `buffers` — list of buffer ids
	**/
	@:luaDotMethod
	function get_buffers_by_client_id(client_id:Int):Array<Int>;
	/**
		```lua
		function lsp.get_client_by_id(client_id: integer)
		  -> client: vim.lsp.Client|nil
		```
		
		---
		
		 Gets a client by id, or nil if the id is invalid.
		 The returned client may not yet be fully initialized.
		
		@*param* `client_id` — client id
		
		
		@*return* `client` — rpc object
	**/
	@:luaDotMethod
	function get_client_by_id(client_id:Int):Null<nvim.type.vim.lsp.Client>;
	/**
		```lua
		function lsp.get_clients(filter?: vim.lsp.get_clients.Filter)
		  -> vim.lsp.Client[]
		```
		
		---
		
		 Get active clients.
		
		@*return* — : List of |vim.lsp.Client| objects
	**/
	@:luaDotMethod
	function get_clients(?filter:nvim.type.vim.lsp.get_clients.Filter):Array<nvim.type.vim.lsp.Client>;
	/**
		```lua
		function lsp.get_log_path()
		  -> path: string
		```
		
		---
		
		 Gets the path of the logfile used by the LSP client.
		
		@*return* `path` — to log file
	**/
	@:luaDotMethod
	function get_log_path():String;
	/**
		```lua
		(global) vim.lsp.handlers: table<string, fun(err?: lsp.ResponseError, result: any, context: lsp.HandlerContext, config?: table):...unknown>
		```
	**/
	var handlers : nvim.module.vim.lsp.Handlers;
	/**
		```lua
		(global) vim.lsp.inlay_hint: table
		```
	**/
	var inlay_hint : nvim.module.vim.lsp.InlayHint;
	/**
		```lua
		function lsp.is_enabled(name: string)
		  -> boolean
		```
		
		---
		
		 Checks if the given LSP config is enabled (globally, not per-buffer).
		
		 Unlike `vim.lsp.config['…']`, this does not have the side-effect of resolving the config.
		
		@*param* `name` — Config name
	**/
	@:luaDotMethod
	function is_enabled(name:String):Bool;
	/**
		```lua
		(global) vim.lsp.log: table
		```
	**/
	var log : nvim.module.vim.lsp.Log;
	/**
		```lua
		(global) vim.lsp.log_levels: table<integer, string>|table<string, integer>
		```
		
		---
		
		 Log level dictionary with reverse lookup as well.
		
		 Can be used to lookup the number from the name or the
		 name from the number.
		 Levels by name: "TRACE", "DEBUG", "INFO", "WARN", "ERROR", "OFF"
		 Level numbers begin with "TRACE" at 0
		 @nodoc
	**/
	var log_levels : haxe.extern.EitherType<lua.Table<String, Int>, lua.Table<Int, String>>;
	/**
		```lua
		function lsp.omnifunc(findstart: integer, base: integer)
		  -> Decided: integer|table
		```
		
		---
		
		 Implements 'omnifunc' compatible LSP completion.
		
		
		@*param* `findstart` — 0 or 1, decides behavior
		
		@*param* `base` — findstart=0, text to match against
		
		
		@*return* `Decided` — by {findstart}:
		
		 - findstart=0: column where the completion starts, or -2 or -3
		 - findstart=1: list of matches (actually just calls |complete()|)
	**/
	@:luaDotMethod
	function omnifunc(findstart:Int, base:Int):haxe.extern.EitherType<Int, lua.Table.AnyTable>;
	/**
		```lua
		(global) vim.lsp.protocol: vim.lsp.protocol
		```
		
		---
		
		 Protocol for the Microsoft Language Server Protocol (mslsp)
	**/
	var protocol : nvim.module.vim.lsp.Protocol;
	/**
		```lua
		(global) vim.lsp.rpc: table
		```
	**/
	var rpc : nvim.module.vim.lsp.Rpc;
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
		(global) vim.lsp.semantic_tokens: table
		```
	**/
	var semantic_tokens : nvim.module.vim.lsp.SemanticTokens;
	/**
		```lua
		function lsp.set_log_level(level: string|integer)
		```
		
		---
		
		 Sets the global log level for LSP logging.
		
		 Levels by name: "TRACE", "DEBUG", "INFO", "WARN", "ERROR", "OFF"
		
		 Level numbers begin with "TRACE" at 0
		
		 Use `lsp.log_levels` for reverse lookup.
		
		
		@*param* `level` — the case insensitive level name or number
	**/
	@:luaDotMethod
	function set_log_level(level:haxe.extern.EitherType<Int, String>):Dynamic;
	/**
		```lua
		function lsp.start(config: vim.lsp.ClientConfig, opts?: vim.lsp.start.Opts)
		  -> client_id: integer?
		```
		
		---
		
		 Create a new LSP client and start a language server or reuses an already
		 running client if one is found matching `name` and `root_dir`.
		 Attaches the current buffer to the client.
		
		 Example:
		
		 ```lua
		 vim.lsp.start({
		    name = 'my-server-name',
		    cmd = {'name-of-language-server-executable'},
		    root_dir = vim.fs.root(0, {'pyproject.toml', 'setup.py'}),
		 })
		 ```
		
		 See |vim.lsp.ClientConfig| for all available options. The most important are:
		
		 - `name` arbitrary name for the LSP client. Should be unique per language server.
		 - `cmd` command string[] or function.
		 - `root_dir` path to the project root. By default this is used to decide if an existing client
		   should be re-used. The example above uses |vim.fs.root()| to detect the root by traversing
		   the file system upwards starting from the current directory until either a `pyproject.toml`
		   or `setup.py` file is found.
		 - `workspace_folders` list of `{ uri:string, name: string }` tables specifying the project root
		   folders used by the language server. If `nil` the property is derived from `root_dir` for
		   convenience.
		
		 Language servers use this information to discover metadata like the
		 dependencies of your project and they tend to index the contents within the
		 project folder.
		
		
		 To ensure a language server is only started for languages it can handle,
		 make sure to call |vim.lsp.start()| within a |FileType| autocmd.
		 Either use |:au|, |nvim_create_autocmd()| or put the call in a
		 `ftplugin/<filetype_name>.lua` (See |ftplugin-name|)
		
		@*param* `config` — Configuration for the server.
		
		@*param* `opts` — Optional keyword arguments.
	**/
	@:luaDotMethod
	function start(config:nvim.type.vim.lsp.ClientConfig, ?opts:Null<nvim.type.vim.lsp.start.Opts>):Null<Int>;
	/**
		```lua
		function lsp.start_client(config: vim.lsp.ClientConfig)
		  -> client_id: integer?
		  2. string?
		```
		
		---
		
		 Starts and initializes a client with the given configuration.
		
		@*param* `config` — Configuration for the server.
		
		@*return* `client_id` — |vim.lsp.get_client_by_id()| Note: client may not be
		
		         fully initialized. Use `on_init` to do any actions once
		         the client has been initialized.
		
		@*return* — Error message, if any
	**/
	@:luaDotMethod
	@:deprecated
	function start_client(config:nvim.type.vim.lsp.ClientConfig):nvim.helper.Multireturn<Null<Int>, Null<String>, Void, Void, Void, Void>;
	/**
		```lua
		function lsp.status()
		  -> string
		```
		
		---
		
		 Consumes the latest progress messages from all clients and formats them as a string.
		 Empty if there are no clients or if no new messages
	**/
	@:luaDotMethod
	function status():String;
	/**
		```lua
		function lsp.stop_client(client_id: integer|integer[]|vim.lsp.Client[], force?: boolean)
		```
		
		---
		
		 Stops a client(s).
		
		 You can also use the `stop()` function on a |vim.lsp.Client| object.
		 To stop all clients:
		
		 ```lua
		 vim.lsp.stop_client(vim.lsp.get_clients())
		 ```
		
		 By default asks the server to shutdown, unless stop was requested
		 already for this client, then force-shutdown is attempted.
		
		@*param* `client_id` — id, list of id's, or list of |vim.lsp.Client| objects
		
		@*param* `force` — shutdown forcefully
	**/
	@:luaDotMethod
	function stop_client(client_id:haxe.extern.EitherType<Int, haxe.extern.EitherType<Array<Int>, Array<nvim.type.vim.lsp.Client>>>, ?force:Bool):Dynamic;
	/**
		```lua
		function lsp.tagfunc(pattern: string, flags: string)
		  -> tags: table[]
		```
		
		---
		
		 Provides an interface between the built-in client and 'tagfunc'.
		
		 When used with normal mode commands (e.g. |CTRL-]|) this will invoke
		 the "textDocument/definition" LSP method to find the tag under the cursor.
		 Otherwise, uses "workspace/symbol". If no results are returned from
		 any LSP servers, falls back to using built-in tags.
		
		@*param* `pattern` — Pattern used to find a workspace symbol
		
		@*param* `flags` — See |tag-function|
		
		
		@*return* `tags` — A list of matching tags
	**/
	@:luaDotMethod
	function tagfunc(pattern:String, flags:String):Array<lua.Table.AnyTable>;
	/**
		```lua
		(global) vim.lsp.util: table
		```
	**/
	var util : nvim.module.vim.lsp.Util;
	/**
		```lua
		function lsp.with(handler: fun(err?: lsp.ResponseError, result: any, context: lsp.HandlerContext, config?: table):...unknown, override_config: table)
		  -> function
		```
		
		---
		
		 Function to manage overriding defaults for LSP handlers.
		
		@*param* `handler` — See |lsp-handler|
		
		@*param* `override_config` — Table containing the keys to override behavior of the {handler}
	**/
	@:luaDotMethod
	@:deprecated
	function with(handler:nvim.type.lsp.Handler, override_config:lua.Table.AnyTable):Dynamic;
}