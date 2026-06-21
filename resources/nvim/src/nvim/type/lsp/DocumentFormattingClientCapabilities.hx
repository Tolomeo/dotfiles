package nvim.type.lsp;

/**
	```lua
	(class) lsp.DocumentFormattingClientCapabilities
	```
	
	---
	
	Client capabilities of a {@link DocumentFormattingRequest}.
**/
@:structInit class DocumentFormattingClientCapabilities {
	/**
		```lua
		(field) lsp.DocumentFormattingClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether formatting supports dynamic registration.
	**/
	@:optional
	extern var dynamicRegistration : Null<Bool>;
}