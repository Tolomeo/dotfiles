package nvim.type.lsp;

/**
	```lua
	(class) lsp.LinkedEditingRangeClientCapabilities
	```
	
	---
	
	Client capabilities for the linked editing range request.
	
**/
@:structInit extern class LinkedEditingRangeClientCapabilities {
	/**
		```lua
		(field) lsp.LinkedEditingRangeClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether implementation supports dynamic registration. If this is set to `true`
		the client supports the new `(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
		return value for the corresponding server capability as well.
	**/
	var dynamicRegistration : Null<Bool>;
}