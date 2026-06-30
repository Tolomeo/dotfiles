package nvim.type.lsp;

/**
	```lua
	(class) lsp.DocumentSymbolOptions
	```
	
	---
	
	Provider options for a {@link DocumentSymbolRequest}.
**/
@:structInit class DocumentSymbolOptions {
	/**
		```lua
		(field) lsp.DocumentSymbolOptions.label: string?
		```
		
		---
		
		
		A human-readable string that is shown when multiple outlines trees
		are shown for the same document.
		
	**/
	@:optional
	extern public var label : Null<String>;
	/**
		```lua
		(field) lsp.DocumentSymbolOptions.workDoneProgress: boolean?
		```
	**/
	@:optional
	extern public var workDoneProgress : Null<Bool>;
}