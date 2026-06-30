package nvim.type.lsp;

/**
	```lua
	(class) lsp.TypeDefinitionClientCapabilities
	```
	
	---
	
	Since 3.6.0
**/
@:structInit class TypeDefinitionClientCapabilities {
	/**
		```lua
		(field) lsp.TypeDefinitionClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether implementation supports dynamic registration. If this is set to `true`
		the client supports the new `TypeDefinitionRegistrationOptions` return value
		for the corresponding server capability as well.
	**/
	@:optional
	extern public var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.TypeDefinitionClientCapabilities.linkSupport: boolean?
		```
		
		---
		
		
		The client supports additional metadata in the form of definition links.
		
		Since 3.14.0
	**/
	@:optional
	extern public var linkSupport : Null<Bool>;
}