package nvim.type.lsp;

/**
	```lua
	(class) lsp.DocumentLinkClientCapabilities
	```
	
	---
	
	The client capabilities of a {@link DocumentLinkRequest}.
**/
@:structInit class DocumentLinkClientCapabilities {
	/**
		```lua
		(field) lsp.DocumentLinkClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether document link supports dynamic registration.
	**/
	@:optional
	extern var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.DocumentLinkClientCapabilities.tooltipSupport: boolean?
		```
		
		---
		
		
		Whether the client supports the `tooltip` property on `DocumentLink`.
		
	**/
	@:optional
	extern var tooltipSupport : Null<Bool>;
}