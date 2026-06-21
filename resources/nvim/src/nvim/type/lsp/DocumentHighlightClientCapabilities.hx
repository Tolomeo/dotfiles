package nvim.type.lsp;

/**
	```lua
	(class) lsp.DocumentHighlightClientCapabilities
	```
	
	---
	
	Client Capabilities for a {@link DocumentHighlightRequest}.
**/
@:structInit class DocumentHighlightClientCapabilities {
	/**
		```lua
		(field) lsp.DocumentHighlightClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether document highlight supports dynamic registration.
	**/
	@:optional
	extern var dynamicRegistration : Null<Bool>;
}