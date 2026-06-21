package nvim.type.lsp;

/**
	```lua
	(class) lsp.DocumentColorClientCapabilities
	```
**/
@:structInit class DocumentColorClientCapabilities {
	/**
		```lua
		(field) lsp.DocumentColorClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether implementation supports dynamic registration. If this is set to `true`
		the client supports the new `DocumentColorRegistrationOptions` return value
		for the corresponding server capability as well.
	**/
	@:optional
	extern var dynamicRegistration : Null<Bool>;
}