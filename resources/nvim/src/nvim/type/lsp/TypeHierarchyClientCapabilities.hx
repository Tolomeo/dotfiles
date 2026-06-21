package nvim.type.lsp;

/**
	```lua
	(class) lsp.TypeHierarchyClientCapabilities
	```
**/
@:structInit class TypeHierarchyClientCapabilities {
	/**
		```lua
		(field) lsp.TypeHierarchyClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether implementation supports dynamic registration. If this is set to `true`
		the client supports the new `(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
		return value for the corresponding server capability as well.
	**/
	@:optional
	extern var dynamicRegistration : Null<Bool>;
}