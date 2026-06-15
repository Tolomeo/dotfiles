package nvim.type.vim.lsp.rpc;

/**
	```lua
	(class) vim.lsp.rpc.ExtraSpawnParams
	```
	
	---
	
	 Additional context for the LSP server process.
**/
@:structInit extern class ExtraSpawnParams {
	/**
		```lua
		(field) vim.lsp.rpc.ExtraSpawnParams.cwd: string?
		```
		
		---
		
		Working directory for the LSP server process
	**/
	var cwd : Null<String>;
	/**
		```lua
		(field) vim.lsp.rpc.ExtraSpawnParams.detached: boolean?
		```
		
		---
		
		Detach the LSP server process from the current process
	**/
	var detached : Null<Bool>;
	/**
		```lua
		(field) vim.lsp.rpc.ExtraSpawnParams.env: table<string, string>?
		```
		
		---
		
		Additional environment variables for LSP server process. See |vim.system()|
	**/
	var env : Null<lua.Table<String, String>>;
}