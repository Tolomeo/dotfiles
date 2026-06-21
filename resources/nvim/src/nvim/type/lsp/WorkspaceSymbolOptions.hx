package nvim.type.lsp;

/**
	```lua
	(class) lsp.WorkspaceSymbolOptions
	```
	
	---
	
	Server capabilities for a {@link WorkspaceSymbolRequest}.
**/
@:structInit class WorkspaceSymbolOptions {
	/**
		```lua
		(field) lsp.WorkspaceSymbolOptions.resolveProvider: boolean?
		```
		
		---
		
		
		The server provides support to resolve additional
		information for a workspace symbol.
		
	**/
	@:optional
	extern var resolveProvider : Null<Bool>;
	/**
		```lua
		(field) lsp.WorkspaceSymbolOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	extern var workDoneProgress : Null<Bool>;
}