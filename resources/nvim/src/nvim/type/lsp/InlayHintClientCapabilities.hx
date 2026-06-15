package nvim.type.lsp;

/**
	```lua
	(class) lsp.InlayHintClientCapabilities
	```
	
	---
	
	Inlay hint client capabilities.
	
**/
@:structInit extern class InlayHintClientCapabilities {
	/**
		```lua
		(field) lsp.InlayHintClientCapabilities.dynamicRegistration: boolean?
		```
		
		---
		
		
		Whether inlay hints support dynamic registration.
	**/
	var dynamicRegistration : Null<Bool>;
	/**
		```lua
		(field) lsp.InlayHintClientCapabilities.resolveSupport: (lsp.ClientInlayHintResolveOptions)?
		```
		
		---
		
		
		Indicates which properties a client can resolve lazily on an inlay
		hint.
	**/
	var resolveSupport : Null<nvim.type.lsp.ClientInlayHintResolveOptions>;
}