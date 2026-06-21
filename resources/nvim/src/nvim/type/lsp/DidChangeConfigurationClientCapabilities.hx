package nvim.type.lsp;

/**
	```lua
	(class) lsp.DidChangeConfigurationClientCapabilities
	```
**/
@:structInit class DidChangeConfigurationClientCapabilities {
	/**
		```lua
		(field) lsp.DidChangeConfigurationClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Did change configuration notification supports dynamic registration.
	**/
	@:optional
	extern var dynamicRegistration : Null<Bool>;
}