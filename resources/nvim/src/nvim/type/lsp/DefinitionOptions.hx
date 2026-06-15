package nvim.type.lsp;

/**
	```lua
	(class) lsp.DefinitionOptions
	```
	
	---
	
	Server Capabilities for a {@link DefinitionRequest}.
**/
@:structInit extern class DefinitionOptions {
	/**
		```lua
		(field) lsp.DefinitionOptions.workDoneProgress: boolean?
		```
	**/
	var workDoneProgress : Null<Bool>;
}