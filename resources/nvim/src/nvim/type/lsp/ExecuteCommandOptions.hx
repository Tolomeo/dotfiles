package nvim.type.lsp;

/**
	```lua
	(class) lsp.ExecuteCommandOptions
	```
	
	---
	
	The server capabilities of a {@link ExecuteCommandRequest}.
**/
@:structInit class ExecuteCommandOptions {
	/**
		```lua
		(field) lsp.ExecuteCommandOptions.commands: string[]
		```
		
		---
		
		
		The commands to be executed on the server
	**/
	extern var commands : Array<String>;
	/**
		```lua
		(field) lsp.ExecuteCommandOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	extern var workDoneProgress : Null<Bool>;
}