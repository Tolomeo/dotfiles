package nvim.type.lsp;

/**
	```lua
	(class) lsp.DefinitionOptions
	```
	
	---
	
	Server Capabilities for a {@link DefinitionRequest}.
**/
@:structInit class DefinitionOptions {
	/**
		```lua
		(field) lsp.DefinitionOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	extern public var workDoneProgress : Null<Bool>;
}