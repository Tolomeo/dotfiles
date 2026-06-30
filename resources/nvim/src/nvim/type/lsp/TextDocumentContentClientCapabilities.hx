package nvim.type.lsp;

/**
	```lua
	(class) lsp.TextDocumentContentClientCapabilities
	```
	
	---
	
	Client capabilities for a text document content provider.
	
**/
@:structInit class TextDocumentContentClientCapabilities {
	/**
		```lua
		(field) lsp.TextDocumentContentClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Text document content provider supports dynamic registration.
	**/
	@:optional
	extern public var dynamicRegistration : Null<Bool>;
}