package nvim.type.lsp;

/**
	```lua
	(class) lsp.ReferenceClientCapabilities
	```
	
	---
	
	Client Capabilities for a {@link ReferencesRequest}.
**/
@:structInit extern class ReferenceClientCapabilities {
	/**
		```lua
		(field) lsp.ReferenceClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether references supports dynamic registration.
	**/
	var dynamicRegistration : Null<Bool>;
}