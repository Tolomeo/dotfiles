package nvim.type.lsp;

/**
	```lua
	(class) lsp.DocumentLinkClientCapabilities
	```
	
	---
	
	The client capabilities of a {@link DocumentLinkRequest}.
**/
@:structInit extern class DocumentLinkClientCapabilities {
	/**
		```lua
		(field) lsp.DocumentLinkClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether document link supports dynamic registration.
	**/
	var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.DocumentLinkClientCapabilities.tooltipSupport: boolean?
		```
		
		---
		
		
		Whether the client supports the `tooltip` property on `DocumentLink`.
		
	**/
	var tooltipSupport : Null<Bool>;
}