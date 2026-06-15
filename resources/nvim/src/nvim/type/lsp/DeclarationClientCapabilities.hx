package nvim.type.lsp;

/**
	```lua
	(class) lsp.DeclarationClientCapabilities
	```
**/
@:structInit extern class DeclarationClientCapabilities {
	/**
		```lua
		(field) lsp.DeclarationClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether declaration supports dynamic registration. If this is set to `true`
		the client supports the new `DeclarationRegistrationOptions` return value
		for the corresponding server capability as well.
	**/
	var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.DeclarationClientCapabilities.linkSupport: boolean?
		```
		
		---
		
		
		The client supports additional metadata in the form of declaration links.
	**/
	var linkSupport : Null<Bool>;
}