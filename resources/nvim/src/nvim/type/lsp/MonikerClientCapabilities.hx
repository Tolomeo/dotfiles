package nvim.type.lsp;

/**
	```lua
	(class) lsp.MonikerClientCapabilities
	```
	
	---
	
	Client capabilities specific to the moniker request.
	
**/
@:structInit class MonikerClientCapabilities {
	/**
		```lua
		(field) lsp.MonikerClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether moniker supports dynamic registration. If this is set to `true`
		the client supports the new `MonikerRegistrationOptions` return value
		for the corresponding server capability as well.
	**/
	@:optional
	extern public var dynamicRegistration : Null<Bool>;
}