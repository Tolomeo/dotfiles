package nvim.type.lsp;

/**
	```lua
	(class) lsp.TextDocumentFilterClientCapabilities
	```
**/
@:structInit extern class TextDocumentFilterClientCapabilities {
	/**
		```lua
		(field) lsp.TextDocumentFilterClientCapabilities.relativePatternSupport: boolean?
		```
		
		---
		
		
		The client supports Relative Patterns.
		
	**/
	var relativePatternSupport : Null<Bool>;
}