package nvim.type.lsp;

/**
	```lua
	(class) lsp.Command
	```
	
	---
	
	Represents a reference to a command. Provides a title which
	will be used to represent a command in the UI and, optionally,
	an array of arguments which will be passed to the command handler
	function when invoked.
**/
@:structInit extern class Command {
	/**
		```lua
		(field) lsp.Command.arguments: boolean|string|number|table<string, lsp.LSPAny>|table<string, lsp.LSPAny>[]|nil[]?
		```
		
		---
		
		
		Arguments that the command handler should be
		invoked with.
	**/
	var arguments : Null<Array<nvim.type.lsp.LSPAny>>;
	/**
		```lua
		(field) lsp.Command.command: string
		```
		
		---
		
		
		The identifier of the actual command handler.
	**/
	var command : String;
	/**
		```lua
		(field) lsp.Command.title: string
		```
		
		---
		
		
		Title of the command, like `save`.
	**/
	var title : String;
	/**
		```lua
		(field) lsp.Command.tooltip: string?
		```
		
		---
		
		
		An optional tooltip.
		
	**/
	var tooltip : Null<String>;
}