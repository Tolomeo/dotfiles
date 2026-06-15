package nvim.type.lsp;

/**
	```lua
	(class) lsp.DocumentOnTypeFormattingClientCapabilities
	```
	
	---
	
	Client capabilities of a {@link DocumentOnTypeFormattingRequest}.
**/
@:structInit extern class DocumentOnTypeFormattingClientCapabilities {
	/**
		```lua
		(field) lsp.DocumentOnTypeFormattingClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether on type formatting supports dynamic registration.
	**/
	var dynamicRegistration : Null<Bool>;
}