package nvim.type.lsp;

/**
	```lua
	(class) lsp.ImplementationClientCapabilities
	```
**/
@:structInit class ImplementationClientCapabilities {
	/**
		```lua
		(field) lsp.ImplementationClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether implementation supports dynamic registration. If this is set to `true`
		the client supports the new `ImplementationRegistrationOptions` return value
		for the corresponding server capability as well.
	**/
	@:optional
	extern public var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.ImplementationClientCapabilities.linkSupport: boolean?
		```
		
		---
		
		
		The client supports additional metadata in the form of definition links.
		
	**/
	@:optional
	extern public var linkSupport : Null<Bool>;
}