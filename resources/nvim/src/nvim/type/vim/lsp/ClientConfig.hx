package nvim.type.vim.lsp;

/**
	```lua
	(class) vim.lsp.ClientConfig
	```
**/
@:structInit extern class ClientConfig {
	/**
		```lua
		(field) vim.lsp.ClientConfig.before_init: fun(params: lsp.InitializeParams, config: vim.lsp.ClientConfig)?
		```
		
		---
		
		
		 Callback invoked before the LSP "initialize" phase, where `params` contains the parameters
		 being sent to the server and `config` is the config that was passed to |vim.lsp.start()|.
		 You can use this to modify parameters before they are sent.
		
		---
		
		```lua
		function (params: lsp.InitializeParams, config: vim.lsp.ClientConfig)
		```
	**/
	var before_init : Null<(params:nvim.type.lsp.InitializeParams, config:nvim.type.vim.lsp.ClientConfig) -> Dynamic>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.capabilities: (lsp.ClientCapabilities)?
		```
		
		---
		
		Defines the capabilities provided by the client.
		
		---
		
		 Map overriding the default capabilities defined by |vim.lsp.protocol.make_client_capabilities()|,
		 passed to the language server on initialization. Hint: use make_client_capabilities() and modify
		 its result.
		 - Note: To send an empty dictionary use |vim.empty_dict()|, else it will be encoded as an
		   array.
	**/
	var capabilities : Null<nvim.type.lsp.ClientCapabilities>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.cmd: fun(dispatchers: vim.lsp.rpc.Dispatchers, config: vim.lsp.ClientConfig):vim.lsp.rpc.PublicClient|string[]
		```
		
		---
		
		
		 Command `string[]` that launches the language server (treated as in |jobstart()|, must be
		 absolute or on `$PATH`, shell constructs like "~" are not expanded), or function that creates an
		 RPC client. Function receives a `dispatchers` table and the resolved `config`, and must return
		 a table with member functions `request`, `notify`, `is_closing` and `terminate`.
		 See |vim.lsp.rpc.request()|, |vim.lsp.rpc.notify()|.
		 For TCP there is a builtin RPC client factory: |vim.lsp.rpc.connect()|
		
		---
		
		```lua
		function (dispatchers: vim.lsp.rpc.Dispatchers, config: vim.lsp.ClientConfig)
		  -> vim.lsp.rpc.PublicClient
		```
	**/
	var cmd : haxe.extern.EitherType<Array<String>, (dispatchers:nvim.type.vim.lsp.rpc.Dispatchers, config:nvim.type.vim.lsp.ClientConfig) -> nvim.type.vim.lsp.rpc.PublicClient>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.cmd_cwd: string?
		```
		
		---
		
		
		 Directory to launch the `cmd` process. Not related to `root_dir`.
		 (default: cwd)
	**/
	var cmd_cwd : Null<String>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.cmd_env: table?
		```
		
		---
		
		
		 Environment variables passed to the LSP process on spawn. Non-string values are coerced to
		 string.
		 Example:
		 ```lua
		 { PORT = 8080; HOST = '0.0.0.0'; }
		 ```
	**/
	var cmd_env : Null<lua.Table.AnyTable>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.commands: table<string, fun(command: lsp.Command, ctx: table)>?
		```
		
		---
		
		
		 Client commands. Map of command names to user-defined functions. Commands passed to `start()`
		 take precedence over the global command registry. Each key must be a unique command name, and
		 the value is a function which is called if any LSP action (code action, code lenses, …) triggers
		 the command.
	**/
	var commands : Null<lua.Table<String, (command:nvim.type.lsp.Command, ctx:lua.Table.AnyTable) -> Dynamic>>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.detached: boolean?
		```
		
		---
		
		
		 Daemonize the server process so that it runs in a separate process group from Nvim.
		 Nvim will shutdown the process on exit, but if Nvim fails to exit cleanly this could leave
		 behind orphaned server processes.
		 (default: `true`)
	**/
	var detached : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.flags: (vim.lsp.Client.Flags)?
		```
		
		---
		
		
		 A table with flags for the client. The current (experimental) flags are:
	**/
	var flags : Null<nvim.type.vim.lsp.client.Flags>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.get_language_id: (fun(bufnr: integer, filetype: string):string)?
		```
		
		---
		
		
		 Language ID as string. Defaults to the buffer filetype.
		
		---
		
		```lua
		function (bufnr: integer, filetype: string)
		  -> string
		```
	**/
	var get_language_id : Null<(bufnr:Int, filetype:String) -> String>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.handlers: table<string, function>?
		```
		
		---
		
		
		 Map of LSP method names to |lsp-handler|s.
	**/
	var handlers : Null<lua.Table<String, haxe.Constraints.Function>>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.init_options: table<string, boolean|string|number|unknown[]|nil>?
		```
		
		---
		
		LSP object definition.
		
		---
		
		
		 Values to pass in the initialization request as `initializationOptions`. See `initialize` in
		 the LSP spec.
	**/
	var init_options : Null<nvim.type.lsp.LSPObject>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.name: string?
		```
		
		---
		
		
		 Name in logs and user messages.
		 (default: client-id)
	**/
	var name : Null<String>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.offset_encoding: ('utf-16'|'utf-32'|'utf-8')?
		```
		
		---
		
		
		 Called "position encoding" in LSP spec. The encoding that the LSP server expects, used for
		 communication. Not validated. Can be modified in `on_init` before text is sent to the server.
	**/
	var offset_encoding : Null<String>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.on_attach: elem_or_list<fun(client: vim.lsp.Client, bufnr: integer)>?
		```
		
		---
		
		
		 Callback invoked when client attaches to a buffer.
		
		---
		
		```lua
		function (client: vim.lsp.Client, bufnr: integer)
		```
	**/
	var on_attach : Null<nvim.type.ElemOrList>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.on_error: fun(code: integer, err: string)?
		```
		
		---
		
		
		 Callback invoked when the client operation throws an error. `code` is a number describing the error.
		 Other arguments may be passed depending on the error kind.  See `vim.lsp.rpc.client_errors`
		 for possible errors. Use `vim.lsp.rpc.client_errors[code]` to get human-friendly name.
		
		---
		
		```lua
		function (code: integer, err: string)
		```
	**/
	var on_error : Null<(code:Int, err:String) -> Dynamic>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.on_exit: elem_or_list<fun(code: integer, signal: integer, client_id: integer)>?
		```
		
		---
		
		 Callback invoked on client exit.
		   - code: exit code of the process
		   - signal: number describing the signal used to terminate (if any)
		   - client_id: client handle
		
		---
		
		```lua
		function (code: integer, signal: integer, client_id: integer)
		```
	**/
	var on_exit : Null<nvim.type.ElemOrList>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.on_init: elem_or_list<fun(client: vim.lsp.Client, init_result: lsp.InitializeResult)>?
		```
		
		---
		
		
		 Callback invoked after LSP "initialize", where `result` is a table of `capabilities` and
		 anything else the server may send. For example, clangd sends `init_result.offsetEncoding` if
		 `capabilities.offsetEncoding` was sent to it. You can only modify the `client.offset_encoding`
		 here before any notifications are sent.
		
		---
		
		```lua
		function (client: vim.lsp.Client, init_result: lsp.InitializeResult)
		```
	**/
	var on_init : Null<nvim.type.ElemOrList>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.root_dir: string?
		```
		
		---
		
		
		 Directory where the LSP server will base its workspaceFolders, rootUri, and rootPath on initialization.
	**/
	var root_dir : Null<String>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.settings: table<string, boolean|string|number|unknown[]|nil>?
		```
		
		---
		
		LSP object definition.
		
		---
		
		
		 Map of language server-specific settings, decided by the client. Sent to the LS if requested via
		 `workspace/configuration`. Keys are case-sensitive.
	**/
	var settings : Null<nvim.type.lsp.LSPObject>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.trace: ('messages'|'off'|'verbose')?
		```
		
		---
		
		
		 Passed directly to the language server in the initialize request. Invalid/empty values will
		 (default: "off")
	**/
	var trace : Null<String>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.workspace_folders: lsp.WorkspaceFolder[]?
		```
		
		---
		
		
		 List of workspace folders passed to the language server. For backwards compatibility rootUri and
		 rootPath are derived from the first workspace folder in this list. Can be `null` if the client
		 supports workspace folders but none are configured. See `workspaceFolders` in LSP spec.
	**/
	var workspace_folders : Null<Array<nvim.type.lsp.WorkspaceFolder>>;
	/**
		```lua
		(field) vim.lsp.ClientConfig.workspace_required: boolean?
		```
		
		---
		
		
		 Server requires a workspace (no "single file" support). Note: Without
		 a workspace, cross-file features (navigation, hover) may or may not work depending on the
		 language server, even if the server doesn't require a workspace.
		 (default: `false`)
	**/
	var workspace_required : Null<Bool>;
}