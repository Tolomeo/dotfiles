package nvim.type.lsp;

/**
	```lua
	(class) lsp.ExecuteCommandParams
	```
	
	---
	
	The parameters of a {@link ExecuteCommandRequest}.
**/
@:structInit class ExecuteCommandParams {
	/**
		```lua
		(field) lsp.ExecuteCommandParams.arguments: boolean|string|number|table<string, lsp.LSPAny>|table<string, lsp.LSPAny>[]|nil[]?
		```
		
		---
		
		
		Arguments that the command should be invoked with.
	**/
	@:optional
	extern public var arguments : Null<lua.Table<Int, nvim.type.lsp.LSPAny>>;
	/**
		```lua
		(field) lsp.ExecuteCommandParams.command: string
		```
		
		---
		
		
		The identifier of the actual command handler.
	**/
	extern public var command : String;
	/**
		```lua
		(field) lsp.ExecuteCommandParams.workDoneToken: (string|integer)?
		```
		
		---
		
		
		An optional token that a server can use to report work done progress.
	**/
	@:optional
	extern public var workDoneToken : Null<nvim.type.lsp.ProgressToken>;
}