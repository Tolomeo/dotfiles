package nvim.type.lsp;

/**
	```lua
	(class) lsp.DidChangeConfigurationClientCapabilities
	```
**/
@:structInit extern class DidChangeConfigurationClientCapabilities {
	/**
		```lua
		(field) lsp.DidChangeConfigurationClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Did change configuration notification supports dynamic registration.
	**/
	var dynamicRegistration : Null<Bool>;
}