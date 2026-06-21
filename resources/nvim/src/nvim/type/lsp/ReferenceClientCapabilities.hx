package nvim.type.lsp;

/**
	```lua
	(class) lsp.ReferenceClientCapabilities
	```
	
	---
	
	Client Capabilities for a {@link ReferencesRequest}.
**/
@:structInit class ReferenceClientCapabilities {
	/**
		```lua
		(field) lsp.ReferenceClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether references supports dynamic registration.
	**/
	@:optional
	extern var dynamicRegistration : Null<Bool>;
}