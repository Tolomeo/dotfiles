package nvim.type.lsp;

/**
	```lua
	(class) lsp.DefinitionClientCapabilities
	```
	
	---
	
	Client Capabilities for a {@link DefinitionRequest}.
**/
@:structInit class DefinitionClientCapabilities {
	/**
		```lua
		(field) lsp.DefinitionClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether definition supports dynamic registration.
	**/
	@:optional
	extern var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.DefinitionClientCapabilities.linkSupport: boolean?
		```
		
		---
		
		
		The client supports additional metadata in the form of definition links.
		
	**/
	@:optional
	extern var linkSupport : Null<Bool>;
}