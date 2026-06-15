package nvim.type.vim.lsp.start;

/**
	```lua
	(class) vim.lsp.start.Opts
	```
**/
@:structInit extern class Opts {
	/**
		```lua
		(field) vim.lsp.start.Opts.attach: boolean?
		```
		
		---
		
		
		 Whether to attach the client to a buffer (default true).
		 If set to `false`, `reuse_client` and `bufnr` will be ignored.
	**/
	var attach : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.start.Opts.bufnr: integer?
		```
		
		---
		
		
		 Buffer handle to attach to if starting or re-using a client (0 for current).
	**/
	var bufnr : Null<Int>;
	/**
		```lua
		(field) vim.lsp.start.Opts.reuse_client: (fun(client: vim.lsp.Client, config: vim.lsp.ClientConfig):boolean)?
		```
		
		---
		
		 @inlinedoc
		
		 Predicate used to decide if a client should be re-used. Used on all
		 running clients. The default implementation re-uses a client if it has the
		 same name and if the given workspace folders (or root_dir) are all included
		 in the client's workspace folders.
		
		---
		
		```lua
		function (client: vim.lsp.Client, config: vim.lsp.ClientConfig)
		  -> boolean
		```
	**/
	var reuse_client : Null<(client:nvim.type.vim.lsp.Client, config:nvim.type.vim.lsp.ClientConfig) -> Bool>;
	/**
		```lua
		(field) vim.lsp.start.Opts.silent: boolean?
		```
		
		---
		
		
		 Suppress error reporting if the LSP server fails to start (default false).
	**/
	var silent : Null<Bool>;
}