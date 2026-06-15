package nvim.type.lsp;

/**
	```lua
	(class) lsp.DocumentSymbolOptions
	```
	
	---
	
	Provider options for a {@link DocumentSymbolRequest}.
**/
@:structInit extern class DocumentSymbolOptions {
	/**
		```lua
		(field) lsp.DocumentSymbolOptions.label: string?
		```
		
		---
		
		
		A human-readable string that is shown when multiple outlines trees
		are shown for the same document.
		
	**/
	var label : Null<String>;
	/**
		```lua
		(field) lsp.DocumentSymbolOptions.workDoneProgress: boolean?
		```
	**/
	var workDoneProgress : Null<Bool>;
}