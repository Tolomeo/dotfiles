package nvim.type.lsp;

/**
	```lua
	(class) lsp.TextDocumentFilterClientCapabilities
	```
**/
@:structInit class TextDocumentFilterClientCapabilities {
	/**
		```lua
		(field) lsp.TextDocumentFilterClientCapabilities.relativePatternSupport: boolean?
		```
		
		---
		
		
		The client supports Relative Patterns.
		
	**/
	@:optional
	extern public var relativePatternSupport : Null<Bool>;
}