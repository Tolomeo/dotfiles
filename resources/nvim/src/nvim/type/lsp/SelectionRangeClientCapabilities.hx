package nvim.type.lsp;

/**
	```lua
	(class) lsp.SelectionRangeClientCapabilities
	```
**/
@:structInit extern class SelectionRangeClientCapabilities {
	/**
		```lua
		(field) lsp.SelectionRangeClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether implementation supports dynamic registration for selection range providers. If this is set to `true`
		the client supports the new `SelectionRangeRegistrationOptions` return value for the corresponding server
		capability as well.
	**/
	var dynamicRegistration : Null<Bool>;
}